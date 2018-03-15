package com.dll.serviceImpl;

import com.dll.daoImpl.OrderDao;
import com.dll.entity.Order;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;
import com.dll.factory.BeanFactory;

public class OrderService {
	private OrderDao orderDao=(OrderDao) BeanFactory.getInstance("OrderDao");
	
	public void getOrder(PageBean pb,String user){
		orderDao.getOrder(pb,user);
	}
	public void saveOrder(String user,ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		orderDao.saveOrder(user, shoppingCart);
	}
	public void cancel(String oid) {
		// TODO Auto-generated method stub
		orderDao.cancel(oid);
	}
	public Order findOrder(String oid){
		return orderDao.findOrder(oid);
	}
	public int pay(Order order) {
		// TODO Auto-generated method stub
		return orderDao.pay(order);
	}
	public void confirm(String oid, String status) {
		// TODO Auto-generated method stub
		orderDao.changeStatus(Integer.parseInt(status), oid);
	}
}
