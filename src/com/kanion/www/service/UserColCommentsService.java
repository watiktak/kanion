/**
* Filename: UserColCommentsService.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年12月3日  下午9:05:15
* Description:
*
* 
*/
package com.kanion.www.service;

import java.util.List;

import com.kanion.www.model.UserColComments;

/**
 * @ClassName: UserColCommentsService
 * @Description: TODO
 * @date 2014年12月3日 下午9:05:15
 *
 */
public interface UserColCommentsService {
	
	List<UserColComments> selectByTableName(String tableName);

}
