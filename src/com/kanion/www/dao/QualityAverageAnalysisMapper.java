/**
* Filename: QualityAverageAnalysisMapper.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年12月4日  上午10:54:20
* Description:
*
* 
*/
package com.kanion.www.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: QualityAverageAnalysisMapper
 * @Description: TODO
 * @date 2014年12月4日 上午10:54:20
 *
 */
public interface QualityAverageAnalysisMapper {

	List<BigDecimal> selectBatchNos(@Param("tableName")String tableName);
	List<Map> selectByBatchNoSection(@Param("tableName")String tableName,@Param("minBatchNo")Integer minBatchNo,@Param("maxBatchNo")Integer maxBatchNo);
	
}
