package com.dll.serviceImpl;

import java.util.List;

import com.dll.dao.IBookDao;
import com.dll.entity.Book;
import com.dll.entity.Order;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;
import com.dll.factory.BeanFactory;
import com.dll.service.IBookService;

public class BookService implements IBookService{
	private IBookDao bookDao=(IBookDao)BeanFactory.getInstance("BookDao");
	@Override
	public void getAll(PageBean<Book> pb) {
		bookDao.getAll(pb);
	}

	@Override
	public Book find(int id) {
		return bookDao.find(id);
	}

	@Override
	public List<Book> getByTime() {
		// TODO Auto-generated method stub
		return bookDao.getByTime();
	}

	@Override
	public List<Book> hotBook() {
		return bookDao.hotBook();
	}
	
	@Override
	public List<Book> recommend(){
		return bookDao.recommend();
	}
	
	@Override
	public boolean checkAmount(ShoppingCart shoppingCart){
		return bookDao.checkAmount(shoppingCart);
	}

	@Override
	public void changeAmount(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		bookDao.changeAmount(shoppingCart);
	}
	@Override
	public void save(Book book){
		bookDao.save(book);
	}
	@Override
	public List<Book> findByName(String name){
		return bookDao.findByName(name);
	}

	@Override
	public void update(Book book) {
		// TODO Auto-generated method stub
		bookDao.update(book);
	}
	@Override
	public void delete(int id){
		bookDao.delete(id);
	}

	@Override
	public boolean checkAmount(Order order) {
		return bookDao.checkAmount(order);
	}
	
}
