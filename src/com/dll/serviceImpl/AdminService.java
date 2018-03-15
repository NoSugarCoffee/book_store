package com.dll.serviceImpl;

import com.dll.factory.BeanFactory;
import com.dll.service.IAdminService;

public class AdminService implements IAdminService{
	private IAdminService adminService=(IAdminService)BeanFactory.getInstance("AdminService");
	@Override
	public boolean findByName(String name) {
		
		
		return false;
	}

}
