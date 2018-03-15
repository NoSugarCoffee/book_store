package com.dll.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dll.entity.Book;
import com.dll.entity.ShoppingCart;


public class AddCartServlet extends BaseServlet{

	public Object add(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		if(session.getAttribute("login")==null){
			return "app/myaccount.jsp";
		}
		
		String id = request.getParameter("id");
		String currentPage = request.getParameter("currentPage");
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(null==cart){
			cart=new ShoppingCart();
			session .setAttribute("cart", cart);
		}
		Book book = bookService.find(Integer.parseInt(id));
		cart.addToCart(book);
		return request.getRequestDispatcher("/bookServlet?method=detail&currentPage="+currentPage+"&id="+id);
	}
	
	public Object changeAmount(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String amount = request.getParameter("amount");
		String id = request.getParameter("id");
		
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		Book book = bookService.find(Integer.parseInt(id));
		cart.changeAmout(book.getId(),Integer.parseInt(amount));
		return request.getRequestDispatcher("/app/cart.jsp");
	}
		
}
