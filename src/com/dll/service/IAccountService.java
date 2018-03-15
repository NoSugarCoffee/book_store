package com.dll.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dll.entity.Account;
import com.dll.entity.Admin;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;

public interface IAccountService {
	boolean save(Account account);
	boolean checkBalance(String username, double money);
	Account findByName(String username);
	//int pay(String username, ShoppingCart shoppingCart);
	void getAccountsByPageList(PageBean<Account> pb);
	void delete(int accountid);
	int update(Account account);
	Account findById(int parseInt);
	boolean ajaxCheck(String username);
	boolean adminLogin(String username, String password);
}
