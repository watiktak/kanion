/**
* Filename: QualityAverageAnalysisController.java
* Project Name: kanion
* @author: cyz	63954008(at)qq.com
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年11月24日  下午1:41:31
* Description:
*
* Modification History:
* Date			Author		Version		Description
* ------------------------------------------------------------------
* 2014年11月24日	cyz    		1.0			1.0 Version
*/
package com.kanion.www.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kanion.www.service.QualityAverageAnalysisService;

/**
 * @ClassName: QualityAverageAnalysisController
 * @Description: TODO
 * @date 2014年11月24日 下午1:41:31
 *
 */
@Controller
@RequestMapping("qualityAverageAnalysis")
public class QualityAverageAnalysisController {
		
	private QualityAverageAnalysisService qualityAverageAnalysisService;
	
	@Autowired
	public void setQualityAverageAnalysisService(
			QualityAverageAnalysisService qualityAverageAnalysisService) {
		this.qualityAverageAnalysisService = qualityAverageAnalysisService;
	}
	
	
	// 获取表名
	@RequestMapping("/initTables")
	@ResponseBody
	public Map<String,List<String>> initTables(HttpServletRequest request,
			HttpServletResponse response) {
		return qualityAverageAnalysisService.initTables();
	}
	
	
	// 获取批次范围
	@RequestMapping("/initBatchNos")
	@ResponseBody
	public Map<String,List<BigDecimal>> initBatchNos(HttpServletRequest request,
			HttpServletResponse response) {
		String tableName=request.getParameter("tableName");
		return qualityAverageAnalysisService.initBatchNos(tableName);
		
	}

	//计算质量均值
	@RequestMapping("/run")
	@ResponseBody
	public Map<String,Object> qualityAverageAnalysis(
			HttpServletRequest request, HttpServletResponse response) {
		
		String tableName=request.getParameter("tableName");
		Integer minBatchNo = Integer.parseInt(request.getParameter("minBatchNo"));
		Integer maxBatchNo = Integer.parseInt(request.getParameter("maxBatchNo"));
		System.out.println(tableName+":"+minBatchNo+":"+maxBatchNo);
		return qualityAverageAnalysisService.qualityAverageAnalysis(tableName, minBatchNo, maxBatchNo);
	}

}
