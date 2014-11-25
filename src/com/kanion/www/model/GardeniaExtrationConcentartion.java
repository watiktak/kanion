/* 栀子提取浓缩表
 * 批号	药材批号	药材厂家	药材含量(mg/g)	班次	人员	投料量(Kg)	投料罐数	每罐投料量（㎏）	第一次提取加乙醇量（m³）	乙醇浓度、温度	第一次提取循环时间（min）	第一次回流蒸汽压力（Mpa）	第一次回流药液最高温度（℃）	第二次提取加乙醇量（m³）	乙醇浓度、温度	第二次提取循环时间（min）	第二次回流蒸汽压力（Mpa）	第二次回流药液最高温度（℃）	班次	人员	浓缩过程蒸汽压力（Mpa）	浓缩过程一效最高温度（℃）	浓缩过程一效最低真空度（Mpa）	浓缩过程二效最高温度（℃）	浓缩过程二效最低真空度（Mpa）	浓缩总时间	出膏比重	出膏温度(℃)	浓缩浸膏重量(Kg)
 *	1	A		W		4.9				小	Z	960				4	240					1.7				81%、22℃		40				0.02				80						1.7					84%、28℃		40				0.02					80					大	F	0.01				70					-0.05					64					-0.057					7		1.17	70				435
 *	2	A		W		4.9				白	L	960				4	240					1.7				84%、28℃		40				0.02				80						1.7					83%、27℃		40				0.02					80					白	W	0.01				70					-0.05					62					-0.064					7		1.17	70				409
 */
package com.kanion.www.model;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;

import com.kanion.www.util.ArithUtil;
import com.kanion.www.util.TempretureUtil;

public class GardeniaExtrationConcentartion {
    private BigDecimal batchno;
    private String medicinalno;
    private String medicinemaker;
    //药材含量(mg/g)
    private Double contentofmedicine;
    private String shift;
    private String operator;
    //投料量(Kg)
    private BigDecimal feedingcapacity;
    //投料罐数
    private BigDecimal feedingtank;
    //每罐投料量（㎏）
    private BigDecimal capacityoftank;
    //第一次提取加乙醇量（m³）
    private Double firstextractionalcoholadd;
    //乙醇浓度、温度
    private String firstalcoholct;
    //第一次提取循环时间（min）
    private BigDecimal firstextractiontime;
    //第一次回流蒸汽压力（Mpa）
    private Double firstbackflowstreampressure;
    //第一次回流药液最高温度（℃）
    private BigDecimal firstbackflowmaxtempreture;
    //第二次提取加乙醇量（m³）
    private Double secondextractionalcoholadd;
    //乙醇浓度、温度
    private String secondalcoholct;
    //第二次提取循环时间（min）
    private BigDecimal secondextractiontime;
    //第二次回流蒸汽压力（Mpa）
    private Double secondbackflowstreampressure;
    //第二次回流药液最高温度（℃）
    private BigDecimal secondbackflowmaxtempreture;
    private String secondbatchno;
    private String secondoperator;
    //浓缩过程蒸汽压力（Mpa）
    private Double consteampressure;
    //浓缩过程一效最高温度（℃）
    private BigDecimal confirstmaxtempreture;
    //浓缩过程一效最低真空度（Mpa）
    private Double confirstminkpa;
    //浓缩过程二效最高温度（℃）
    private BigDecimal consecondmaxtempreture;
    //浓缩过程二效最低真空度（Mpa）
    private Double consecondminkpa;
    //浓缩总时间	
    private BigDecimal contotletime;
    //出膏比重	
    private Double extractionproportion;
    //出膏温度(℃)	
    private BigDecimal extractiontemperature;
    //浓缩浸膏重量(Kg)
    private BigDecimal concretequantity;

