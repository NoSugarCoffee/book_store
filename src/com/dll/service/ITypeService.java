package com.dll.service;

import java.util.List;

import com.dll.entity.Type;

public interface ITypeService {
	List<Type> getAll();
	boolean save(String typeName);
	int deleteById(int parseInt);
	int update(int parseInt, String typeName);
}
