/**
* Filename: UserTableCommentsServiceImpl.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年12月3日  下午6:09:14
* Description:提供生产数据表表名和描述。
*/
package com.kanion.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanion.www.dao.UserTableCommentsMapper;
import com.kanion.www.model.UserTableComments;

/**
 * @ClassName: UserTableCommentsServiceImpl
 * @Description: implements UserTableCommentsService
 * @date 2014年12月3日 下午6:09:14
 *
 */
@Service("UserTableCommentsService")
public class UserTableCommentsServiceImpl implements UserTableCommentsService {
	
	
	private UserTableCommentsMapper userTableCommentsMapper;

	
	@Autowired
	public void setUserTableCommentsMapper(
			UserTableCommentsMapper userTableCommentsMapper) {
		this.userTableCommentsMapper = userTableCommentsMapper;
	}



	/* (select production table from user tablespace)
	 * @see com.kanion.www.service.UserTableCommentsService#selectProductionTable()
	 */
	@Override
	public List<UserTableComments> selectProductionTable() {
		return userTableCommentsMapper.selectProductionTable();
	}



	/* (使用表的英文名来查询中文名)
	 * @see com.kanion.www.service.UserTableCommentsService#selectTableChName(java.lang.String)
	 */
	@Override
	public String selectTableChName(String tableName) {
		return userTableCommentsMapper.selectTableChName(tableName);
	}



	

}
