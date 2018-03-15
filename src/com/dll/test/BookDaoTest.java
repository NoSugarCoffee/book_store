package com.dll.test;

import java.util.List;

import org.junit.Test;

import com.dll.daoImpl.BookDao;
import com.dll.entity.Book;
import com.dll.entity.Condition;
import com.dll.entity.PageBean;

public class BookDaoTest {
	private BookDao bookDao=new BookDao();
	/**
	 * 条件分页的测试
	 */
	@Test
	public void test2() {
		PageBean<Book> pb=new PageBean<Book>(1);
		Condition condition=new Condition();
		condition.setId(3);
		pb.setCondition(condition);
		bookDao.getAll(pb);
		List<Book> books = pb.getPageData();
		for (Book book : books) {
			System.out.println(book.getBookName()+""+book.getStoreNumber());
		}
	}
	/*
	 * 测试最新图书
	 * */
	@Test
	public  void test3(){
		Book find = bookDao.find(1);
		System.out.println(find.getStoreNumber());
	}
	/*
	 * 推荐图书
	 * */
	@Test
	public void testRecommend(){
		List<Book> recommend = bookDao.recommend();
		for (Book book : recommend) {
			System.out.println(book.getBookName());
		}
	}
	/*
	 * 更新图书
	 */
	public void testUpdate(){
		Book book=new Book();
		book.setId(23);
		book.setType(2);
		book.setBookName("test");
		book.setImgPath("a");
		System.out.println(book);
		bookDao.update(book);
	}
	@Test
	public void testSearch(){
		List<Book> findByName = bookDao.findByName("s");
		for (Book book : findByName) {
			System.out.println(book.getBookName());
		}
	}
}
