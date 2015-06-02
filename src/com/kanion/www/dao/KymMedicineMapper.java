package com.kanion.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kanion.www.model.KymMedicine;

public interface KymMedicineMapper {
	
	List<KymMedicine> selectAll();
	
    int deleteByPrimaryKey(Long id);

    int insert(KymMedicine record);

    int insertSelective(KymMedicine record);

    KymMedicine selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(KymMedicine record);

    int updateByPrimaryKey(KymMedicine record);

	List<KymMedicine> selectByName(@Param("name")String name);
}