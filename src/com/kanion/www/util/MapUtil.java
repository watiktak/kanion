/**
* Filename: MapUtil.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2014年12月4日  下午1:05:39
* Description:对map的公用计算，包括加减乘除等。
*
* 
*/
package com.kanion.www.util;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * @ClassName: MapUtil
 * @Description: TODO
 * @date 2014年12月4日 下午1:05:39
 *
 */
public class MapUtil {
	//两个map中数值型值相加
	public static Map add(Map a,Map b){
		
		Map result=new HashMap();
		Set<Map.Entry> set=a.entrySet();
		for(Iterator iters=set.iterator();iters.hasNext();){
			Map.Entry iter=(Map.Entry) iters.next();
			String key=(String) iter.getKey();
			Object v1=a.get(key);
			Object v2=b.get(key);
			Object value=null;
			if(v1==null) value=v2;
			else if(v2==null) value=v1;
			else{
				if(v1.getClass()==BigDecimal.class){
					value=((BigDecimal)v1).add((BigDecimal)v2);
				}else if(v1.getClass()==Double.class){
					value=new Double(ArithUtil.add((double)v1, (double)v2));
				}
			}
			result.put(key, value);
		}
		return result;
	}
	//map中数值型值除以n
	public static Map divide(Map a,double n){
		Map result=new HashMap();
		BigDecimal bn=new BigDecimal(n);
		Set<Map.Entry> set=a.entrySet();
		for(Iterator iters=set.iterator();iters.hasNext();){
			Map.Entry iter=(Map.Entry) iters.next();
			String key=(String) iter.getKey();
			Object v1=a.get(key);
			if(null!=v1){
				Object value=null;
				if(v1.getClass()==BigDecimal.class){
					value=((BigDecimal)v1).divide(bn,4,BigDecimal.ROUND_HALF_DOWN);
				}else if(v1.getClass()==Double.class){
					value=new Double(ArithUtil.div((double)v1, n));
				}
				result.put(key, value);
			}else{
				result.put(key, null);
			}
		}
		return result;
		
	}

}
