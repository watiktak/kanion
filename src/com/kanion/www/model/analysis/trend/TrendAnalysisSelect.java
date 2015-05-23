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
import com.alibaba.fastjson.annotation.JSONField;
import com.kanion.www.util.Util;

/**
 * @ClassName: TrendAnalysisSelect
 * @Description: 用于处理趋势页面的选项显示，整个工程中只有一个实例，且一旦生成其属性就不可更改。相当于常量型的单例类。
 * @date 2015年5月11日 上午11:12:02
 *
 */

public class TrendAnalysisSelect {
	
	/**
	 * 类初始化操作，在类初始化的时候实例化单例。
	 */
	public static final TrendAnalysisSelect INSTANCE;
	static{
		String jsonString=Util.readFile("com/kanion/www/json/trend.json");
		INSTANCE=JSON.parseObject(jsonString,TrendAnalysisSelect.class);
	}
	
	
	private List<TypeName> typeNames;
	private String batchTableName;
	private String batchNoColName;
	
	
	/**
	 * json转换需要默认构造器
	 */
	private TrendAnalysisSelect(){
	}
	
	
	public String getBatchTableName() {
		return batchTableName;
	}
	

	public void setBatchTableName(String batchTableName) throws Exception {
		if(null==this.batchTableName){
			this.batchTableName = batchTableName;
		}else{
			throw new Exception("set batchTableName unsupported!");
		}
	}


	public List<TypeName> getTypeNames() {
		return typeNames;
	}
	/**
	 * 
	* @Title: setTypeNames
	* @Description: 在类刚加载进来时，INSTANCE为空，此时可以通过fastjson来设置typeName.
	* 一旦单例对象生成，任何人都无法修改typeName,以此来保证整个工程只有一个对象正确地表达表间关系。
	* 因为setTypeNames只有在对象生成后才会被调用，故在对象生成前不会有null==INSTANCE的情况，如此
	* 即使多个程序同时调用该方法也不会有不同步的问题。
	* @param @param typeNames
	* @param @throws Exception    
	* @return void    
	* @throws
	 */
	//@JSONField(name="typeNames") 可以通过注解来指定目标属性
	public void setTypeNames(List<TypeName> typeNames) throws Exception {
		if(null==this.typeNames){
			this.typeNames = typeNames;
		}else{
			throw new Exception("set typenames unsupported!");
		}
	}

	
	public String getBatchNoColName() {
		return batchNoColName;
	}

	
	public void setBatchNoColName(String batchNoTableName) throws Exception {
		if(null==this.batchNoColName){
			this.batchNoColName = batchNoTableName;
		}else{
			throw new Exception("set batchNoTableName unsupported!");
		}
	}
	

	@Override
	public String toString(){
		StringBuilder str=new StringBuilder();
		str.append("{'batchTableName':'"+batchTableName+"','batchNoColName':'"+batchNoColName+"','typeNames':[");
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
	}
	
	
}
