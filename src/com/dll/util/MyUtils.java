package com.dll.util;

import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.junit.Test;

import com.dll.test.T;

public class MyUtils {
	/*
	 * 生成UUID
	 * */
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	/*
	 * BeanUtils的封装，并支持String-->Date的自动转型
	 * */
	public static  <T> T MapToBean(Map<String, Object> map,Class<T> clz) throws IllegalArgumentException, IllegalAccessException, InstantiationException, InvocationTargetException{
		T t = clz.newInstance();
		ConvertUtils.register(new Converter() {
			@Override
			public Object convert(Class arg0, Object arg1) {
				DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
				if(arg1 instanceof String)
					try {
						return dateFormat.parse((String)arg1);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				}
				return arg1;
			}
		},Date.class);
		BeanUtils.populate(t, map);
		return t;
	}
}
