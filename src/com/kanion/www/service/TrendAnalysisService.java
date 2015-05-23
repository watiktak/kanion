/**
* Filename: TrendAnalysisService.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月12日  下午4:37:08
* Description:
*
* 
*/
package com.kanion.www.service;

import java.util.List;

import com.kanion.www.highchart.Spline;



/**
 * @ClassName: TrendAnalysisService
 * @Description: TODO
 * @date 2015年5月12日 下午4:37:08
 *
 */
public interface TrendAnalysisService {
	/**
	 * 
	* @Title: getTypeNames
	* @Description: 获取数据库中所有品名
	* @param @return    
	* @return List<String>    
	* @throws
	 */
	public List<String> getTypeNames();
	
	/**
	 * 
	* @Title: getBatchNos
	* @Description: 根据品名获取批号，根据时间的最近100批
	* @param @param typeName
	* @param @return    
	* @return List<String>    
	* @throws
	 */
	public List<String> getBatchNos(String typeName);
	
	/**
	 * @throws Exception 
	* @Title: getProcesses
	* @Description: 获取品名对应的工序/工段
	* @param @param typeName
	* @param @return    
	* @return List<String>    
	* @throws
	 */
	public  List<String> getProcesses(String typeName);
	
	/**
	* @Title: getPhases
	* @Description: 根据品名和工段获取阶段列表
	* @param @param typeName
	* @param @param process
	* @param @return    
	* @return List<String>    
	* @throws
	 */
	public List<String> getPhases(String typeName,String process);
	
	/**
	* @Title: getArguments
	* @Description: 根据品名、工段、阶段返回参数列表
	* @param @param typeName
	* @param @param process
	* @param @param phase
	* @param @return    
	* @return List<Argument>    
	* @throws
	 */
	public List<String> getArguments(String typeName,String process,String[] phase);

	/**
	* @Title: getChart
	* @Description: TODO
	* @param @param typeName
	* @param @param process
	* @param @param phases
	* @param @param argument
	* @param @return    
	* @return Spline    
	* @throws
	*/
	public Spline getChart(String typeName, String process, String[] phases,
			String argument);

}
