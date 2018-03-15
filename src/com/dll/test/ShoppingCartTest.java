package com.dll.test;

import java.util.ArrayList;
import java.util.Collection;

import org.junit.Test;

import com.dll.entity.Book;
import com.dll.entity.ShoppingCart;
import com.dll.entity.ShoppingCartItem;

public class ShoppingCartTest {
	@Test
	public void test(){
		ShoppingCart shoppingCart=new ShoppingCart();
		Book book=new Book();
		book.setId(1);
		book.setBookName("1ºÅ");
		
		Book book2=new Book();
		book2.setId(2);
		book2.setBookName("2ºÅ");
		
		shoppingCart.addToCart(book);
		shoppingCart.addToCart(book);
		shoppingCart.addToCart(book2);
		Collection<ShoppingCartItem> books = shoppingCart.getBooks();
		ArrayList<ShoppingCartItem> list=new ArrayList<ShoppingCartItem>(books);
		for (ShoppingCartItem shoppingCartItem : list) {
			System.out.print(shoppingCartItem.getBook().getBookName());
			
		}
		System.out.println(shoppingCart.getTotalQuantity());
	}	
}
