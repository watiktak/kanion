package com.kanion.www.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.kanion.www.model.GardeniaExtration;

public interface GardeniaExtrationMapper {
    int insert(GardeniaExtration record);

    int insertSelective(GardeniaExtration record);
    
    List<GardeniaExtration> selectAll();
    
    List<Double> getDryConcreteWeights();

	List<Double> getContents();
	
	List<GardeniaExtration> averageAnalysis(@Param("minDryConcreteWeight")Double minDryConcreteWeight,@Param("maxDryConcreteWeight")Double maxDryConcreteWeight,@Param("minContent")Double minContent,@Param("maxContent")Double maxContent);
    
}