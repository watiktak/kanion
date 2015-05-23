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

import java.util.List;


/**
 * @ClassName: Argument
 * @Description: 参数对应的类
 * @date 2015年5月11日 下午3:45:05
 *
 */
public class Argument implements MokeTable{
	
	private String name;
	private String colName;
	private Integer type;
	
	public Argument() {
		
	}

	public int getType() {
		return type;
	}
	public void setType(int type) throws Exception {
		if(null==this.type)
			this.type = type;
		else
			throw new Exception("unsupported");
	}
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) throws Exception {
		
		if(null==this.name)
			this.name = name;
		else
			throw new Exception("unsupported");
	}

	public String getColName() {
		return colName;
	}

	public void setTableName(String tableName) throws Exception {
		if(null==this.colName)
			this.colName = tableName;
		else
			throw new Exception("unsupported");
	}

	@Override
	public String toString(){
		return "{'name':'"+name+"','tableName':'"+colName+"','type':"+type+"}";
	}

	/* (non-Javadoc)
	 * @see com.kanion.www.model.analysis.trend.MokeTable#getSubTable()
	 */
	@Override
	public List<? extends MokeTable> getSubTable() {
		return null;
	}
	
	
	
}
