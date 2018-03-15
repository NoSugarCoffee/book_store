package com.dll.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dll.entity.Book;
import com.dll.entity.Type;
import com.dll.factory.BeanFactory;
import com.dll.service.IAccountService;
import com.dll.service.IBookService;
import com.dll.service.IContactService;
import com.dll.service.ITypeService;
import com.dll.serviceImpl.OrderService;
import com.dll.util.JumpUtils;

public class BaseServlet extends HttpServlet{
	public IBookService bookService=(IBookService)BeanFactory.getInstance("BookService");
	public IContactService contactService=(IContactService)BeanFactory.getInstance("ContactService");
	public ITypeService typeService=(ITypeService)BeanFactory.getInstance("TypeService");
	public IAccountService accountService=(IAccountService)BeanFactory.getInstance("AccountService");
	//public ITradeService tradeService=(ITradeService)BeanFactory.getInstance("TradeService");
	public OrderService orderService=(OrderService)BeanFactory.getInstance("OrderService");
	
	protected Object uri=null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String methodName = req.getParameter("method");
		if(methodName==null){
			methodName="getAll";
		}
		else if("recommend".equals(methodName)){
			List<Book> recommendBooks = bookService.recommend();
			req.setAttribute("recommendBooks", recommendBooks);
			return;
		}else if("typeList".equals(methodName)){
			List<Type> types = typeService.getAll();
			req.setAttribute("types", types);
			return ;
		}
		try {
			uri=this.getClass().getDeclaredMethod(methodName,HttpServletRequest.class,HttpServletResponse.class).invoke(this,req,resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			uri="error/error.jsp";
		} 
		JumpUtils.Jump(uri, req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}
}
