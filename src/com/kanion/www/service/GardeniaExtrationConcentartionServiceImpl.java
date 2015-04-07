/**
* Filename: GardeniaExtrationConcentartionServiceImpl.java
* Project Name: kanion
* @author: cyz	63954008(at)qq.com
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年11月24日  下午2:03:07
* Description:栀子提取浓缩数据表的相关操作
*
* Modification History:
* Date			Author		Version		Description
* ------------------------------------------------------------------
* 2014年11月24日	cyz    		1.0			1.0 Version
*/
package com.kanion.www.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kanion.www.dao.GardeniaExtrationConcentartionMapper;
import com.kanion.www.model.GardeniaExtrationConcentartion;
import com.kanion.www.util.ArithUtil;
import com.kanion.www.util.HighchartUtil;
import com.kanion.www.util.TempretureUtil;
import com.kanion.www.util.Util;

/**
 * @ClassName: GardeniaExtrationConcentartionServiceImpl
 * @Description: TODO
 * @date 2014年11月24日 下午2:03:07
 *
 */
@Service("GardeniaExtrationConcentartionService")
public class GardeniaExtrationConcentartionServiceImpl implements
		GardeniaExtrationConcentartionService {

	private GardeniaExtrationConcentartionMapper gardeniaExtrationConcentartionMapper;
	
	@Autowired
	public void setGardeniaExtrationConcentartionMapper(
			GardeniaExtrationConcentartionMapper gardeniaExtrationConcentartionMapper) {
		this.gardeniaExtrationConcentartionMapper = gardeniaExtrationConcentartionMapper;
	}

	/* (从数据库中选择栀子提取浓缩数据表全部的记录)
	 * @see com.kanion.www.service.GardeniaExtrationConcentartionService#selectAll()
	 */
	@Override
	public List<GardeniaExtrationConcentartion> selectAll() {
		return gardeniaExtrationConcentartionMapper.selectAll();
	}

	/* (从栀子提取浓缩数据表获取所有批号)
	 * @see com.kanion.www.service.GardeniaExtrationConcentartionService#getBatchNos()
	 */
	@Override
	public List<BigDecimal> getBatchNos() {
		return gardeniaExtrationConcentartionMapper.getBatchNos();
	}

	/* (分析栀子提取浓缩中浓缩浸膏重量的平均值，看各批次与均值的差异，分析离异点形成的原因。)
	 * @see com.kanion.www.service.GardeniaExtrationConcentartionService#qualityAverageAnalysis(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	public Map<String, Object> qualityAverageAnalysis(Integer minBatchNo,
			Integer maxBatchNo) {	
			Map<String,Object> returnData=null;
			List<GardeniaExtrationConcentartion> gardeniaExtrationConcentartions = gardeniaExtrationConcentartionMapper.selectByBatchNos(minBatchNo, maxBatchNo);		
			int totleRecords = gardeniaExtrationConcentartions.size();
			if(0!=totleRecords){
				returnData=new HashMap<String,Object>();
				GardeniaExtrationConcentartion sumGardeniaExtrationConcentartion=GardeniaExtrationConcentartion.sum(gardeniaExtrationConcentartions); 	
				//计算均值
				GardeniaExtrationConcentartion avgGardeniaExtrationConcentartion=sumGardeniaExtrationConcentartion.divide(totleRecords);
					
				/**
				 * 计算返回的数据
				 */
				//返回的X轴下标
				List<String> batchNos=new ArrayList<String>();				
				//返回各批号的浓缩浸膏重量
				List<Object> concretequantitys=new ArrayList<Object>();
				//返回各批号的浓缩浸膏重量和均值的差值
				List<Object> concretequantitysDifference=new ArrayList<Object>();				
				//第二次乙醇浓度
				List<Object> secondalcoholcs=new ArrayList<Object>();
				// 浓缩过程一效最高温度（℃）
				List<Object> confirstmaxtempretures=new ArrayList<Object>();
				// 浓缩过程一效最低真空度（Mpa）
				List<Object> confirstminkpas=new ArrayList<Object>();
				//获取上述需返回的数据			
				for (GardeniaExtrationConcentartion item : gardeniaExtrationConcentartions) {
					batchNos.add(item.getBatchno().toString());				
					
					concretequantitys.add(item.getConcretequantity());
					concretequantitysDifference.add(item.getConcretequantity().subtract(avgGardeniaExtrationConcentartion.getConcretequantity()));
					secondalcoholcs.add(TempretureUtil.getConcentration(item.getSecondalcoholct()));
					confirstmaxtempretures.add(item.getConfirstmaxtempreture());
					confirstminkpas.add(item.getConfirstminkpa()*1000);
				}
			
				//*******************************************************************************************
				/**
				 * 栀子提取浓缩中各批次浓缩浸膏重量的均值差分析
				 */
				HighchartUtil avgChart=new HighchartUtil();
				//X轴目录			
				avgChart.getTitle().setText("栀子提取浓缩中各批次浓缩浸膏重量的均值差分析");
			//	avgChart.getxAxis().setCategories(batchNos);
				//各批号浓缩浸膏重量
				HighchartUtil.Series concretequantitysSeries=new HighchartUtil.Series();
				concretequantitysSeries.setName("浓缩浸膏量(Kg)");
				concretequantitysSeries.setData(concretequantitys);
				//各批号浓缩浸膏量与均值的差
				HighchartUtil.Series concretequantitysDifferenceSeries=new HighchartUtil.Series();
				concretequantitysDifferenceSeries.setName("浓缩浸膏量均值差");
				concretequantitysDifferenceSeries.setData(concretequantitysDifference);
				
				avgChart.getSeries().add(concretequantitysSeries);
				avgChart.getSeries().add(concretequantitysDifferenceSeries);
				/**
				 * 设置均值的标示线
				 */
				//浓缩浸膏量均值标示线
				HighchartUtil.PlotLine avgConcretequantityPotline=new HighchartUtil.PlotLine();
				avgConcretequantityPotline.setValue(avgGardeniaExtrationConcentartion.getConcretequantity().doubleValue());
				avgConcretequantityPotline.setColor("red");
				avgChart.getyAxis().getPlotLines().add(avgConcretequantityPotline);
				returnData.put("avgChart", avgChart);
				
			
			
				//*******************************************************************************************
		
				/**
				 * 与干膏相关性较大的控制参数，需调用相关性分析算子
				 */
				/**
				 * 构建返回的图表
				 */
				HighchartUtil avgRelatedToConcretequantitysChart=new HighchartUtil();
				//X轴目录			
				avgRelatedToConcretequantitysChart.getTitle().setText("各批次与浓缩浸膏量相关性较大的控制参数表");
		//		avgRelatedToConcretequantitysChart.getxAxis().setCategories(batchNos);
				
				HighchartUtil.Series secondalcoholcsSeries=new HighchartUtil.Series();
				secondalcoholcsSeries.setName("第二次乙醇浓度(%)");
				secondalcoholcsSeries.setData(secondalcoholcs);
				
				HighchartUtil.Series confirstmaxtempreturesSeries=new HighchartUtil.Series();
				confirstmaxtempreturesSeries.setName("浓缩过程一效最高温度(℃)");
				confirstmaxtempreturesSeries.setData(confirstmaxtempretures);
				
				HighchartUtil.Series confirstminkpasSeries=new HighchartUtil.Series();
				confirstminkpasSeries.setName("浓缩过程一效最低真空度(Kpa)");
				confirstminkpasSeries.setData(confirstminkpas);
				
				avgRelatedToConcretequantitysChart.getSeries().add(concretequantitysSeries);
				avgRelatedToConcretequantitysChart.getSeries().add(secondalcoholcsSeries);			
				avgRelatedToConcretequantitysChart.getSeries().add(confirstmaxtempreturesSeries);
				avgRelatedToConcretequantitysChart.getSeries().add(confirstminkpasSeries);
				returnData.put("avgRelatedToConcretequantitysChart", avgRelatedToConcretequantitysChart);
				
				//*******************************************************************************************
				/**
				 * 分析干膏的区间分布情况，以及奇异点
				 */
				//放置奇异点的列表
				List<GardeniaExtrationConcentartion> singularity=new ArrayList<GardeniaExtrationConcentartion>();		
				Double avgConcretequantity=avgGardeniaExtrationConcentartion.getConcretequantity().doubleValue();
				//按干膏量升序排序
				java.util.Collections.sort(gardeniaExtrationConcentartions, new GardeniaExtrationConcentartion.CmpByConcretequantity());
				//计算干膏的分布区间，step是分区步长
				double min=gardeniaExtrationConcentartions.get(0).getConcretequantity().doubleValue();
				double max=gardeniaExtrationConcentartions.get(gardeniaExtrationConcentartions.size()-1).getConcretequantity().doubleValue();
				Map<String,List<GardeniaExtrationConcentartion>> sections=new LinkedHashMap<String,List<GardeniaExtrationConcentartion>>();
				double step=ArithUtil.div(ArithUtil.sub(max,min),Util.categoryCount,2);
				//构造区间划分的对应Map,以及每个区间对应的批号
				double sectionLeft=min,sectionRight=ArithUtil.add(sectionLeft, step),sectionLeftEnd=ArithUtil.sub(max, step);
				int index=0;
				GardeniaExtrationConcentartion item=null;
				while(sectionLeft<=sectionLeftEnd){
					sectionRight=ArithUtil.add(sectionLeft, step);		
					ArrayList<GardeniaExtrationConcentartion> tmp=new ArrayList<GardeniaExtrationConcentartion>();			
					while(index<totleRecords){
						item=gardeniaExtrationConcentartions.get(index);
						//加入离异点的条件
						if(0.1<=ArithUtil.abs((item.getConcretequantity().doubleValue()-avgConcretequantity))/avgConcretequantity){
							singularity.add(item);
						}	
						if(item.getConcretequantity().intValue()>=sectionLeft&&item.getConcretequantity().intValue()<=sectionRight)
							tmp.add(item);
						else break;
						index++;							
					}		
					sections.put("["+sectionLeft+","+sectionRight+"]",tmp);					
					sectionLeft=sectionRight;
				}	
				System.out.println("栀子提取浓缩数据浓缩浸膏量均值分析奇异点："+singularity);
				/**
				 * 构建图表
				 */
				HighchartUtil normalChart=new HighchartUtil();
				normalChart.getTitle().setText("栀子浓缩浸膏量分布区间统计表");
				//X轴目录
		//		List<String> normalChartCategories=normalChart.getxAxis().getCategories();
				//统计每个区间所含批数
				List<Object> batchCounts=new ArrayList<Object>();			
				Iterator<Entry<String, List<GardeniaExtrationConcentartion>>> iter=sections.entrySet().iterator();
				while(iter.hasNext()){
					Map.Entry<String, List<GardeniaExtrationConcentartion>> e=(Map.Entry<String, List<GardeniaExtrationConcentartion>>) iter.next();
//					normalChartCategories.add(e.getKey().toString());
					batchCounts.add(((List<GardeniaExtrationConcentartion>)e.getValue()).size());				
				}
				HighchartUtil.Series batchCountsSeries=new HighchartUtil.Series();
				batchCountsSeries.setName("批数");
				batchCountsSeries.setData(batchCounts);
				normalChart.getSeries().add(batchCountsSeries);
				returnData.put("normalChart", normalChart);					
				
	//			System.out.println("栀子提取浓缩数据浓缩浸膏量均值分析正太分布区间："+normalChartCategories);
				System.out.println("栀子提取浓缩数据浓缩浸膏量均值分析正太分布区间对应批数："+batchCounts);
				
				/**
				 * 各个区间的批号
				 */
				returnData.put("sections", sections);
				
				/**
				 * 奇异点分析
				 */
			}
			
		
		return returnData;
	}

}
