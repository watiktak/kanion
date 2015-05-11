/**
* Filename: TrendAnalysisSelect.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月11日  上午11:12:02
* Description:
*
* 
*/
package com.kanion.www.model.analysis.trend;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.kanion.www.util.Util;

/**
 * @ClassName: TrendAnalysisSelect
 * @Description: TODO
 * @date 2015年5月11日 上午11:12:02
 *
 */

public class TrendAnalysisSelect {
	
	public static final TrendAnalysisSelect INSTANCE;
	static{
		String jsonString=Util.readFile("com/kanion/www/json/trend.json");
		INSTANCE=JSON.parseObject(jsonString,TrendAnalysisSelect.class);
	}
	
	public TrendAnalysisSelect(){
	}

	public List<TypeName> getTypeNames() {
		return typeNames;
	}

	public void setTypeNames(List<TypeName> typeNames) {
		this.typeNames = typeNames;
	}

	private List<TypeName> typeNames;
	
	@Override
	public String toString(){
		StringBuilder str=new StringBuilder();
		str.append("{typeNames:[");
		boolean isFirst=true;
		for(TypeName each:typeNames){
			if(isFirst){
				isFirst=false;
			}else
				str.append(",");
			str.append(each.toString());
		}
		str.append("]}");
		return str.toString();
	}

	public static void main(String[] args){
		System.out.println(TrendAnalysisSelect.INSTANCE);
//		Argument arg1=new Argument("加入纯化水流速m³/h","",1);
//		Argument arg2=new Argument("加纯化水量","",0);
//		Argument arg3=new Argument("加纯化水时间","",0);
//		List<Argument> arguments=new ArrayList<Argument>();
//		arguments.add(arg1);
//		arguments.add(arg2);
//		arguments.add(arg3);
//		
//		Phase phase=new Phase("金银花第一次提取","",arguments);
//		List<Phase> phases=new ArrayList<Phase>();
//		phases.add(phase);
//		
//		Process process=new Process("金银花提取","",phases);
//		List<Process> processes=new ArrayList<Process>();
//		processes.add(process);
//		
//		TypeName typeName=new TypeName("热毒宁注射液青金提取物","",processes);
//		List<TypeName> typeNames=new ArrayList<TypeName>();
//		typeNames.add(typeName);
//		
//		TrendAnalysisSelect trendAnalysisSelect=new TrendAnalysisSelect();
//		trendAnalysisSelect.setTypeNames(typeNames);
//		String jsonStr=JSON.toJSONString(trendAnalysisSelect);
//		
//		
//		System.out.println(jsonStr);
		
		
		
		
		
	}
	
	
}
