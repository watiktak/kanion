package com.kanion.www.model.analysis.yield;

import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;
import com.kanion.www.model.analysis.trend.MokeTableImpl;

public class TypeName extends MokeTableImpl<Intermidate> {
	
	/*
	 * (设置中间体)
	 * @see com.kanion.www.model.analysis.trend.MokeTable#setSubTable(java.util.List)
	 */
	@Override
	@JSONField(name="intermidates")
	public void setSubTable(List<Intermidate> subTable) throws Exception {
		super.setSubTable(subTable);
	}
	

}
