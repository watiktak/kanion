/**
* Filename: TrendAnalysisSelectMapper.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月13日  下午2:57:00
* Description:
*
* 
*/
package com.kanion.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TrendAnalysisSelectMapper
 * @Description: TODO
 * @date 2015年5月13日 下午2:57:00
 *
 */
public interface TrendAnalysisSelectMapper {
	
	public List<String> getBatchNos(@Param("batchTableName")String batchTableName,@Param("batchNoTableName")String batchNoTableName,@Param("typeNameTableName")String typeNameTableName,@Param("typeName")String typeName);
}
