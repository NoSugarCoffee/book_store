package com.dll.serviceImpl;

import com.dll.dao.IAccountDao;
import com.dll.entity.Account;
import com.dll.entity.Admin;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;
import com.dll.factory.BeanFactory;
import com.dll.service.IAccountService;

public class AccountService implements IAccountService{
	private IAccountDao accountDao=(IAccountDao)BeanFactory.getInstance("AccountDao");
	@Override
	public boolean save(Account account) {
		return accountDao.save(account);
	}
	public Account findById(int accountId){
		return accountDao.findById(accountId);
	}
	
	@Override
	public Account findByName(String username) {
		return accountDao.findByName(username);
	}
	
	/*public int pay(String username,ShoppingCart shoppingCart) {
		return accountDao.pay(username,shoppingCart);
	}*/
	
	@Override
	public boolean checkBalance(String username,double money) {
		System.out.println(username);
		Account account = accountDao.findByName(username);
		if(account.getBalance()>=money)
			return true;
		return false;
	}

	@Override
	public void getAccountsByPageList(PageBean<Account> pb) {
		// TODO Auto-generated method stub
		 accountDao.getAccountsByPageList(pb);
	}
	
	public void delete(int accountid){
		accountDao.delete(accountid);
	}

	@Override
	public int update(Account account) {
		// TODO Auto-generated method stub
		return accountDao.update(account);
	}
	
	@Override
	public boolean ajaxCheck(String username){
		return accountDao.ajaxCheck(username);
	}
	@Override
	public boolean adminLogin(String username,String password) {
		Admin admin = accountDao.adminLogin(username);
		System.out.println(admin.getPassword());
		return admin.getPassword().equals(password);
	}
	
	
}
