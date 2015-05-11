/**
 * Filename: KanionUtil.java
 * Project Name: kanion
 * @author: cyz	63954008(at)qq.com
 * @version: 1.0
 * @since: JDK 1.7.0_45
 * Copyright © 2014 CCNT. All Rights Reserved
 * Create at: 2014年10月29日  下午1:44:58
 * Description:
 *
 * Modification History:
 * Date			Author		Version		Description
 * ------------------------------------------------------------------
 * 2014年10月29日	cyz    		1.0			1.0 Version
 */
package com.kanion.www.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Util {
	// 处理小数问题时出现的精度误差，min为极小数
	public static final double MIN = 0.000000000000000001;
	// 图表展现正态分布时每个分布区间步长，值越大步长越小,取可除尽的值，防止出现精度不准确
	public static final int categoryCount = 5;

	/**
	 * 
	 * @Title: readFile
	 * @Description: read file from disk,
	 * @param @param path
	 * @param @return
	 * @return String the string in file.
	 * @throws
	 */
	public static final String readFile(String path) {
		BufferedReader reader = null;
		String returnStr = "";
		try {
			InputStream in=Util.class.getClassLoader().getResourceAsStream(path);//相对工程路径，类加载器会从src开始查找
			InputStreamReader inputStreamReader = new InputStreamReader(
					in, "UTF-8");
			reader = new BufferedReader(inputStreamReader);
			String tempString = null;
			while ((tempString = reader.readLine()) != null) {
				returnStr += tempString;
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return returnStr;
	}
}
