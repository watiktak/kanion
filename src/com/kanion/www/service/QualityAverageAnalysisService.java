package com.kanion.www.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface QualityAverageAnalysisService {
	
	public Map<String,List<String>> initTables();
	
	public Map<String,List<BigDecimal>> initBatchNos(String tableName);
	
	public Map<String,Object> qualityAverageAnalysis(String tableName,Integer minBatchNo,Integer maxBatchNo);
	
	
		

}
