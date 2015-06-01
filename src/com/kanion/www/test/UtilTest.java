/**
* Filename: UtilTest.java
* Project Name: kanion
* @author: cyz	63954008(at)qq.com
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年11月23日  下午4:31:37
* Description:
*
* Modification History:
* Date			Author		Version		Description
* ------------------------------------------------------------------
* 2014年11月23日	cyz    		1.0			1.0 Version
*/
package com.kanion.www.test;

import org.junit.Test;

import com.kanion.www.util.TempretureUtil;

/**
 * @ClassName: UtilTest
 * @Description: TODO
 * @date 2014年11月23日 下午4:31:37
 *
 */
public class UtilTest {
	
	@Test
	public void testGetConcentration(){
		Double result=TempretureUtil.getConcentration("81%、22℃");
		assert(result.doubleValue()==80);
		
	}
	
	
	@Test
	public void testGetTemp(){
		Double result=TempretureUtil.getTemp("81%、22℃");
		assert(result.doubleValue()==22);
	}

	@Test
	public void testAddCT(){
		String result=TempretureUtil.addCT("40%、22℃", "41%、20℃");
		assert(result.compareTo("81%、42℃")==0);
	}
	
	@Test
	public void testDivCT(){
		String result=TempretureUtil.divCT("40%、22℃", 2);
		assert(result.compareTo("20%、11℃")==0);
	}
}
