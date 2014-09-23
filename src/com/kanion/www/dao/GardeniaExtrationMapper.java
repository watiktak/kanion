package com.kanion.www.dao;

import java.util.List;

import com.kanion.www.model.GardeniaExtration;

public interface GardeniaExtrationMapper {
    int insert(GardeniaExtration record);

    int insertSelective(GardeniaExtration record);
    
    List<GardeniaExtration> selectAll();
}