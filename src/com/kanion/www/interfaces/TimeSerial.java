/**
* Filename: TimeSerial.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年3月20日  下午4:55:12
* Description:
*	时间序列表中某一个时间点的值,这个时间点需要提供
* 
*/
package com.kanion.www.interfaces;
/**
 * @ClassName: TimeSerial
 * @Description: TODO
 * @date 2015年3月20日 下午4:55:12
 *
 */
public interface TimeSerial<T extends Number> {
	
	public String getTime();
	
	public String getNumber();
}
