package com.dll.entity;

public class ShoppingCartItem {
	private int quantity;
	private Book book;
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public ShoppingCartItem(Book book){
		this.book=book;
		this.quantity=1;
	}
	public ShoppingCartItem() {
		// TODO Auto-generated constructor stub
	}
	
	public void increament(){
		++this.quantity;
	}
}
