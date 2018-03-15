package com.dll.serviceImpl;

import java.util.List;

import com.dll.dao.ITypeDao;
import com.dll.entity.Type;
import com.dll.factory.BeanFactory;
import com.dll.service.ITypeService;

public class TypeService implements ITypeService{
	private ITypeDao typeDao=(ITypeDao)BeanFactory.getInstance("TypeDao");
	
	@Override
	public List<Type> getAll() {
		return typeDao.getAll();
	}
	
	@Override
	public boolean save(String type){
		if(typeDao.save(type)==1){
			return true;
		}
		return false;
	}
	
	@Override
	public int deleteById(int id) {
		return typeDao.deleteById(id);
	}
	
	@Override
	public int update(int id, String typeName) {
		return typeDao.update(typeName, id);
	}
}
