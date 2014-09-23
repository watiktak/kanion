/**
* Filename: GardeniaExtration.java
* Project Name: kanion
* @author: cyz	63954008(at)qq.com
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014-9-22  下午6:41:48
* Description:处理“栀子提取浓缩数据”批数据的service
*
* Modification History:
* Date			Author		Version		Description
* ------------------------------------------------------------------
* 2014-9-22	cyz    		1.0			1.0 Version
*/
package com.kanion.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kanion.www.model.GardeniaExtration;
import com.kanion.www.service.GardeniaExtrationService;

/**
 * @ClassName: GardeniaExtration
 * @Description: TODO
 * @date 2014-9-22 下午6:41:48
 *
 */
@Controller
@RequestMapping("GardeniaExtration")
public class GardeniaExtrationController {
	
	

	@Autowired
	private GardeniaExtrationService gardeniaExtrationService;
	@Autowired
	public void setGardeniaExtrationService(
			GardeniaExtrationService gardeniaExtrationService) {
		this.gardeniaExtrationService = gardeniaExtrationService;
	}
	
	@RequestMapping("/selectAll")
	public ModelAndView selectAll(HttpServletRequest request,
			HttpServletResponse response){
		
		List<GardeniaExtration> gardeniaExtrations=gardeniaExtrationService.selectAll();
		
		ModelAndView mv = new ModelAndView("main");	
		mv.addObject("gardeniaExtrations", gardeniaExtrations);
		return mv;
		
		
		
	}


}
