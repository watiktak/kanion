package com.kanion.www.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.kanion.www.model.analysis.trend.MokeTableImpl;
import com.kanion.www.model.analysis.yield.Intermidate;
import com.kanion.www.model.analysis.yield.TypeName;
import com.kanion.www.model.analysis.yield.YieldAnalysisSelect;

@Service("YieldAnalysisServiceImpl")
public class YieldAnalysisServiceImpl implements YieldAnalysisService {

	static Logger logger=Logger.getLogger(YieldAnalysisServiceImpl.class.getName());
	private YieldAnalysisSelect mYieldAnalysisSelect=YieldAnalysisSelect.INSTANCE;
	
	
	/* (获取数据库中所有品名)
	 * @see com.kanion.www.service.TrendAnalysisService#getTypeName()
	 */
	@Override
	public List<String> getTypeNames() {
		List<String> typeNamesString=null;
		List<TypeName> typeNames=mYieldAnalysisSelect.getTypeNames();
		if(null!=typeNames){
			typeNamesString=new ArrayList<String>();
			for(MokeTableImpl<Intermidate> tn:typeNames){
				typeNamesString.add(tn.getName());
			}
		}
		return typeNamesString;
	}

	
	/* (获取品名对应的中间体和项目)
	 * @see com.kanion.www.service.TrendAnalysisService#getProcesses(java.lang.String)
	 */
	@Override
	public List<String> getIntermidates(String typeName) {
		List<String> ret=null;
		List<TypeName> typeNames=mYieldAnalysisSelect.getTypeNames();
		
		TypeName targetTypeName=getTypeNameByName(typeNames, typeName);
		
		if(null!=targetTypeName){
		
			ret=targetTypeName.getSubTableNames();
		}
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

}
