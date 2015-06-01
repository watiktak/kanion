/**
* Filename: TrendAnalysisServiceImpl.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月11日  下午4:09:47
* Description:
*
* 
*/
package com.kanion.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanion.www.dao.TrendAnalysisSelectMapper;
import com.kanion.www.highchart.Spline;
import com.kanion.www.model.analysis.trend.Argument;
import com.kanion.www.model.analysis.trend.MokeTableImpl;
import com.kanion.www.model.analysis.trend.Phase;
import com.kanion.www.model.analysis.trend.Process;
import com.kanion.www.model.analysis.trend.TrendAnalysisSelect;
import com.kanion.www.model.analysis.trend.TypeName;

/**
 * @ClassName: TrendAnalysisServiceImpl
 * @Description: TrendAnalysisSelect与service分开写，可以修改TrendAnalysisSelect中存储的文件类型，
 * 不论是XML/JSON都可以，只要将查询关系抽象成类TrendAnalysisSelect即可
 * @date 2015年5月11日 下午4:09:47
 *
 */
@Service("TrendAnalysisServiceImpl")
public class TrendAnalysisServiceImpl implements TrendAnalysisService{
	static Logger logger=Logger.getLogger(TrendAnalysisServiceImpl.class.getName());
	private TrendAnalysisSelect mTrendAnalysisSelect=TrendAnalysisSelect.INSTANCE;
//	private TrendAnalysisSelectMapper mTrendAnalysisSelectMapper;
//	
//	@Autowired
//	public void setmTrendAnalysisSelectMapper(
//			TrendAnalysisSelectMapper mTrendAnalysisSelectMapper) {
//		this.mTrendAnalysisSelectMapper = mTrendAnalysisSelectMapper;
//	}


	/* (获取数据库中所有品名)
	 * @see com.kanion.www.service.TrendAnalysisService#getTypeName()
	 */
	@Override
	public List<String> getTypeNames() {
		List<String> typeNamesString=null;
		List<TypeName> typeNames=mTrendAnalysisSelect.getTypeNames();
		if(null!=typeNames){
			typeNamesString=new ArrayList<String>();
			for(MokeTableImpl<Process> tn:typeNames){
				typeNamesString.add(tn.getName());
			}
		}
		return typeNamesString;
	}
	
	
	/*
	 * (获取品名对应的批号)
	 * @see com.kanion.www.service.TrendAnalysisService#getBatchNos(java.lang.String)
	 */
	@Override
	public List<String> getBatchNos(String typeName){
		List<String> ret=null;
		String batchTableName=mTrendAnalysisSelect.getBatchTableName();
		String batchNoTableName=mTrendAnalysisSelect.getBatchNoColName();
		String typeNameTableName=null;
		
		List<TypeName> typeNames=mTrendAnalysisSelect.getTypeNames();
		
		TypeName targetTypeName=getTypeNameByName(typeNames, typeName);
		if(null!=targetTypeName){
			typeNameTableName=targetTypeName.getColName();
		}
		
		logger.info("获取品名("+typeName+")对应的批号和工序/工段，批表("+batchTableName+"),批号列名("+batchNoTableName+"),品名列名("+typeNameTableName+")");
		logger.info("数据库未接入，批号获取失败！生成模拟批号");
		ret=new ArrayList<String>();
		ret.add("Z150603");
		ret.add("Z150602");
		ret.add("Z150601");
		ret.add("Z150508");
		ret.add("Z150507");
		ret.add("Z150506");	
		ret.add("Z150505");
		ret.add("Z150504");
		ret.add("Z150503");	
		ret.add("Z150502");
		ret.add("Z150501");
		//ret=mTrendAnalysisSelectMapper.getBatchNos(batchTableName, batchNoTableName, typeNameTableName, typeName);
		return ret;
	}



	/* (获取品名对应的工序/工段)
	 * @see com.kanion.www.service.TrendAnalysisService#getProcesses(java.lang.String)
	 */
	@Override
	public List<String> getProcesses(String typeName) {
		List<String> ret=null;
		List<TypeName> typeNames=mTrendAnalysisSelect.getTypeNames();
		
		TypeName targetTypeName=getTypeNameByName(typeNames, typeName);
		
		if(null!=targetTypeName)
			ret=targetTypeName.getSubTableNames();
		return ret;
	}

	
	
	/**
	* @Title: getTypeNameByName
	* @Description: 使用name从typeNames列表中找到对应的TypeName表
	* @param @param typeNames
	* @param @param name
	* @param @return    
	* @return TypeName    
	* @throws
	 */
	private TypeName getTypeNameByName(List<TypeName> typeNames,String name){
		TypeName ret=null;
		if(null!=typeNames && null!=name){
			for(TypeName e:typeNames){
				if(name.equals(e.getName())){
					ret=e;
					break;
				}
			}
		}
		return ret;
	}

