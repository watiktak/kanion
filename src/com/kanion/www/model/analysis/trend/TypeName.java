/**
* Filename: TypeName.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月11日  下午3:41:05
* Description:
*
* 
*/
package com.kanion.www.model.analysis.trend;

import java.util.List;

/**
 * @ClassName: TypeName
 * @Description: TODO
 * @date 2015年5月11日 下午3:41:05
 *
 */
public class TypeName {
	private String name;
	private String tableName;
	private List<Process> processes;
	
	public TypeName() {
		
	}
	public TypeName(String name,String tableName,List<Process> processes){
		this.name=name;
		this.tableName=tableName;
		this.processes=processes;
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
	public List<Process> getProcesses() {
		return processes;
	}
	public void setProcesses(List<Process> processes) {
		this.processes = processes;
	}
	
	

}
