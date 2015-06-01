/**
* Filename: MokeTable.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月20日  下午1:04:48
* Description:
*
* 
*/
package com.kanion.www.model.analysis.trend;

import java.util.List;

/**
 * @ClassName: MokeTable
 * @Description: TODO
 * @date 2015年5月20日 下午1:04:48
 *
 */
public interface MokeTable{
	public String getName();
	public String getColName();
	public List<? extends MokeTable> getSubTable();
}
