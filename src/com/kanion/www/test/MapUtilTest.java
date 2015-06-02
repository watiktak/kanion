/**
* Filename: MapUtilTest.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年12月4日  下午1:24:31
* Description:
*
* 
*/
package com.kanion.www.test;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.kanion.www.util.MapUtil;

/**
 * @ClassName: MapUtilTest
 * @Description: TODO
 * @date 2014年12月4日 下午1:24:31
 *
 */
public class MapUtilTest {
	
	@Test
	public void testAdd(){
		Map map1=new HashMap();
		map1.put("x", new BigDecimal("10"));
		map1.put("y", new Double(0.02));
		Map map2=new HashMap();
		map2.put("x", new BigDecimal("20"));
		map2.put("y", new Double(3.02));
		Map result=MapUtil.add(map1, map2);
		assert(((BigDecimal)result.get("x")).compareTo(new BigDecimal("30"))==0);
		assert(((Double)result.get("y")).shortValue()==3.04);
	}

	
	@Test
	public void testDivide(){
		Map map1=new HashMap();
		map1.put("x", new BigDecimal("10"));
		map1.put("y", new Double(0.02));
		Map result=MapUtil.divide(map1, 2.0);
		assert(((BigDecimal)result.get("x")).compareTo(new BigDecimal("5"))==0);
		assert(((Double)result.get("y")).shortValue()==1);
				
	}
}
