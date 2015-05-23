package com.kanion.www.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kanion.www.service.GardeniaExtrationConcentartionService;

/**
 * @ClassName: GardeniaExtrationConcentartionController
 * @Description: TODO
 * @date 2014年11月24日 下午3:47:19
 *
 */
@Controller
@RequestMapping("GardeniaExtrationConcentartion")
public class GardeniaExtrationConcentartionController {
	
	@Autowired
	private GardeniaExtrationConcentartionService gardeniaExtrationConcentartionService;

	
	// 质量均值分析
	@RequestMapping("/qualityAverageAnalysis")
	@ResponseBody
	public Map<String,Object> qualityAverageAnalysis(
			HttpServletRequest request, HttpServletResponse response) {
		Integer minBatchNo = Integer.parseInt(request
				.getParameter("minBatchNo"));
		Integer maxBatchNo = Integer.parseInt(request
				.getParameter("maxBatchNo"));
		Map<String,Object> returnData = gardeniaExtrationConcentartionService
				.qualityAverageAnalysis(minBatchNo, maxBatchNo);
		return returnData;
	}
}
