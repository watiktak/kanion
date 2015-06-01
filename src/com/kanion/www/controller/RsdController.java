package com.kanion.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.kanion.www.model.RsdExtraction;

/**
 * 
 * @author zhangsi
 *
 */

@Controller
@RequestMapping("rsd")
public class RsdController {
	
	//获取中间体
	@RequestMapping("/rsdExtraction")
	@ResponseBody
	public String rsdExtraction(HttpServletRequest request,HttpServletResponse response){
		String pihao[]={"Z150501","Z150502","Z150503","Z150504","Z150505","Z150506",
				"Z150507","Z150508"};
		//double value []= {478,490,473,490,480,490,480,485,475,480,470,484,489,499,483,
				//490,480,470,485,490,477,480,472,480,490};
		double value [] ={380,390,385,395,400,398,390,400};

		JSONArray jsonArray = new JSONArray();
		for(int i = 0;i < value.length;i++) {
			RsdExtraction rsdExtraction = new RsdExtraction();
			rsdExtraction.setPinming("金青");
			rsdExtraction.setZhongjianti("金青回收浸膏重量(Kg)");
			rsdExtraction.setPihao(pihao[i]);
			rsdExtraction.setPihaoValue(value[i]);
			jsonArray.add(rsdExtraction);
		}
		return jsonArray.toString();
	}
}
