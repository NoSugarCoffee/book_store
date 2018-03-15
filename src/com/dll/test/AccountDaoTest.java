package com.dll.test;

import java.util.List;

import org.junit.Test;

import com.dll.daoImpl.AccountDao;
import com.dll.entity.Account;
import com.dll.entity.PageBean;

public class AccountDaoTest {
	AccountDao accountDao=new AccountDao();
	@Test
	public void test(){
	}
	@Test
	public void test2(){
		Account account=new Account();
		account.setUsername("dll");
		account.setPassword("223");
	}
	@Test
	public void getAccountsbyPageList(){
		PageBean<Account> pb=new PageBean<Account>(1);
		accountDao.getAccountsByPageList(pb);
		System.out.println(pb.getTotalCount());
		List<Account> pageData = pb.getPageData();
		for (Account account : pageData) {
			System.out.println(account.getAccountid());
		}
	}
	@Test
	public void testFindByName(){
		Account findByName = accountDao.findByName("dlldll");
		System.out.println(findByName.getBalance());
	}
	
	
}
