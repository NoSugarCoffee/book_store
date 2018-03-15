package com.dll.entity;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {
	private Map<Integer,ShoppingCartItem> cart=new HashMap<Integer,ShoppingCartItem>();
	//返回对于的ShoppingCartItem
	public Collection<ShoppingCartItem> getBooks(){
		return cart.values();
	}
	//传入id可否
	public void addToCart(Book book){	
		if(cart.get(book.getId())==null){
			ShoppingCartItem shoppingCartItem=new ShoppingCartItem(book);
			cart.put(book.getId(),shoppingCartItem);
		}
		else{
			cart.get(book.getId()).increament();
		}
	}
	
	public int getTotalQuantity(){
		int sum=0;
		Collection<ShoppingCartItem> values = cart.values();
		for (ShoppingCartItem shoppingCartItem : values) {
			sum+=shoppingCartItem.getQuantity();
		}
		return sum;
	}
	
	public double getTotalMoney(){
		double money=0;
		Collection<ShoppingCartItem> values = cart.values();
		for (ShoppingCartItem shoppingCartItem : values) {
			money+=shoppingCartItem.getQuantity()*shoppingCartItem.getBook().getPrice();
		}
		return money;
	}
	//清空购物车
	public void clear(){
		cart.clear();
	}
	
	//删除某项
	public void remove(int id){
		cart.remove(id);
	}
	
	//修改购物车的数量
	public void changeAmout(int id,int amount){
		cart.get(id).setQuantity(amount);
		if(amount==0){
			this.remove(id);
		}
	}
}
