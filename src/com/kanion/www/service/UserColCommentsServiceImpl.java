/**
* Filename: UserColCommentsServiceImpl.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年12月3日  下午9:28:44
* Description:
*
* 
*/
package com.kanion.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanion.www.dao.UserColCommentsMapper;
import com.kanion.www.model.UserColComments;

/**
 * @ClassName: UserColCommentsServiceImpl
 * @Description: TODO
 * @date 2014年12月3日 下午9:28:44
 *
 */
@Service("UserColCommentsService")
public class UserColCommentsServiceImpl implements UserColCommentsService{

	
	private UserColCommentsMapper userColCommentsMapper;
	
	@Autowired
	public void setUserColCommentsMapper(UserColCommentsMapper userColCommentsMapper) {
		this.userColCommentsMapper = userColCommentsMapper;
	}


	/* (non-Javadoc)
	 * @see com.kanion.www.service.UserColCommentsService#selectByTableName(java.lang.String)
	 */
	@Override
	public List<UserColComments> selectByTableName(String tableName) {
		return userColCommentsMapper.selectByTableName(tableName);
	}

}
