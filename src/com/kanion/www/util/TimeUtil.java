/**
 * Filename: TimeUtil.java
 * Project Name: kanion
 * @author: cyz	63954008(at)qq.com
 * @version: 1.0
 * @since: JDK 1.7.0_45
 * Copyright © 2014 CCNT. All Rights Reserved
 * Create at: 2014-10-12  下午10:29:28
 * Description:时间处理相关的通用方法。
 *
 * Modification History:
 * Date			Author		Version		Description
 * ------------------------------------------------------------------
 * 2014-10-12	cyz    		1.0			1.0 Version
 */
package com.kanion.www.util;

/**
 * @ClassName: TimeUtil
 * @Description: TODO
 * @date 2014-10-12 下午10:29:28
 * 
 */
public class TimeUtil {

	//将时间字符串转换为小时
	public static double changeToHour(String timeString) {
		timeString = timeString.replace("小时", ",");
		timeString = timeString.replace("分钟", ",");
		String[] time = new String[2];
		time = timeString.split(",");
		int hour=0,miniute=0;
		for(int i=0;i<time.length;i++){
			if(0==i) hour = Integer.parseInt(time[i]);
			if(1==i) miniute = Integer.parseInt(time[1]);
		}
		return hour+miniute/60.0;
	}

}