    public GardeniaExtrationConcentartion add(GardeniaExtrationConcentartion gec){
    	GardeniaExtrationConcentartion result=new GardeniaExtrationConcentartion();
    	result.contentofmedicine=ArithUtil.add(this.contentofmedicine,gec.getContentofmedicine());
    	result.feedingcapacity=this.feedingcapacity.add(gec.getFeedingcapacity());
    	result.feedingtank=this.feedingtank.add(gec.getFeedingtank());
    	result.capacityoftank=this.capacityoftank.add(gec.getCapacityoftank());
    	result.firstextractionalcoholadd=ArithUtil.add(this.firstextractionalcoholadd, gec.getFirstextractionalcoholadd());
    	result.firstalcoholct=TempretureUtil.addCT(this.firstalcoholct, gec.getFirstalcoholct());
    	result.firstextractiontime=this.firstextractiontime.add(gec.getFirstextractiontime());
    	result.firstbackflowstreampressure=new Double(ArithUtil.add(this.firstbackflowstreampressure, gec.getFirstbackflowstreampressure()));
    	result.firstbackflowmaxtempreture=this.firstbackflowmaxtempreture.add(gec.getFirstbackflowmaxtempreture());
    	result.secondextractionalcoholadd=ArithUtil.add(this.secondextractionalcoholadd, gec.getSecondextractionalcoholadd());
    	result.secondalcoholct=TempretureUtil.addCT(this.secondalcoholct, gec.getSecondalcoholct());
    	result.secondextractiontime=this.secondextractiontime.add(gec.secondextractiontime);
    	result.secondbackflowstreampressure=ArithUtil.add(this.secondbackflowstreampressure, gec.getSecondbackflowstreampressure());
    	result.secondbackflowmaxtempreture=this.secondbackflowmaxtempreture.add(gec.getSecondbackflowmaxtempreture());
    	result.consteampressure=ArithUtil.add(this.consteampressure, gec.getConsteampressure());
    	result.confirstmaxtempreture=this.confirstmaxtempreture.add(gec.getConfirstmaxtempreture());
    	result.confirstminkpa=ArithUtil.add(this.confirstminkpa, gec.getConfirstminkpa());
    	result.consecondmaxtempreture=this.consecondmaxtempreture.add(gec.getConsecondmaxtempreture());
    	result.consecondminkpa=ArithUtil.add(this.consecondminkpa, gec.getConsecondminkpa());
    	result.contotletime=this.contotletime.add(gec.getContotletime());
    	result.extractionproportion=ArithUtil.add(this.extractionproportion, gec.getExtractionproportion());
    	result.extractiontemperature=this.extractiontemperature.add(gec.getExtractiontemperature());
    	result.concretequantity=this.concretequantity.add(gec.getConcretequantity());
    	return result;
    }
    
    public GardeniaExtrationConcentartion divide(double n){  	
    	GardeniaExtrationConcentartion result=new GardeniaExtrationConcentartion();
		BigDecimal bn=new BigDecimal(n);
		result.contentofmedicine=ArithUtil.div(this.contentofmedicine,n);
    	result.feedingcapacity=this.feedingcapacity.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.feedingtank=this.feedingtank.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.capacityoftank=this.capacityoftank.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.firstextractionalcoholadd=ArithUtil.div(this.firstextractionalcoholadd, n);
    	result.firstalcoholct=TempretureUtil.divCT(this.firstalcoholct, n);
    	result.firstextractiontime=this.firstextractiontime.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.firstbackflowstreampressure=ArithUtil.div(this.firstbackflowstreampressure, n);
    	result.firstbackflowmaxtempreture=this.firstbackflowmaxtempreture.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.secondextractionalcoholadd=ArithUtil.div(this.secondextractionalcoholadd,n);
    	result.secondalcoholct=TempretureUtil.divCT(this.secondalcoholct, n);
    	result.secondextractiontime=this.secondextractiontime.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.secondbackflowstreampressure=ArithUtil.div(this.secondbackflowstreampressure, n);
    	result.secondbackflowmaxtempreture=this.secondbackflowmaxtempreture.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.consteampressure=ArithUtil.div(this.consteampressure,n);
    	result.confirstmaxtempreture=this.confirstmaxtempreture.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.confirstminkpa=ArithUtil.div(this.confirstminkpa,n);
    	result.consecondmaxtempreture=this.consecondmaxtempreture.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.consecondminkpa=ArithUtil.div(this.consecondminkpa, n);
    	result.contotletime=this.contotletime.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.extractionproportion=ArithUtil.div(this.extractionproportion, n);
    	result.extractiontemperature=this.extractiontemperature.divide(bn,0,BigDecimal.ROUND_HALF_UP);
    	result.concretequantity=this.concretequantity.divide(bn,0,BigDecimal.ROUND_HALF_UP);
		return result;
    }
    
    
    public static GardeniaExtrationConcentartion sum(List<GardeniaExtrationConcentartion> gardeniaExtrationConcentartions){
		int totleRecords = gardeniaExtrationConcentartions.size();
		GardeniaExtrationConcentartion sumGardeniaExtrationConcentartion=null; 
		//统计各项参数均值
		if(0!=totleRecords){			
			for (GardeniaExtrationConcentartion item : gardeniaExtrationConcentartions) {
				if(null==sumGardeniaExtrationConcentartion){
					sumGardeniaExtrationConcentartion=item;
				}else{
					sumGardeniaExtrationConcentartion=sumGardeniaExtrationConcentartion.add(item);
				}
			}
		}
		return sumGardeniaExtrationConcentartion;
		
	}
    
