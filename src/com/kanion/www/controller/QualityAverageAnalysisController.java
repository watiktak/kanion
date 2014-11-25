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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kanion.www.service.GardeniaExtrationConcentartionService;
import com.kanion.www.service.GardeniaExtrationService;

/**
 * @ClassName: QualityAverageAnalysisController
 * @Description: TODO
 * @date 2014年11月24日 下午1:41:31
 *
 */
@Controller
@RequestMapping("qualityAverageAnalysis")
public class QualityAverageAnalysisController {
	
	@Autowired
	private GardeniaExtrationService gardeniaExtrationService;
	@Autowired
	private GardeniaExtrationConcentartionService gardeniaExtrationConcentartionService;
	@Autowired
	public void setGardeniaExtrationService(
			GardeniaExtrationService gardeniaExtrationService) {
		this.gardeniaExtrationService = gardeniaExtrationService;
	}
	@Autowired	
	public void setGardeniaExtrationConcentartionService(
			GardeniaExtrationConcentartionService gardeniaExtrationConcentartionService) {
		this.gardeniaExtrationConcentartionService = gardeniaExtrationConcentartionService;
	}


	// 获取批次范围
	@RequestMapping("/init")
	@ResponseBody
	public Map<String,List<BigDecimal>> init(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String,List<BigDecimal>> returnData=new HashMap<String,List<BigDecimal>>();
		
		List<BigDecimal> gardeniaExtrationBatchNos = gardeniaExtrationService.getBatchNos();
		returnData.put("gardeniaExtrationBatchNos",gardeniaExtrationBatchNos);
		System.out.println("获取栀子萃取批号成功：" + gardeniaExtrationBatchNos.get(0)+"-"+gardeniaExtrationBatchNos.get(gardeniaExtrationBatchNos.size()-1));
		
		List<BigDecimal> gardeniaExtrationConcentartionBatchNos = gardeniaExtrationConcentartionService.getBatchNos();
		returnData.put("gardeniaExtrationConcentartionBatchNos",gardeniaExtrationConcentartionBatchNos);
		System.out.println("获取栀子提取浓缩批号成功：" + gardeniaExtrationConcentartionBatchNos.get(0)+"-"+gardeniaExtrationConcentartionBatchNos.get(gardeniaExtrationBatchNos.size()-1));
		return returnData;
	}

}
