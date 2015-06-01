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

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @ClassName: Phase
 * @Description: 阶段，对象一旦构造其属性不可更改
 * @date 2015年5月11日 下午3:46:24
 *
 */
public class Phase extends MokeTableImpl<Argument>{
	/*
	 * (设置参数)
	 * @see com.kanion.www.model.analysis.trend.MokeTable#setSubTable(java.util.List)
	 */

	
	@Override
	@JSONField(name="arguments")
	public void setSubTable(List<Argument> subTable) throws Exception {
		super.setSubTable(subTable);
	}
	
//	@Override
//	@JSONField(name="arguments")
//	public List<Argument> getSubTable() {
//		return subTable;
//	}
}


