package com.dll.entity;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {
	private Map<Integer,ShoppingCartItem> cart=new HashMap<Integer,ShoppingCartItem>();
	//���ض��ڵ�ShoppingCartItem
	public Collection<ShoppingCartItem> getBooks(){
		return cart.values();
	}
	//����id�ɷ�
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
	//��չ��ﳵ
	public void clear(){
		cart.clear();
	}
	
	//ɾ��ĳ��
	public void remove(int id){
		cart.remove(id);
	}
	
	//�޸Ĺ��ﳵ������
	public void changeAmout(int id,int amount){
		cart.get(id).setQuantity(amount);
		if(amount==0){
			this.remove(id);
		}
	}
}
