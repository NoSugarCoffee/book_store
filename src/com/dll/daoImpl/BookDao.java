package com.dll.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.ejb.FinderException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.dll.dao.IBookDao;
import com.dll.entity.Book;
import com.dll.entity.Condition;
import com.dll.entity.Order;
import com.dll.entity.OrderItem;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;
import com.dll.entity.ShoppingCartItem;
import com.dll.util.JdbcUtils;
import com.dll.util.TxQueryRunner;

public class BookDao implements IBookDao{
	private static QueryRunner queryRunner=new TxQueryRunner();
	/*
	 * 带条件的记录数查询
	 */
	public Long totalCount(Condition condition){
		List<Object> list=new ArrayList<Object>();
		StringBuilder sb=new StringBuilder(50);
		sb.append("	select");
		sb.append("		count(*)");
		sb.append("	from ");
		sb.append("		book");
		sb.append("	where");
		sb.append("		price>?");
		sb.append("	and price<?");
		list.add(condition.getMinPrice());
		list.add(condition.getMaxPrice());
		if(condition.getId()!=0){
			sb.append("	and type=?");
			list.add(condition.getId());
		}
		
		try {
			return (Long)queryRunner.query(sb.toString(),new ScalarHandler<Long>(),list.toArray());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void getAll(PageBean<Book> pb){
		List<Object> list=new ArrayList<Object>();
		Condition condition = pb.getCondition();
		pb.setTotalCount(totalCount(condition).intValue());
		
		StringBuilder sb=new StringBuilder(50);
		sb.append("	select");
		sb.append("		*");
		sb.append("	from ");
		sb.append("		book");
		sb.append("	where");
		sb.append("		price>?");
		sb.append("	and price<?");
		list.add(condition.getMinPrice());
		list.add(condition.getMaxPrice());
		if(condition.getId()!=0){
			sb.append("	and type=?");
			list.add(condition.getId());
		}
		sb.append("	limit ?,?");
		list.add(pb.getPageCount()*(pb.getCurrentPage()-1));
		list.add(pb.getPageCount());
		List<Book> books=null;
		try {
			books = queryRunner.query(sb.toString(), new BeanListHandler<Book>(Book.class),list.toArray());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pb.setPageData(books);
	}

	@Override
	public Book find(int id) {
		String sql="select * from book where id =?";
		try {
			return queryRunner.query(sql, new BeanHandler<Book>(Book.class),id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Book> getByTime(){
		String sql="select * from book order by dateTime desc limit 0,5";
		try {
			return queryRunner.query(sql, new BeanListHandler<Book>(Book.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<Book> hotBook(){
		String sql="select * from book order by salesAmount desc limit 0,5";
		try {
			return queryRunner.query(sql, new BeanListHandler<Book>(Book.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Test
	public List<Book> recommend(){
		String sql="select bookid from recommend where recommend=1";
		List<Book> lists=new ArrayList<Book>();
		try {
			List<Integer> array = queryRunner.query(sql,new ColumnListHandler<Integer>(1));
			for (int i = 0; i < array.size(); i++) {
				Book book = find(array.get(i));
				lists.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lists;
	}	
	@Override
	public boolean checkAmount(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		Collection<ShoppingCartItem> books = shoppingCart.getBooks();
		boolean flag=true;
		for (ShoppingCartItem shoppingCartItem : books) {
			Book book=find(shoppingCartItem.getBook().getId());
			if(book.getStoreNumber()<shoppingCartItem.getQuantity()){
				flag=false;
			}	
		}
		
		return flag;
	}
	@Override
	public void changeAmount(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		Collection<ShoppingCartItem> books = shoppingCart.getBooks();
		for (ShoppingCartItem shoppingCartItem : books) {
			Book book=find(shoppingCartItem.getBook().getId());
			String sql="update book set storeNumber=storeNumber-? , salesAmount=salesAmount+? where id=?";
			try {
				queryRunner.update(sql,shoppingCartItem.getQuantity(),shoppingCartItem.getQuantity(),book.getId());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void changeAmount(Order order){
		List<OrderItem> orderItem = order.getOrderItem();
		
		Object params[][]=new Object[orderItem.size()][3];
		for(int i=0;i<orderItem.size();i++){
			params[i][0]=orderItem.get(i).getQuantity();
			params[i][1]=orderItem.get(i).getQuantity();
			params[i][2]=orderItem.get(i).getBookId();
		}
		String sql="update book set storeNumber=storeNumber-? , salesAmount=salesAmount+? where id=?";
		try {
			queryRunner.batch(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@Override
	public void save(Book book) {
		// TODO Auto-generated method stub
		String sql="insert into book(bookName,price,details,imgPath,type,dateTime,author,publishing,storeNumber,salesAmount) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params=new Object[]{book.getBookName(),book.getPrice(),book.getDetails(),book.getImgPath(),book.getType(),book.getDateTime(),book.getAuthor(),book.getPublishing(),book.getStoreNumber(),book.getSalesAmount()};
		try {
			queryRunner.update(sql,params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}	
	public List<Book> findByName(String name){
		String sql="SELECT id,bookName,price,details,imgPath,type,dateTime,author,publishing,storeNumber,salesAmount FROM book WHERE bookName LIKE ?";
		try {
			return queryRunner.query(sql, new BeanListHandler<Book>(Book.class), '%'+name+'%');
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void delete(int id){
		String sql="delete from book where id=?";
		try {
			queryRunner.update(sql,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@Override
	public void update(Book book) {
		// TODO Auto-generated method stub
		List<Object> list=new ArrayList<Object>();
		StringBuilder sb=new StringBuilder(50);
		sb.append("update book SET	");
		
		if(book.getBookName()!=null){
			sb.append("	bookName=?,	");
			list.add(book.getBookName());
		}
		
		if(book.getDetails()!=null){
			sb.append("	details=?,	");
			list.add(book.getDetails());
		}
		
		if(book.getImgPath()!=null){
			sb.append("	imgPath=?,	");
			list.add(book.getImgPath());
		}
		
		if(book.getType()!=0){
			sb.append("	type=?,	");
			list.add(book.getType());
		}
		
		if(book.getAuthor()!=null){
			sb.append("	author=?, ");
			list.add(book.getAuthor());
		}
		
		if(book.getPublishing()!=null){
			sb.append("	publishing=?,");
			list.add(book.getPublishing());
		}
		
		if(book.getStoreNumber()>=0){
			sb.append(" storeNumber=?, ");
			list.add(book.getStoreNumber());
			
		}
		if(book.getPrice()!=0.0){
			sb.append("	price=?	");
			list.add(book.getPrice());
		}
		
		sb.append(" where id=? ");
		list.add(book.getId());
		
		try {
			queryRunner.update(sb.toString(),list.toArray());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public boolean checkAmount(Order order) {
		boolean flag=true;
		List<OrderItem> orderItem = order.getOrderItem();
		for (OrderItem orderItem2 : orderItem) {
			Book book=find(orderItem2.getBookId());
			if(book.getStoreNumber()<orderItem2.getQuantity()){
				flag=false;
			}	
		}
		return flag;
	}
	
}
