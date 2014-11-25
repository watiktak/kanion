/**
* Filename: GardeniaExtrationConcentartionService.java
* Project Name: kanion
* @author: cyz	63954008(at)qq.com
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年11月24日  下午1:59:31
* Description:
*
* Modification History:
* Date			Author		Version		Description
* ------------------------------------------------------------------
* 2014年11月24日	cyz    		1.0			1.0 Version
*/
package com.kanion.www.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import com.kanion.www.model.GardeniaExtrationConcentartion;

/**
 * @ClassName: GardeniaExtrationConcentartionService
 * @Description: TODO
 * @date 2014年11月24日 下午1:59:31
 *
 */
public interface GardeniaExtrationConcentartionService {
	
	public List<GardeniaExtrationConcentartion> selectAll();
	
	public List<BigDecimal> getBatchNos();

	public Map<String,Object> qualityAverageAnalysis(
			Integer minBatchNo, Integer maxBatchNo);

}
