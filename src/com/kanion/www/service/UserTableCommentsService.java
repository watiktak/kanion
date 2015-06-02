/**
* Filename: UserTableCommentsService.java
* Project Name: kanion
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年12月3日  下午6:02:46
* Description:用户空间中所有表的描述信息
*
*/
package com.kanion.www.service;

import java.util.List;

import com.kanion.www.model.UserTableComments;

public interface UserTableCommentsService {

	public List<UserTableComments> selectProductionTable();
	
	public String selectTableChName(String tableName);
	
}
