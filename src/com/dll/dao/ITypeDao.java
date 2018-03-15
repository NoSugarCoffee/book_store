package com.dll.dao;

import java.util.List;

import com.dll.entity.Type;

public interface ITypeDao {
	List<Type> getAll();
	int save(String type);
	int update(String typeName,int id);
	int deleteById(int id);
}
