package com.dll.dao;

import com.dll.entity.Account;
import com.dll.entity.Admin;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;

public interface IAccountDao {
	 boolean save(Account account);
	 //int pay(String username,ShoppingCart shoppingCart);
	 Account findByName(String username);
	 Account findById(int accountid);
	void getAccountsByPageList(PageBean<Account> pb);
	void delete(int accountid);
	int update(Account account);
	boolean ajaxCheck(String username);
	Admin adminLogin(String username);
}