    public static class CmpByConcretequantity implements Comparator<GardeniaExtrationConcentartion>{

		/* (比较器，根据浓缩浸膏重量(Kg)升序)
		 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
		 */
		@Override
		public int compare(GardeniaExtrationConcentartion o1, GardeniaExtrationConcentartion o2) {
			if(o1.getConcretequantity().subtract(o2.getConcretequantity()).intValue()>=0)
				return 1;
			else return -1;			
		}
	}
    
    public BigDecimal getBatchno() {
        return batchno;
    }

    public void setBatchno(BigDecimal batchno) {
        this.batchno = batchno;
    }

    public String getMedicinalno() {
        return medicinalno;
    }

    public void setMedicinalno(String medicinalno) {
        this.medicinalno = medicinalno == null ? null : medicinalno.trim();
    }

    public String getMedicinemaker() {
        return medicinemaker;
    }

    public void setMedicinemaker(String medicinemaker) {
        this.medicinemaker = medicinemaker == null ? null : medicinemaker.trim();
    }

    public Double getContentofmedicine() {
        return contentofmedicine;
    }

    public void setContentofmedicine(Double contentofmedicine) {
        this.contentofmedicine = contentofmedicine;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift == null ? null : shift.trim();
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public BigDecimal getFeedingcapacity() {
        return feedingcapacity;
    }

    public void setFeedingcapacity(BigDecimal feedingcapacity) {
        this.feedingcapacity = feedingcapacity;
    }

    public BigDecimal getFeedingtank() {
        return feedingtank;
    }

    public void setFeedingtank(BigDecimal feedingtank) {
        this.feedingtank = feedingtank;
    }

    public BigDecimal getCapacityoftank() {
        return capacityoftank;
    }

    public void setCapacityoftank(BigDecimal capacityoftank) {
        this.capacityoftank = capacityoftank;
    }

    public Double getFirstextractionalcoholadd() {
        return firstextractionalcoholadd;
    }

    public void setFirstextractionalcoholadd(Double firstextractionalcoholadd) {
        this.firstextractionalcoholadd = firstextractionalcoholadd;
    }

    public String getFirstalcoholct() {
        return firstalcoholct;
    }

    public void setFirstalcoholct(String firstalcoholct) {
        this.firstalcoholct = firstalcoholct == null ? null : firstalcoholct.trim();
    }

    public BigDecimal getFirstextractiontime() {
        return firstextractiontime;
    }

    public void setFirstextractiontime(BigDecimal firstextractiontime) {
        this.firstextractiontime = firstextractiontime;
    }

    public Double getFirstbackflowstreampressure() {
        return firstbackflowstreampressure;
    }

    public void setFirstbackflowstreampressure(Double firstbackflowstreampressure) {
        this.firstbackflowstreampressure = firstbackflowstreampressure;
    }

    public BigDecimal getFirstbackflowmaxtempreture() {
        return firstbackflowmaxtempreture;
    }

    public void setFirstbackflowmaxtempreture(BigDecimal firstbackflowmaxtempreture) {
        this.firstbackflowmaxtempreture = firstbackflowmaxtempreture;
    }

    public Double getSecondextractionalcoholadd() {
        return secondextractionalcoholadd;
    }

    public void setSecondextractionalcoholadd(Double secondextractionalcoholadd) {
        this.secondextractionalcoholadd = secondextractionalcoholadd;
    }

    public String getSecondalcoholct() {
        return secondalcoholct;
    }

    public void setSecondalcoholct(String secondalcoholct) {
        this.secondalcoholct = secondalcoholct == null ? null : secondalcoholct.trim();
    }

    public BigDecimal getSecondextractiontime() {
        return secondextractiontime;
    }

    public void setSecondextractiontime(BigDecimal secondextractiontime) {
        this.secondextractiontime = secondextractiontime;
    }

    public Double getSecondbackflowstreampressure() {
        return secondbackflowstreampressure;
    }

    public void setSecondbackflowstreampressure(Double secondbackflowstreampressure) {
        this.secondbackflowstreampressure = secondbackflowstreampressure;
    }

    public BigDecimal getSecondbackflowmaxtempreture() {
        return secondbackflowmaxtempreture;
    }

    public void setSecondbackflowmaxtempreture(BigDecimal secondbackflowmaxtempreture) {
        this.secondbackflowmaxtempreture = secondbackflowmaxtempreture;
    }

    public String getSecondbatchno() {
        return secondbatchno;
    }

    public void setSecondbatchno(String secondbatchno) {
        this.secondbatchno = secondbatchno == null ? null : secondbatchno.trim();
    }

    public String getSecondoperator() {
        return secondoperator;
    }

    public void setSecondoperator(String secondoperator) {
        this.secondoperator = secondoperator == null ? null : secondoperator.trim();
    }

    public Double getConsteampressure() {
        return consteampressure;
    }

    public void setConsteampressure(Double consteampressure) {
        this.consteampressure = consteampressure;
    }

    public BigDecimal getConfirstmaxtempreture() {
        return confirstmaxtempreture;
    }

    public void setConfirstmaxtempreture(BigDecimal confirstmaxtempreture) {
        this.confirstmaxtempreture = confirstmaxtempreture;
    }

    public Double getConfirstminkpa() {
        return confirstminkpa;
    }

    public void setConfirstminkpa(Double confirstminkpa) {
        this.confirstminkpa = confirstminkpa;
    }

    public BigDecimal getConsecondmaxtempreture() {
        return consecondmaxtempreture;
    }

    public void setConsecondmaxtempreture(BigDecimal consecondmaxtempreture) {
        this.consecondmaxtempreture = consecondmaxtempreture;
    }

    public Double getConsecondminkpa() {
        return consecondminkpa;
    }

    public void setConsecondminkpa(Double consecondminkpa) {
        this.consecondminkpa = consecondminkpa;
    }

    public BigDecimal getContotletime() {
        return contotletime;
    }

    public void setContotletime(BigDecimal contotletime) {
        this.contotletime = contotletime;
    }

    public Double getExtractionproportion() {
        return extractionproportion;
    }

    public void setExtractionproportion(Double extractionproportion) {
        this.extractionproportion = extractionproportion;
    }

    public BigDecimal getExtractiontemperature() {
        return extractiontemperature;
    }

    public void setExtractiontemperature(BigDecimal extractiontemperature) {
        this.extractiontemperature = extractiontemperature;
    }

    public BigDecimal getConcretequantity() {
        return concretequantity;
    }

    public void setConcretequantity(BigDecimal concretequantity) {
        this.concretequantity = concretequantity;
    }
}