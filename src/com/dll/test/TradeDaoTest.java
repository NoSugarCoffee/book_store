/*package com.dll.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.dll.daoImpl.BookDao;
import com.dll.daoImpl.TradeDao;
import com.dll.entity.Account;
import com.dll.entity.Book;
import com.dll.entity.ShoppingCartItem;
import com.dll.entity.Trade;
import com.dll.entity.TradeItem;

public class TradeDaoTest {
	private BookDao bookDao=new BookDao();
	TradeDao tradeDao=new TradeDao();
	@Test
	public void insertTradeTest(){
		tradeDao.insertTrade("ssssss");
	}
	@Test
	public void insertTradeItemTest(){
		TradeDao tradeDao=new TradeDao();
		ArrayList<ShoppingCartItem> arrayList=new  ArrayList<ShoppingCartItem>();
		ShoppingCartItem s1=new ShoppingCartItem();
		Book book = bookDao.find(1);
		s1.setBook(book);
		s1.setQuantity(2);
		arrayList.add(s1);
	}
	@Test
	public void testGet(){
		TradeDao tradeDao=new TradeDao();
		Account account = tradeDao.getAccountTradeItems("ssssss");
		List<Trade> trades = account.getTrades();
		for (Trade trade : trades) {
			System.out.println(trade.getTradeTime());
			List<TradeItem> tradeItem = trade.getTradeItem();
			for (TradeItem tradeItem2 : tradeItem) {
				System.out.println(tradeItem2.getBook().getBookName());
			}
		}
	}
}*/
