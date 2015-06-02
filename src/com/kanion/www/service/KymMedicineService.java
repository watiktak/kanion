package com.kanion.www.service;


import java.util.List;

/**
 * @author Zou
 *
 */
import com.kanion.www.model.KymMedicine;
public interface KymMedicineService {
	
	public List<KymMedicine> selectAll();
	
    int deleteByPrimaryKey(Long id);

    int insert(KymMedicine record);

    int insertSelective(KymMedicine record);

    KymMedicine selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(KymMedicine record);

    int updateByPrimaryKey(KymMedicine record);

	public List<KymMedicine> selectByName(String name);
}
