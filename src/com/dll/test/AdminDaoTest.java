package com.dll.test;

import org.junit.Test;

import com.dll.daoImpl.AdminDao;
import com.dll.entity.Admin;

public class AdminDaoTest {
	@Test
	public void test(){
		AdminDao adminDao=new AdminDao();
		Admin flag = adminDao.findByName("admin");
		System.out.println(flag.getName());
		System.out.println(flag.getPassword());
	}
}
