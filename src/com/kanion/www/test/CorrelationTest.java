package com.kanion.www.test;

import java.util.Map;

import javax.servlet.ServletContext;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kanion.www.model.Correlation;

public class CorrelationTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Correlation cc = new Correlation();
		JSONArray jsonArray = new JSONArray();
		//jsonArray.add(cc.df_gd_cor());
		jsonArray.add(cc.same_gd_cor());
		System.out.println(jsonArray.toString());
	}
}
