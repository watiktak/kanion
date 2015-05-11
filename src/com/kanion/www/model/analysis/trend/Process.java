/**
* Filename: Process.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月11日  下午3:48:02
* Description:
*
* 
*/
package com.kanion.www.model.analysis.trend;

import java.util.List;

/**
 * @ClassName: Process
 * @Description: TODO
 * @date 2015年5月11日 下午3:48:02
 *
 */
public class Process {
	
	private String name;
	private String tableName;
	private List<Phase> phases;
	
	public Process() {
		
	}

	public Process(String name,String tableName,List<Phase> phases){
		this.name=name;
		this.tableName=tableName;
		this.phases=phases;
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
	public List<Phase> getPhases() {
		return phases;
	}
	public void setPhases(List<Phase> phases) {
		this.phases = phases;
	}

	
}


