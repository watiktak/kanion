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
/**
 * @ClassName: TempretureUtil
 * @Description: TODO
 * @date 2014-10-13 上午9:10:56
 *
 */
public class TempretureUtil {
	
	public static Double stringToVal(String tmp){
		return Double.parseDouble(tmp.substring(0,tmp.indexOf("℃")));
	}
}
