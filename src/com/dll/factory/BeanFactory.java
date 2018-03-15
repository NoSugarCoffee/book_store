package com.dll.factory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class BeanFactory {

	public static Object getInstance(String name){
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream resourceAsStream = classLoader.getResourceAsStream("instance.properties");
		Properties properties=new Properties();
		try {
			properties.load(resourceAsStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String property = properties.getProperty(name);
		Object newInstance=null;
		try {
			newInstance = Class.forName(property).newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return newInstance;
	}
}
