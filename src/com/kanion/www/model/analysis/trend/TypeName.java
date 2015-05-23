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

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @ClassName: TypeName
 * @Description: 品名，对象一旦构造其中的属性不可更改。
 * @date 2015年5月11日 下午3:41:05
 *
 */
public class TypeName extends MokeTableImpl<Process>{
	/*
	 * (设置工段)
	 * @see com.kanion.www.model.analysis.trend.MokeTable#setSubTable(java.util.List)
	 */
	@Override
	@JSONField(name="processes")
	public void setSubTable(List<Process> subTable) throws Exception {
		super.setSubTable(subTable);
	}
	
}
