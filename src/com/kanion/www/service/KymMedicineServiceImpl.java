/**
 * 
 */
package com.kanion.www.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanion.www.dao.KymMedicineMapper;
import com.kanion.www.model.KymMedicine;

/**
 * @author Zou
 *
 */
@Service("KymMedicineService")
public class KymMedicineServiceImpl implements KymMedicineService {

	private KymMedicineMapper KymMedicineMapper;
	
	@Autowired
	public void setKymMedicineMapper(
			KymMedicineMapper KymMedicineMapper){
		this.KymMedicineMapper = KymMedicineMapper;
	}
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return KymMedicineMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(KymMedicine record) {
		// TODO Auto-generated method stub
		return KymMedicineMapper.insert(record);
	}

	@Override
	public int insertSelective(KymMedicine record) {
		// TODO Auto-generated method stub
		return KymMedicineMapper.insertSelective(record);
	}

	@Override
	public KymMedicine selectByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return KymMedicineMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(KymMedicine record) {
		// TODO Auto-generated method stub
		return KymMedicineMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(KymMedicine record) {
		// TODO Auto-generated method stub
		return KymMedicineMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<KymMedicine> selectAll() {
		// TODO Auto-generated method stub
		return KymMedicineMapper.selectAll();
	}

	@Override
	public List<KymMedicine> selectByName(String name) {
		return KymMedicineMapper.selectByName(name);
	}


}
