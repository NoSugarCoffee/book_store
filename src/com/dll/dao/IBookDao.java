package com.dll.dao;

import java.util.List;

import com.dll.entity.Book;
import com.dll.entity.Order;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;

public interface IBookDao {
	void getAll(PageBean<Book> pb);
	Book find(int id);
	List<Book> getByTime();
	List<Book> hotBook();
	boolean checkAmount(ShoppingCart shoppingCart);
	void changeAmount(ShoppingCart shoppingCart);
	List<Book> recommend();
	void save(Book book);
	List<Book> findByName(String name);
	void update(Book book);
	void delete(int id);
	boolean checkAmount(Order order);
}
