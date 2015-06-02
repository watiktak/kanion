/**
* Filename: TempretureUtil.java
* Project Name: kanion
* @author: cyz	63954008(at)qq.com
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014-10-13  上午9:10:56
* Description:温度字符串转数值
*
* Modification History:
* Date			Author		Version		Description
* ------------------------------------------------------------------
* 2014-10-13	cyz    		1.0			1.0 Version
*/
package com.kanion.www.util;

import java.math.BigDecimal;

/**
 * @ClassName: TempretureUtil
 * @Description: TODO
 * @date 2014-10-13 上午9:10:56
 *
 */
public class TempretureUtil {
	
	public static double stringToVal(String tmp){
		return new BigDecimal(tmp.substring(0,tmp.indexOf("℃"))).doubleValue();
	}
	
	public static String add(String t1,String t2){
		BigDecimal d1=new BigDecimal(t1.substring(0,t1.indexOf("℃")));
		BigDecimal d2=new BigDecimal(t2.substring(0,t2.indexOf("℃")));
		return d1.add(d2).toString()+"℃";
	}
	
	public static String div(String tmp,double n){
		double result=stringToVal(tmp);
		return Double.toString(ArithUtil.div(result, n))+"℃";
	}

	
	//从乙醇浓度、温度字段获取浓度
		public static Double getConcentration(String str){
			
			return Double.parseDouble(str.substring(0, str.indexOf('%')));
		
		}
		
		//从乙醇浓度、温度字段获取温度
		public static Double getTemp(String str){
			
			return Double.parseDouble(str.substring(str.indexOf('、')+1,str.indexOf('℃')));
			
		}
		
		//将乙醇浓度、温度字段字符串相加
		public static String addCT(String ct1,String ct2){
			
			String result="";
			result+=ArithUtil.add(getConcentration(ct1),getConcentration(ct2))+"%、";
			result+=ArithUtil.add(getTemp(ct1), getTemp(ct2))+"℃";
			return result;
			
		}
		
		public static String divCT(String ct,double n){
			String result="";
			result+=ArithUtil.div(getConcentration(ct), n)+"%、";
			result+=ArithUtil.div(getTemp(ct), n)+"℃";
			return result;
		}
}
