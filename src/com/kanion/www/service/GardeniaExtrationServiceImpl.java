/**
 * Filename: GardeniaExtrationServiceImpl.java
 * Project Name: kanion
 * @author: cyz	63954008(at)qq.com
 * @version: 1.0
 * @since: JDK 1.7.0_45
 * Copyright © 2014 CCNT. All Rights Reserved
 * Create at: 2014-9-22  下午7:44:48
 * Description:
 *
 * Modification History:
 * Date			Author		Version		Description
 * ------------------------------------------------------------------
 * 2014-9-22	cyz    		1.0			1.0 Version
 */
package com.kanion.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanion.www.dao.GardeniaExtrationMapper;
import com.kanion.www.model.GardeniaExtration;
import com.kanion.www.util.TempretureUtil;
import com.kanion.www.util.TimeUtil;

/**
 * @ClassName: GardeniaExtrationServiceImpl
 * @Description: TODO
 * @date 2014-9-22 下午7:44:48
 * 
 */
@Service("GardeniaExtrationService")
public class GardeniaExtrationServiceImpl implements GardeniaExtrationService {

	private GardeniaExtrationMapper gardeniaExtrationMapper;

	@Autowired
	public void setGardeniaExtrationMapper(
			GardeniaExtrationMapper gardeniaExtrationMapper) {
		this.gardeniaExtrationMapper = gardeniaExtrationMapper;
	}

	@Override
	public List<GardeniaExtration> selectAll() {
		return gardeniaExtrationMapper.selectAll();
	}

	@Override
	public List<Double> getDryConcreteWeights() {

		return gardeniaExtrationMapper.getDryConcreteWeights();
	}

	@Override
	public List<Double> getContents() {
		return gardeniaExtrationMapper.getContents();
	}

	@Override
	public Map<String, Double> averageAnalysis(Double minDryConcreteWeight,
			Double maxDryConcreteWeight, Double minContent, Double maxContent) {

		List<GardeniaExtration> gardeniaExtrations = gardeniaExtrationMapper
				.averageAnalysis(minDryConcreteWeight, maxDryConcreteWeight,
						minContent, maxContent);
		int totle = gardeniaExtrations.size();
		// 浓缩浸膏重量(Kg)
		double concentrationExtractionWeight = 0;
		// 原始pH值
		double originalPH = 0;
		// 加入1:1盐酸量（ml）
		double HCLVolume = 0;
		// 调酸后pH值
		double PHWithHCL = 0;
		// 热处理时间
		double heatTreatmentTime = 0;
		// 浸膏重量（kg）
		double extractionWeight = 0;
		// 萃取环境温度
		double extractionTempreture = 0;
		// 回收正丁醇使用量(kg)
		double cyclingButanol = 0;
		// 回收过程最高温度（℃）
		double cyclingMaxTempreture = 0;
		// 回收过程最低真空度（Mpa）
		double cyclingMinKPA = 0;
		// 刮板浓缩过程最高温度（℃）
		double scraperEnrichmentMaxTempreture = 0;
		// 刮板浓缩过程最低真空度（Mpa）
		double scraperEnrichmentMinKPA = 0;
		// 刮板总时间
		double scraperTotleTime = 0;
		// 湿膏
		double wetConcreteWeight = 0;
		// 干燥最高温度（℃）
		double dryMaxTempreture = 0;
		// 干燥时间(h)
		double dryTime = 0;
		// 干膏
		double dryConcreteWeight = 0;
		// 含量
		double content = 0;
		// 统计各项参数总值
		for (GardeniaExtration item : gardeniaExtrations) {
			// 浓缩浸膏重量(Kg)
			concentrationExtractionWeight += item
					.getConcentrationextractionweight().doubleValue();
			// 原始pH值
			originalPH += item.getOriginalph().doubleValue();
			// 加入1:1盐酸量（ml）
			HCLVolume += item.getHclvolume().doubleValue();
			// 调酸后pH值
			PHWithHCL += item.getPhwithhcl().doubleValue();
			// 热处理时间
			heatTreatmentTime += TimeUtil.changeToHour(item.getHeattreatmenttime());
			// 浸膏重量（kg）
			extractionWeight += item.getExtractionweight().doubleValue();
			// 萃取环境温度
			extractionTempreture +=TempretureUtil.stringToVal(item.getExtractiontempreture());
			// 回收正丁醇使用量(kg)
			cyclingButanol += item.getCyclingbutanol().doubleValue();
			// 回收过程最高温度（℃）
			cyclingMaxTempreture += TempretureUtil.stringToVal(item.getCyclingmaxtempreture());
			// 回收过程最低真空度（Mpa）
			cyclingMinKPA += item.getCyclingminkpa();
			// 刮板浓缩过程最高温度（℃）
			scraperEnrichmentMaxTempreture += TempretureUtil.stringToVal(item.getScraperenrichmentmaxtempreture());
			// 刮板浓缩过程最低真空度（Mpa）
			scraperEnrichmentMinKPA += item.getScraperenrichmentminkpa()
					.doubleValue();
			// 刮板总时间
			scraperTotleTime +=TimeUtil.changeToHour(item.getScrapertotletime());
			// 湿膏
			wetConcreteWeight += item.getWetconcreteweight().doubleValue();
			// 干燥最高温度（℃）
			dryMaxTempreture += TempretureUtil.stringToVal(item.getDrymaxtempreture());
			// 干燥时间(h)
			dryTime+=TimeUtil.changeToHour(item.getDrytime());
			
			
		}
		Map<String, Double> averages=new HashMap<String,Double>();
		averages.put("concentrationExtractionWeight", concentrationExtractionWeight/totle);
		averages.put("originalPH", originalPH/totle);
		averages.put("HCLVolume", HCLVolume/totle);
		averages.put("PHWithHCL", PHWithHCL/totle);
		averages.put("heatTreatmentTime", heatTreatmentTime/totle);
		averages.put("extractionWeight", extractionWeight/totle);
		averages.put("extractionTempreture", extractionTempreture/totle);
		averages.put("cyclingButanol", cyclingButanol/totle);
		averages.put("cyclingMaxTempreture", cyclingMaxTempreture/totle);
		averages.put("cyclingMinKPA", cyclingMinKPA/totle);
		averages.put("scraperEnrichmentMaxTempreture", scraperEnrichmentMaxTempreture/totle);
		averages.put("scraperEnrichmentMinKPA", scraperEnrichmentMinKPA/totle);
		averages.put("scraperTotleTime", scraperTotleTime/totle);
		averages.put("wetConcreteWeight", wetConcreteWeight/totle);
		averages.put("dryMaxTempreture", dryMaxTempreture/totle);
		averages.put("dryTime", dryTime/totle);
		System.out.println("栀子干膏与含量范围的均值分析结果："+averages);
		return averages;

	}
}
