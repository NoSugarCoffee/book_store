package com.dll.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.dll.entity.Account;
import com.dll.entity.Order;
import com.dll.entity.OrderItem;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;
import com.dll.entity.ShoppingCartItem;
import com.dll.util.JdbcUtils;
import com.dll.util.MyUtils;
import com.dll.util.TxQueryRunner;

public class OrderDao{
	private static QueryRunner queryRunner=new TxQueryRunner();
	private static AccountDao accountDao=new AccountDao();
	private static BookDao bookDao=new BookDao();
	//private static TradeDao tradeDao=new TradeDao();
	
	public List<OrderItem> getOrderItem(String orderitemid){
		String sql="select * from orderitem where itemid=?";
		try {
			List<OrderItem> orderItems=queryRunner.query(sql,new BeanListHandler<OrderItem>(OrderItem.class),orderitemid);
			return orderItems;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public Long totalCount(String user){
		List<Object> list=new ArrayList<Object>();
		StringBuilder sb=new StringBuilder(50);
		sb.append("	select ");
		sb.append("		count(*) ");
		sb.append("	from ");
		sb.append("		orderlist");
		
		if(user!=null){
			sb.append(" where ");
			sb.append(" owner=? ");
			list.add(user);
		}
		
		try {
			return (Long)queryRunner.query(sb.toString(),new ScalarHandler<Long>(),list.toArray());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void getOrder(PageBean<Order> pb,String user){
		StringBuilder sb=new StringBuilder(50);
		List<Object> list =new ArrayList<Object>();
		sb.append("	select * ");
		sb.append("		from ");
		sb.append("	orderlist ");
		
		if(user!=null){
			
			sb.append("		where ");
			sb.append(" owner=? ");
			list.add(user);
		}
		pb.setTotalCount(totalCount(user).intValue());
		
		sb.append(" order by  ");
		sb.append(" ordertime   desc limit ?,? ");
		list.add((pb.getCurrentPage()-1)*pb.getPageCount());
		list.add(pb.getPageCount());
		
		try {
			List<Order> order = queryRunner.query(sb.toString(), new BeanListHandler<Order>(Order.class),list.toArray());
			for (Order order2 : order) {
				List<OrderItem> orderItem=getOrderItem(order2.getOrderitemid());
				order2.setOrderItem(orderItem);
			}
			pb.setPageData(order);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void saveOrderItem(ShoppingCart shoppingCart,String itemid){
		Collection<ShoppingCartItem> books = shoppingCart.getBooks();
		ArrayList<ShoppingCartItem> shoppingCartItem= new ArrayList<ShoppingCartItem>(books);
		
		String sql="insert into orderitem values(?,?,?,?,?)";
		Object[][] params=new Object[shoppingCartItem.size()][5];
		for (int i=0;i<shoppingCartItem.size();i++) {
				params[i][0]=itemid;
				params[i][1]=shoppingCartItem.get(i).getBook().getBookName();
				params[i][2]=shoppingCartItem.get(i).getBook().getId();
				params[i][3]=shoppingCartItem.get(i).getQuantity();
				params[i][4]=shoppingCartItem.get(i).getBook().getPrice();
		}
		try {
			queryRunner.batch(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void saveOrder(String user,ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		String sql="insert into orderlist values(?,?,?,?,?,?)";
		String itemid=MyUtils.getUUID();
		try {
			queryRunner.update(sql,MyUtils.getUUID(),new Date(),itemid,user,1,shoppingCart.getTotalMoney());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		saveOrderItem(shoppingCart,itemid);
	}
	
	public void cancel(String oid){
		String sql="delete from orderlist where oid=?";
		try {
			queryRunner.update(sql,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public Order findOrder(String oid) {
		// TODO Auto-generated method stub
		
		String sql="select * from orderlist where oid=?";
		
		Order order=null;
		try {
			order=queryRunner.query(sql, new BeanHandler<Order>(Order.class),oid);
			order.setOrderItem(getOrderItem(order.getOrderitemid()));
			return order;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void changeStatus(int status,String oid){
		String sql="update orderlist set status=? where oid=?";
		try {
			queryRunner.update(sql,status,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int pay(Order order) {
		// TODO Auto-generated method stub
		List<OrderItem> orderItem = order.getOrderItem();
		
		try {
			JdbcUtils.beginTransation();
			String owner = order.getOwner();
			Account account = accountDao.findByName(owner);
			//付款
			accountDao.UpdateBalance(owner,order.getTotal());
			//更新数量
			bookDao.changeAmount(order);
			changeStatus(2,order.getOid());
			JdbcUtils.commitTransation();
			return 1;
		}catch(Exception e){
			try {
				JdbcUtils.rollBackTransation();
				return 0;
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return 0;
	}
}
