/**
* Filename: TrendAnalysisController.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月12日  下午4:28:10
* Description:
*
* 
*/
package com.kanion.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kanion.www.highchart.Spline;
import com.kanion.www.service.TrendAnalysisService;
import com.kanion.www.util.ProjectProperties;

/**
 * @ClassName: TrendAnalysisController
 * @Description: 趋势分析页面逻辑控制
 * @date 2015年5月12日 下午4:28:10
 *
 */
@Controller
@RequestMapping("trendAnalysis")
public class TrendAnalysisController {
	
	static Logger logger=Logger.getLogger(TrendAnalysisController.class.getName());
	
	
	@Autowired
	private TrendAnalysisService mTrendAnalysisService;
	/**
	 * 
	* @Title: init
	* @Description: 趋势分析页面的初始化，读取品名
	* @param @param request
	* @param @param response
	* @param @return    
	* @return ModelAndView  trendAnalysis.jsp  
	* @throws
	 */
	@RequestMapping("init")
	public ModelAndView init(HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView returnView=new ModelAndView("trendAnalysis");
		List<String> typeNames=mTrendAnalysisService.getTypeNames();
		returnView.addObject("typeNames", typeNames);
		return returnView;
	}
	
	/**
	 * 
	* @Title: getBatchNoAndProcess
	* @Description: 根据页面选择的品名返回对应的批号（最近100）以及工序名。
	* @param @param request
	* @param @param response
	* @param @return    
	* @return Map<String,List<String>>    
	* @throws
	 */
	@RequestMapping("getBatchNoAndProcess")
	@ResponseBody
	public Map<String,List<String>> getBatchNoAndProcess(HttpServletRequest request,
			HttpServletResponse response){
		Map<String,List<String>> ret=new HashMap<String,List<String>>();
		String typeName=request.getParameter("typeName");
		
		List<String> batchNos=mTrendAnalysisService.getBatchNos(typeName);
		ret.put("batchNos", batchNos);
		
		List<String> processes=null;
			processes = mTrendAnalysisService.getProcesses(typeName);
		ret.put("processes", processes);
		return ret;
	}
	
	/**
	* @Title: getPhasesByTypeNameAndProcess
	* @Description: 根据品名和工段返回阶段
	* @param @param request
	* @param @param response
	* @param @return    
	* @return Map<String,List<String>>    
	* @throws
	 */
	@RequestMapping("getPhasesByTypeNameAndProcess")
	@ResponseBody
	public Map<String,List<String>> getPhasesByTypeNameAndProcess(HttpServletRequest request,
			HttpServletResponse response){
		Map<String,List<String>> ret=new HashMap<String,List<String>>();
		String typeName=request.getParameter("typeName");
		String process=request.getParameter("process");
		List<String> phases=mTrendAnalysisService.getPhases(typeName, process);
		ret.put("phases", phases);
		return ret;
		
	}

	/**
	* @Title: getArgumentsByTypeNameProcessPhases
	* @Description: 根据品名、工段、阶段获取参数列表
	* @param @param request
	* @param @param response
	* @param @return    
	* @return Map<String,List<String>>    
	* @throws
	 */
	@RequestMapping("getArgumentsByTypeNameProcessPhases")
	@ResponseBody
	public Map<String,List<String>> getArgumentsByTypeNameProcessPhases(HttpServletRequest request,
			HttpServletResponse response){
		Map<String,List<String>> ret=new HashMap<String,List<String>>();
		String typeName=request.getParameter("typeName");
		String process=request.getParameter("process");
		String phase=request.getParameter("phase");
		String[] phases=phase.split(",");
		List<String> arguments=mTrendAnalysisService.getArguments(typeName, process, phases);
		ret.put("arguments", arguments);
		return ret;
		
	}
	
	
	@RequestMapping("getChart")
	@ResponseBody
	public Map<String,Spline> getChart(HttpServletRequest request,
			HttpServletResponse response){
		Map<String,Spline> ret=new HashMap<String,Spline>();
		String typeName=request.getParameter("typeName");
		String process=request.getParameter("process");
		String phase=request.getParameter("phase");
		String[] phases=phase.split(phase);
		String argument=request.getParameter("argument");
		Spline trendSpline=null;
		
		//如果当前程序是demon,调用service中的对应demo方法
		Properties p=ProjectProperties.getSingleton();
		if(p.getProperty("project.demon","false")=="true"){
			System.out.println("project is started on demo schema...");
			trendSpline=mTrendAnalysisService.getDemoChart(typeName,process,phases,argument);
		}else{
			trendSpline=mTrendAnalysisService.getChart(typeName,process,phases,argument);
		}
		ret.put("trend",trendSpline);
		return ret;
		
	}
}