	/* (根据品名和工段获取阶段列表)
	 * @see com.kanion.www.service.TrendAnalysisService#getPhases(java.lang.String, java.lang.String)
	 */
	@Override
	public List<String> getPhases(String typeName, String process) {
		List<String> ret=null;
		List<TypeName> typeNames=mTrendAnalysisSelect.getTypeNames();
		com.kanion.www.model.analysis.trend.Process targetProcess=null;
		
		TypeName targetTypeName=getTypeNameByName(typeNames, typeName);
		if(null!=targetTypeName)
			targetProcess=targetTypeName.getSubTableByName(process);
		if(null!= targetProcess)
			ret =targetProcess.getSubTableNames();
		return ret;
	}


	/* (根据品名、工段、工序获取参数，若工序有多个，选择交集)
	 * @see com.kanion.www.service.TrendAnalysisService#getArguments(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public List<String> getArguments(String typeName, String process,
			String[] phases) {
		Set<String> original=null;
		List<String> ret=null;
		
		List<TypeName> typeNames=mTrendAnalysisSelect.getTypeNames();
		TypeName targetTypeName=null;
		com.kanion.www.model.analysis.trend.Process targetProcess=null;
		Phase targetPhase=null;
		if(typeNames!=null)		
			targetTypeName=getTypeNameByName(typeNames, typeName);
		if(null!=targetTypeName)
			targetProcess=targetTypeName.getSubTableByName(process);
		
		
		if(null!=targetProcess){
			for(String p:phases){
				targetPhase=targetProcess.getSubTableByName(p);
				if(null!=targetPhase){
					List<String> arguments=targetPhase.getSubTableNames();
					if(original==null){
						original=new HashSet<String>();
						original.addAll(arguments);
					}else{
						original.retainAll(arguments);
					}
				}
			}
		}
		if(null!=original){
			ret=new ArrayList<String>();
			for(Iterator<String> iter=original.iterator();iter.hasNext();){
				ret.add(iter.next());
			}
		}
		return ret;
	}


	
	
	/* (根据品名、工段、工序（可能多个）、参数创建图表)
	 * @see com.kanion.www.service.TrendAnalysisService#getChart(java.lang.String, java.lang.String, java.lang.String[], java.lang.String)
	 */
	@Override
	public Spline getChart(String typeName, String process, String[] phases,
			String argument) {
		List<TypeName> typeNames=mTrendAnalysisSelect.getTypeNames();
		
		TypeName targetTypeName=null;		
		if(typeNames!=null)		
			targetTypeName=getTypeNameByName(typeNames, typeName);
		
		com.kanion.www.model.analysis.trend.Process targetProcess=null;
		if(null!=targetTypeName)
			targetProcess=targetTypeName.getSubTableByName(process);
		
		List<Phase> targetPhases=new ArrayList<Phase>();
		
		for(String p:phases){
			targetPhases.add(targetProcess.getSubTableByName(p));
		}
		
		//将相应的阶段和生产参数放入Map键值对
		Map<Phase,Argument> map=null;
		int argumentType=0;
		if(targetPhases.size()>0){
			map=new HashMap<Phase,Argument>();
			for(Phase p:targetPhases){
				Argument targetArgument=p.getSubTableByName(argument);
				if(null!=targetArgument){
					argumentType=targetArgument.getType();
				}
				map.put(p,targetArgument);
			}
		}
		
		
		//曲线型
		if(1==argumentType){
			return getSpline(targetTypeName,targetProcess,map);
		}
		
		return null;
	}


	/**
	* @Title: getSpline未完成
	* @Description: 构建时间时序表
	* @param @param targetTypeName
	* @param @param targetProcess
	* @param @param map
	* @param @return    
	* @return Spline    
	* @throws
	*/
	private Spline getSpline(TypeName targetTypeName, Process targetProcess,
			Map<Phase, Argument> map) {
		if(null==targetTypeName || null==targetProcess || null== map)
			return null;
		Spline ret=new Spline();
		String yString=null;
		//设置标题
		StringBuilder sb=new StringBuilder();
		sb.append(targetTypeName.getName()+targetProcess.getName()+"(");
		
		boolean isFirst=true;
		String argString=null;
		for(Map.Entry<Phase, Argument> entry:map.entrySet()){
			if(isFirst){
				isFirst=false;
				argString=entry.getValue().getName();
				yString=argString;
				sb.append(entry.getKey().getName());
			}else
				sb.append(","+entry.getKey().getName());
		}
		
		sb.append(")的"+argString+"趋势");
		ret.getTitle().setText(sb.toString());
		
		//设置Y轴名字
		ret.getyAxis().getTitle().setText(yString);
		
		
		
		
		
		return ret;
	}


	@Override
	public Spline getDemoChart(String typeName, String process,
			String[] phases, String argument) {

		
		
		return null;
	}
	
	
	

}
