/**
* Filename: Phase.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月11日  下午3:46:24
* Description:
*
* 
*/
package com.kanion.www.model.analysis.trend;

import java.util.List;

/**
 * @ClassName: Phase
 * @Description: TODO
 * @date 2015年5月11日 下午3:46:24
 *
 */
public class Phase {
	
	private String name;
	private String tableName;
	private List<Argument> arguments;
	
	public Phase() {
		
	}
	public Phase(String name,String tableName,List<Argument> arguments){
		this.name=name;
		this.tableName=tableName;
		this.arguments=arguments;
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
	public List<Argument> getArguments() {
		return arguments;
	}
	public void setArguments(List<Argument> arguments) {
		this.arguments = arguments;
	}
	
	
}


