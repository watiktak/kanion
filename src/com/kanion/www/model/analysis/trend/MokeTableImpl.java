/**
* Filename: MokeTable.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月19日  上午9:13:19
* Description:
*
* 
*/
package com.kanion.www.model.analysis.trend;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: MokeTable
 * @Description: 模拟表结构,每个子表的样式都一样，除了最后一个参数表。
 * @date 2015年5月19日 上午9:13:19
 *
 */
public class MokeTableImpl<T extends MokeTable> implements MokeTable{
	protected String name;//品名、工段、阶段的名字
	protected String colName;//品名、工段、阶段对应表的属性名
	protected List<T> subTable;//子表
	/**
	* @Title: getSubTableByName
	* @Description: 用名字找出子表列表中对应的表。
	* @param @param name
	* @param @param mokeTable
	* @param @return    
	* @return T    
	* @throws
	 */
	public T getSubTableByName(String name){
		T ret=null;
		if(null!=name && null!=subTable){
			for(T t:subTable){
				if(t.getName().equals(name)){
					ret=t;
					break;
				}
			}
		}
		return ret;
	}
	
	
	
	/**
	* @Title: getTableNames
	* @Description: 获取子表列表中所有表的名字。
	* @param @param mokeTables
	* @param @return    
	* @return List<String>    
	* @throws
	 */
	public List<String> getSubTableNames(){
		List<String> ret=null;
		if(subTable!=null){
			ret=new ArrayList<String>();
			for(T t:subTable){
				ret.add(t.getName());
			}
		}
		return ret;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) throws Exception {
		if(null==this.name){
			this.name = name;
		}else{
			throw new Exception("unsupported!");
		}
	}
	
	
	public String getColName() {
		return colName;
	}
	public void setTableName(String tableName) throws Exception {
		if(null==this.colName){
			this.colName = tableName;
		}else{
			throw new Exception("unsupported!");
		}
	}
	
	
	public List<? extends MokeTable> getSubTable(){
		return subTable;
	}
	
	public void setSubTable(List<T> subTable) throws Exception {
		if(null==this.subTable){
			this.subTable = subTable;
		}else{
			throw new Exception("unsupported!");
		}
	}
	
	
	@Override 
	public String toString(){
		StringBuilder sb=new StringBuilder();
		sb.append("{'name':'"+name+"','tableName':'"+colName+"','subTable':[");
		boolean isFirst=true;
		for(MokeTable t:subTable){
			if(isFirst)
				isFirst=false;
			else
				sb.append(",");
			sb.append(t.toString());
		}
		sb.append("]}");
		return sb.toString();
	}
	
	public MokeTableImpl(){}
	
}
