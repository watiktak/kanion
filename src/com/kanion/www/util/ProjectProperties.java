package com.kanion.www.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ProjectProperties {
	
	
	public static final Properties projectProperties=new Properties();
	
	static{
		InputStream inputStream = projectProperties.getClass().getClassLoader().getResourceAsStream("com.kanion.www.json.project_properties");   
		  try {   
			  projectProperties.load(inputStream);   
		  } catch (IOException e1) {   
		   e1.printStackTrace();   
		  }   
	}
	
	//防止反射注入
	private ProjectProperties(){
		if(null!=projectProperties){
			throw new IllegalArgumentException("No exist the second instance!");
		}
	};
	
	public static Properties getSingleton(){
		return projectProperties;
	}
}
