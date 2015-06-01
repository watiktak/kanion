package com.kanion.www.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kanion.www.model.Correlation;


/**
 * 
 * @author zhangsi
 *
 */

@Controller
@RequestMapping("correlation")
public class CorrelationController {
	
	@RequestMapping("/corrAnalysis")
	@ResponseBody
	public String correlation(HttpServletRequest request,HttpServletResponse response) {
		Correlation corel = new Correlation();
		//HashMap result = corel.df_gd_cor();
		JSONArray jsonArray = new JSONArray();
		jsonArray.add(corel.same_gd_cor());
		jsonArray.add(corel.df_gd_cor_gg());
		jsonArray.add(corel.df_gd_cor_hl());
		//jsonArray.add(corel.df_gd_cor());
		return jsonArray.toString();
	}
}
