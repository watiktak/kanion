/**
* Filename: Argument.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月11日  下午3:45:05
* Description:
*
* 
*/
package com.kanion.www.model.analysis.trend;
/**
 * @ClassName: Argument
 * @Description: TODO
 * @date 2015年5月11日 下午3:45:05
 *
 */
public class Argument {
	
	private String name;
	private String tableName;
	private int type;
	
	public Argument() {
		
	}

	public Argument(String name,String tableName,int type){
		this.name=name;
		this.tableName=tableName;
		this.type=type;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString(){
		return "{'name':'"+name+"','tableName':'"+tableName+"','type':"+type;
	}
}
