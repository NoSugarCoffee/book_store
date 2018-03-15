package com.dll.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.dll.dao.IAccountDao;
import com.dll.entity.Account;
import com.dll.entity.Admin;
import com.dll.entity.Condition;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;
import com.dll.factory.BeanFactory;
import com.dll.util.JdbcUtils;
import com.dll.util.TxQueryRunner;

public class AccountDao implements IAccountDao {
	private static QueryRunner queryRunner=new TxQueryRunner();
	private static BookDao bookDao=(BookDao) BeanFactory.getInstance("BookDao");
//	/private static TradeDao tradeDao=(TradeDao)BeanFactory.getInstance("TradeDao");
	/**
	 * 增加用户
	 */
	@Override
	public boolean save(Account account) {
		// TODO Auto-generated method stub
		String sql="insert into account (username,password,email,phone,address,balance)values (?,?,?,?,?,?)";
		try {
			queryRunner.update(sql,account.getUsername(),account.getPassword(),account.getEmail(),account.getPhone(),account.getAddress(),account.getBalance());
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	/*
	 * 登录检查,返回整个 bean
	 * */
	public Account findByName(String username){
		String sql="select accountid,username,password,email,phone,address,balance from account where username=?";
		try {
			return queryRunner.query(sql,new BeanHandler<Account>(Account.class),username);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	/*
	 *根据accountid 查找 账户  批处理
	 * */
	public Account findById(int accountid){
		String sql="select * from account where accountid=?";
		try {
			return queryRunner.query(sql, new BeanHandler<Account>(Account.class),accountid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/*
	 * 更新账户
	 * */
	public void UpdateBalance(String username,double money){
		String sql="update account set balance=balance-? where username=?";
		try {
			queryRunner.update(sql,money,username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*
	 * 账户数量
	 */
	public Long getTotalCount(){
		String sql="select count(*) from account";
		try {
			return queryRunner.query(sql, new ScalarHandler<Long>());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/*
	 * 查询所有账户
	 */
	@Override
	public void getAccountsByPageList(PageBean<Account> pb) {
		// TODO Auto-generated method stub
		String sql="select * from account limit ?,?";
		pb.setTotalCount(this.getTotalCount().intValue());
		pb.setPageCount(8);
		List<Account> accounts=null;
		try {
			accounts = queryRunner.query(sql, new BeanListHandler<Account>(Account.class),pb.getPageCount()*(pb.getCurrentPage()-1),pb.getPageCount());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pb.setPageData(accounts);
	}
	/*
	public int pay(String username,ShoppingCart shoppingCart){
		try {
			JdbcUtils.beginTransation();
			//付款
			UpdateBalance(username, shoppingCart.getTotalMoney());
			//更新数量
			bookDao.changeAmount(shoppingCart);
			Long tradeId = tradeDao.insertTrade(username);
			tradeDao.insertTradeItem(shoppingCart, tradeId.intValue());
			JdbcUtils.commitTransation();
			return 1;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollBackTransation();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				return 0;
			}
			e.printStackTrace();
			return 0;
		}
	}*/

	@Override
	public void delete(int accountid) {
		// TODO Auto-generated method stub
		String sql="delete from account where accountid=?";
		try {
			queryRunner.update(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int update(Account account) {
		// TODO Auto-generated method stub
		String sql="update account set username=?,password=?,email=?,phone=?,address=?,balance=? where accountid=?";
			try {
				return queryRunner.update(sql,account.getUsername(),account.getPassword(),account.getEmail(),account.getPhone(),account.getAddress(),account.getBalance(),account.getAccountid());
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return 0;
	}
	
	public boolean ajaxCheck(String username){
		Account account = findByName(username);
		if(account!=null){
			return true;
		}
		return false;
	}

	@Override
	public Admin adminLogin(String username) {
		String sql="select * from admin where name=?";
		try {
			return queryRunner.query(sql, new BeanHandler<Admin>(Admin.class),username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
