/**
* Filename: GardeniaExtrationService.java
* Project Name: kanion
* @author: cyz	63954008(at)qq.com
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014-9-22  下午6:48:43
* Description:处理“栀子提取浓缩数据”批数据的service.
*
* Modification History:
* Date			Author		Version		Description
* ------------------------------------------------------------------
* 2014-9-22	cyz    		1.0			1.0 Version
*/
package com.kanion.www.service;

import java.util.List;

import com.kanion.www.model.GardeniaExtration;

/**
 * @ClassName: GardeniaExtrationService
 * @Description: TODO
 * @date 2014-9-22 下午6:48:43
 *
 */
public interface GardeniaExtrationService {

	public List<GardeniaExtration> selectAll();
	
	
}
