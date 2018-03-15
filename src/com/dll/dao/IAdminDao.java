package com.dll.dao;

import com.dll.entity.Admin;

public interface IAdminDao {
	Admin findByName(String name);
}
