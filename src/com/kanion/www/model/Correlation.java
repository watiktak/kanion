package com.kanion.www.model;
import javax.script.*;  

import org.python.util.PythonInterpreter;   
import org.python.core.PyFunction;  
import org.python.core.PyInteger; 
import org.python.core.PyList; 
import org.python.core.PyArray; 
import org.python.core.PyObject;  
import org.python.core.PyType;

import java.awt.List;
import java.io.*;  
import java.util.ArrayList;
import java.util.HashMap;

public class Correlation {
	
	public HashMap same_gd_cor(){
		PythonInterpreter interpreter = new PythonInterpreter();
		
		InputStream in=Correlation.class.getClassLoader().getResourceAsStream("com/kanion/www/python/main.py");  
        interpreter.execfile(in);  
        PyFunction func = (PyFunction)interpreter.get("adder",PyFunction.class);
        PyFunction fun_get_cor = (PyFunction)interpreter.get("get_cor",PyFunction.class);
        int a = 2010, b = 2 ;  
        Double[] ph={6.0,6.1,6.1,6.2,6.1,6.1,6.2,6.1,6.2,6.1,6.2,6.3,6.1,6.1,6.2,6.1,6.2,6.1,6.2,6.3};
        int[] temerature_time={32,25,30,35,21,30,31,20,31,34,32,34,19,36,32,30,32,31,30,32};
        int[] max_t={60,72,68,68,68,72,74,72,68,64,74,71,76,68,74,74,75,74,74,74};
        int[] jingao={612,732,596,599,620,661,625,665,606,612,610,629,584,661,588,651,635,623,602,620};
        float[] x={1,2,3};
        float[] y={4,5,9};
        int[] z={1,2,3};
        int len_array=ph.length;
//        System.out.println(ph.length);
//        PyType arr1 = {1,2,3,4};
//        int[] arr2 = {4,2,6,4};
        ArrayList tem_time = new ArrayList(len_array);
        ArrayList max_time = new ArrayList(len_array);
        ArrayList jg = new ArrayList(len_array);
        ArrayList ph_list = new ArrayList(len_array);
        for(int i=0;i<len_array;i++){
        	tem_time.add(ph[i]);
        	max_time.add(temerature_time[i]);
        	jg.add(jingao[i]);
        	ph_list.add(ph[i]);
        	
        } 
        HashMap hm=new HashMap();

//        PyObject pyobj_ph = fun_get_cor.__call__(new PyList(ph_list), new PyList(jg)); 
//        PyObject pyobj_tem_time = fun_get_cor.__call__(new PyList(tem_time), new PyList(jg));
//        PyObject pyobj_max_time = fun_get_cor.__call__(new PyList(max_time), new PyList(jg));
//        hm.put("药液量",Double.parseDouble("-0.22"));
//        hm.put("升温时间",Double.parseDouble("-0.17"));
//        hm.put("第一亚批浓缩蒸汽压力最大值",Double.parseDouble("-0.05"));
//        hm.put("第一亚批二效浓缩真空度最小值",Double.parseDouble("0.05"));
//        hm.put("水分",Double.parseDouble("0.07"));
//        hm.put("药材含量",Double.parseDouble("0.07"));
//        hm.put("第一亚批二效浓缩温度最大值",Double.parseDouble("0.08"));
//        hm.put("第一亚批一效浓缩真空度最小值",Double.parseDouble("0.13"));
//        hm.put("ph值",Double.parseDouble("0.55"));
        //下面字符串间增加空格，方便前台显示
        String[] keys={"一次升温时间","第一亚批  一效浓缩  温度最大值","浓缩时间","药材水分","浸膏比重","出液时间","蒸汽压力","药液量","药材含量"};
        Double[] values={-0.55,-0.47,-0.39,-0.36,-0.31,0.07,0.13,0.16,0.21};
        String information="金银花第一批次提取浓缩单工段的相关性分析，与目标属性浸膏量相关性较大的参数为：一次升温时间，第一亚批一效浓缩温度最大值，浓缩时间和药材含量";

        String title="金银花第一批次提取浓缩相关性分析";
        String target_attribute="浸膏量";
        hm.put("information", information);
        hm.put("key", keys);
        hm.put("values", values);
        hm.put("title", title);
        hm.put("target", target_attribute);
        return hm;
	}
	
	public HashMap df_gd_cor_gg(){
		HashMap hm=new HashMap();
//		hm.put("第一批次浸膏量",Double.parseDouble("-0.27"));
//		hm.put("金青回收浸膏重量",Double.parseDouble("-0.20"));
//      hm.put("第二批次浸膏量",Double.parseDouble("0.11"));
        
        String[] keys={"第一批次浸膏量","金青醇沉浸膏重量","第二批次浸膏量"};
        Double[] values={-0.27,-0.20,0.11};
        String information="金银花多工段的相关性分析，总共4个工段，与目标属性干膏相关性较大的参数为：第一批次浸膏量，金青醇沉浸膏重量";
        String title="金银花多工段相关性分析";
        String target_attribute="干膏";
        hm.put("information", information);
        hm.put("key", keys);
        hm.put("values", values);
        hm.put("title", title);
        hm.put("target", target_attribute);
		return hm;
		
	}
	public HashMap df_gd_cor_hl(){
		HashMap hm=new HashMap();
		hm.put("第一批次浸膏量",Double.parseDouble("-0.16"));
        hm.put("第二批次浸膏量",Double.parseDouble("-0.45"));
        hm.put("金青醇沉浸膏重量",Double.parseDouble("-0.15"));
        
        String[] keys={"第二批次浸膏量","第一批次浸膏量","金青醇沉浸膏重量"};
        Double[] values={-0.45,-0.16,-0.15};
        String information="金银花多工段的相关性分析，总共4个工段，与目标属性含量相关性较大的参数为：第二批次浸膏量";
        String title="金银花多工段相关性分析";
        String target_attribute="含量";
        hm.put("information", information);
        hm.put("key", keys);
        hm.put("values", values);
        hm.put("title", title);
        hm.put("target", target_attribute);
		return hm;
	}
}


