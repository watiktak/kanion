package com.kanion.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kanion.www.model.UserColComments;

public interface UserColCommentsMapper {
    int insert(UserColComments record);

    int insertSelective(UserColComments record);
    
    List<UserColComments> selectByTableName(@Param("tableName")String tableName);
}