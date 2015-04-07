package com.kanion.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kanion.www.model.UserTableComments;

public interface UserTableCommentsMapper {
    int insert(UserTableComments record);

    int insertSelective(UserTableComments record);

	/**
	* @Title: selectProductionTable
	* @Description: TODO
	* @param @return    
	* @return Map<String,String>    
	* @throws
	*/
	List<UserTableComments> selectProductionTable();
	String selectTableChName(@Param("tableName")String tableName);
	
}