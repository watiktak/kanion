package com.kanion.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kanion.www.service.YieldAnalysisService;
@Controller
@RequestMapping("yieldAnalysis")
public class YieldAnalysisController {

	
	static Logger logger=Logger.getLogger(YieldAnalysisController.class.getName());
	
	@Autowired
	private YieldAnalysisService mYieldAnalysisService;
	
	/**
	 * 
	* @Title: init
	* @Description: 收率分析页面的初始化，读取品名
	* @param @param request
	* @param @param response
	* @param @return    
	* @return ModelAndView  trendAnalysis.jsp  
	* @throws
	 */
	@RequestMapping("init")
	public ModelAndView init(HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView returnView=new ModelAndView("yieldAnalysis");
		List<String> typeNames=mYieldAnalysisService.getTypeNames();
		returnView.addObject("typeNames", typeNames);
		return returnView;
	}
	
	@RequestMapping("getIntermidates")
	@ResponseBody
	public Map<String,List<String>> getIntermidates(HttpServletRequest request,
			HttpServletResponse response){
		
		Map<String,List<String>> ret=new HashMap<String,List<String>>();
		String typeName=request.getParameter("typeName");
		
		List<String> intermidates=mYieldAnalysisService.getIntermidates(typeName);
		ret.put("intermidates", intermidates);
		
		return ret;
	}
}
