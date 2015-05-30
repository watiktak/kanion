package com.kanion.www.service;

import java.util.List;

public interface YieldAnalysisService {

	/**
	 * 
	* @Title: getTypeNames
	* @Description: 获取数据库中所有品名
	* @param @return    
	* @return List<String>    
	* @throws
	 */
	public List<String> getTypeNames();

	/**
	 * 获取品名品名对应的中间体
	 * @param typeName
	 * @return
	 */
	List<String> getIntermidates(String typeName);
}
