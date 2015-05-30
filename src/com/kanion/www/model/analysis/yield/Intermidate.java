package com.kanion.www.model.analysis.yield;

import java.util.List;

import com.kanion.www.model.analysis.trend.MokeTable;

public class Intermidate implements MokeTable{
	
	private String name;
	private String colName;
	private String unit;//体积或重量
	private String unit_flag;//单位符号
	
	@Override
	public String toString(){
		return "{'name':'"+name+"','tableName':'"+colName+"','unit':'"+unit+"','unit_flag':"+unit_flag+"}";
	}
	
	@Override
	public String getName() {
		return name;
	}
	@Override
	public String getColName() {
		return colName;
	}
	@Override
	public List<? extends MokeTable> getSubTable() {
		return null;
	}
	public String getUnit() {
		
		return unit;
	}
	public void setUnit(String unit) throws Exception {
		if(null==this.unit)
			this.unit = unit;
		else
			throw new Exception("unsupported");
	}
	public String getUnit_flag() {
		return unit_flag;
	}
	public void setUnit_flag(String unit_flag) throws Exception {
		if(null==this.unit_flag)
			this.unit_flag = unit_flag;
		else 
			throw new Exception("unsupported");
			
	}
	public void setName(String name) throws Exception {
		if(null==this.name)
			this.name = name;
		else
			throw new Exception("unsupported");
	}
	public void setColName(String colName) throws Exception {
		if(null==this.colName)
			this.colName = colName;
		else 
			throw new Exception("unsupported");
	}
	
	

}
