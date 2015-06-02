package com.kanion.www.dao;

import com.kanion.www.model.GardeniaExtrationConcentartion;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface GardeniaExtrationConcentartionMapper {
	
	List<GardeniaExtrationConcentartion> selectAll();
	List<GardeniaExtrationConcentartion> selectByBatchNos(@Param("minBatchNo")Integer minBatchNo,@Param("maxBatchNo")Integer maxBatchNo);
	List<BigDecimal> getBatchNos();
	
    int deleteByPrimaryKey(BigDecimal batchno);

    int insert(GardeniaExtrationConcentartion record);

    int insertSelective(GardeniaExtrationConcentartion record);

    GardeniaExtrationConcentartion selectByPrimaryKey(BigDecimal batchno);

    int updateByPrimaryKeySelective(GardeniaExtrationConcentartion record);

    int updateByPrimaryKey(GardeniaExtrationConcentartion record);
}