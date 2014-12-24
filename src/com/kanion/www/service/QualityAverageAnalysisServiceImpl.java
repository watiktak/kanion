/**
* Filename: QualityAverageAnalysisServiceImpl.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年12月3日  下午9:08:23
* Description:
*
* 
*/
package com.kanion.www.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanion.www.dao.QualityAverageAnalysisMapper;
import com.kanion.www.model.GardeniaExtration;
import com.kanion.www.model.UserColComments;
import com.kanion.www.model.UserTableComments;
import com.kanion.www.util.HighchartUtil;
import com.kanion.www.util.MapUtil;
import com.kanion.www.util.TempretureUtil;

/**
 * @ClassName: QualityAverageAnalysisServiceImpl
 * @Description: TODO
 * @date 2014年12月3日 下午9:08:23
 *
 */
@Service("QualityAverageAnalysisService")
public class QualityAverageAnalysisServiceImpl implements
		QualityAverageAnalysisService {

	private UserTableCommentsService userTableCommentsService;
	private UserColCommentsService userColCommentsService;
	private QualityAverageAnalysisMapper qualityAverageAnalysisMapper;
	@Autowired
	public void setUserTableCommentsService(
			UserTableCommentsService userTableCommentsService) {
		this.userTableCommentsService = userTableCommentsService;
	}
	@Autowired
	public void setUserColCommentsService(
			UserColCommentsService userColCommentsService) {
		this.userColCommentsService = userColCommentsService;
	}
	@Autowired
	public void setQualityAverageAnalysisMapper(
			QualityAverageAnalysisMapper qualityAverageAnalysisMapper) {
		this.qualityAverageAnalysisMapper = qualityAverageAnalysisMapper;
	}

	/* (non-Javadoc)
	 * @see com.kanion.www.service.QualityAverageAnalysisService#initTables()
	 */
	@Override
	public Map<String, List<String>> initTables() {
		Map<String,List<String>> returnData=new HashMap<String,List<String>>();
		List<String> engName=new ArrayList<String>();
		List<String> chName=new ArrayList<String>();
		List<UserTableComments> utc=userTableCommentsService.selectProductionTable();
		for(UserTableComments item:utc){
			engName.add(item.getTableName());
			chName.add(item.getComments());
		}		
		returnData.put("engName", engName);
		returnData.put("chName", chName);		
		return returnData;
	}

	/* (non-Javadoc)
	 * @see com.kanion.www.service.QualityAverageAnalysisService#initBatchNos(java.lang.String)
	 */
	@Override
	public Map<String, List<BigDecimal>> initBatchNos(String tableName) {
		Map<String,List<BigDecimal>> returnData=new HashMap<String,List<BigDecimal>>();
		System.out.println(tableName);
		List<BigDecimal> batchNos=qualityAverageAnalysisMapper.selectBatchNos(tableName);		
		returnData.put("batchNos",batchNos);
		System.out.println("获取"+tableName+"批号成功：" + batchNos.get(0)+"-"+batchNos.get(batchNos.size()-1));
		return returnData;
	
	}
	
	/**
	 * 根据列的英文名获取中文名
	 */
	public String getColChName(String engName,List<UserColComments> userColComments){
		for(int i=0;i<userColComments.size();i++){
			if(userColComments.get(i).getColumnName().compareTo(engName)==0){
				return userColComments.get(i).getComments();
			}
		}
		return null;
	}
	
	
	public Map<String,Object> qualityAverageAnalysis(String tableName,Integer minBatchNo,Integer maxBatchNo){
		//总的返回数据
		Map<String,Object> returnData=null;
		//获取表的列名信息
		List<UserColComments> userColComments=userColCommentsService.selectByTableName(tableName);
		//获取对应工段区间的记录集合
		List<Map> records=qualityAverageAnalysisMapper.selectByBatchNoSection(tableName, minBatchNo, maxBatchNo);
		//所有记录（数字属性）的和
		Map sum=null;
		//所有记录（数字属性）的均值
		Map average=null;
		int totleRecords =records.size();
		if(0!=totleRecords){
			returnData=new HashMap<String,Object>();
			//从列名信息userColComments中设置返回的数据结构,每个列都有一个列表
			for(UserColComments userColComment:userColComments){
				returnData.put(userColComment.getColumnName(), new ArrayList<Object>());
			}
			//统计质量均值
			for(int i=0;i<totleRecords;i++){
				if(null==sum) sum=records.get(i);
				else sum=MapUtil.add(sum, records.get(i));			
			}
			if(null!=sum) average=MapUtil.divide(sum, totleRecords);
			//获取表中各批次各字段的数据			
			for(int i=0;i<totleRecords;i++){				
				Set<Map.Entry> record=records.get(i).entrySet();
				for(Iterator cols=record.iterator();cols.hasNext();){
					Map.Entry col=(Map.Entry) cols.next();
					((ArrayList<Object>)returnData.get(col.getKey())).add(col.getValue());
				}
			}
			/*******************************************************************************************
			 * 											均值分析
			 *******************************************************************************************/
			HighchartUtil avgChart=new HighchartUtil();
			//X轴目录(批号)		
			avgChart.getTitle().setText(userTableCommentsService.selectTableChName(tableName)+"质量均值分析");
			avgChart.getxAxis().setCategories((List<Object>)returnData.get("batchNo"));
			
			//干膏
			if(returnData.containsKey("dryConcreteWeight")){
				HighchartUtil.Series dryConcreteWeightSeries=new HighchartUtil.Series();
				String chName=getColChName("dryConcreteWeight",userColComments);
				if(chName!=null){
					dryConcreteWeightSeries.setName(chName);	
				}
				dryConcreteWeightSeries.setData((List<Object>)returnData.get("dryConcreteWeight"));
				avgChart.getSeries().add(dryConcreteWeightSeries);
				
				//干膏均值标示线
				HighchartUtil.PlotLine avgdryConcreteWeightPotline=new HighchartUtil.PlotLine();
				avgdryConcreteWeightPotline.setValue((double)average.get("dryConcreteWeight"));
				avgdryConcreteWeightPotline.setColor("red");
				avgdryConcreteWeightPotline.getLabel().setText(chName+"均值");
				avgChart.getyAxis().getPlotLines().add(avgdryConcreteWeightPotline);
			}
			//含量
			if(returnData.containsKey("content")){
				HighchartUtil.Series contentSeries=new HighchartUtil.Series();
				String chName=getColChName("content",userColComments);
				if(chName!=null) contentSeries.setName(chName);		
				contentSeries.setData((List<Object>)returnData.get("content"));
				avgChart.getSeries().add(contentSeries);
				//含量均值标示线
				HighchartUtil.PlotLine avgContentPotline=new HighchartUtil.PlotLine();
				avgContentPotline.setValue((double)average.get("content"));
				avgContentPotline.setColor("red");
				avgContentPotline.getLabel().setText(chName+"均值");
				avgChart.getyAxis().getPlotLines().add(avgContentPotline);
			}
			//浸膏量
			if(returnData.containsKey("extractWeight")){
				HighchartUtil.Series extractWeightSeries=new HighchartUtil.Series();
				String chName=getColChName("extractWeight",userColComments);
				if(chName!=null) extractWeightSeries.setName(chName);		
				extractWeightSeries.setData((List<Object>)returnData.get("extractWeight"));
				avgChart.getSeries().add(extractWeightSeries);
				//浸膏量均值标示线
				HighchartUtil.PlotLine avgExtractWeightPotline=new HighchartUtil.PlotLine();
				avgExtractWeightPotline.setValue(((BigDecimal)average.get("extractWeight")).doubleValue());
				avgExtractWeightPotline.setColor("red");
				avgExtractWeightPotline.getLabel().setText(chName+"均值");
				avgChart.getyAxis().getPlotLines().add(avgExtractWeightPotline);
			}
			returnData.put("avgChart", avgChart);
			
		
			/*******************************************************************************************
			 * 							与干膏相关性较大的控制参数，需调用相关性分析算子
			 *******************************************************************************************/
			if(returnData.containsKey("dryConcreteWeight")){
				//调用算子，得到相关参数，此处由于算子未完成，暂用固定值代替
				List<String> avgs=new ArrayList<String>();
				avgs.add("HCLVolume");
				avgs.add("extractionWeight");
				avgs.add("cyclingMinKPA");
				avgs.add("scraperEnrichmentMinKPA");
				avgs.add("wetConcreteWeight");
				avgs.add("dryMaxTempreture");
				returnData.put("avgRelatedToDryConcreteWeightChart", getAvgCorrelationChart(returnData,tableName,"dryConcreteWeight",avgs,userTableCommentsService,userColComments ));
			}
			
			/*******************************************************************************************
			 * 							与含量相关性较大的控制参数，需调用相关性分析算子
			 *******************************************************************************************/
			if(returnData.containsKey("content")){
				//调用算子，得到相关参数，此处由于算子未完成，暂用固定值代替
				List<String> avgs=new ArrayList<String>();
				avgs.add("extractionTempreture");
				avgs.add("cyclingMaxTempreture");
				avgs.add("cyclingMinKPA");
				returnData.put("avgRelatedToContentChart", getAvgCorrelationChart(returnData,tableName,"content",avgs,userTableCommentsService,userColComments ));
			}
			
			
			/*******************************************************************************************
			 * 							与浸膏量相关性较大的控制参数，需调用相关性分析算子
			 *******************************************************************************************/
			if(returnData.containsKey("extractWeight")){
				//调用算子，得到相关参数，此处由于算子未完成，暂用固定值代替
				List<String> avgs=new ArrayList<String>();
				avgs.add("extractionTemperature");
				avgs.add("secondBackflowMaxTempreture");
				returnData.put("avgRelatedToExtractWeightChart", getAvgCorrelationChart(returnData,tableName,"extractWeight",avgs,userTableCommentsService,userColComments ));
			}
		}		
		return returnData;
	}

	
	public HighchartUtil getAvgCorrelationChart(Map<String,Object> returnData,String tableName,String keyField,List<String> avgs,UserTableCommentsService userTableCommentsService,List<UserColComments> userColComments ){
		if(returnData.containsKey(keyField)){
			// 构建返回的图表
			HighchartUtil avgRelatedToKeyFieldChart=new HighchartUtil();
			//X轴目录			
			avgRelatedToKeyFieldChart.getTitle().setText(userTableCommentsService.selectTableChName(tableName)+getColChName(keyField,userColComments)+"相关性分析");
			avgRelatedToKeyFieldChart.getxAxis().setCategories((List<Object>)returnData.get("batchNo"));
			for(String item:avgs){
				HighchartUtil.Series tmp=new HighchartUtil.Series();
				tmp.setName(getColChName(item,userColComments));
				tmp.setData((List<Object>)returnData.get(item));
				avgRelatedToKeyFieldChart.getSeries().add(tmp);
			}
			return avgRelatedToKeyFieldChart;
		}
		
		return null;
	}
	
}
