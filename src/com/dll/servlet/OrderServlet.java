package com.dll.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.jdbc.odbc.OdbcDef;

import com.dll.entity.Order;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;

public class OrderServlet extends BaseServlet{
	/*
	 * 获得所有的订单
	 */
	public Object getOrder(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("login");
		
		PageBean<Order> pb=new PageBean<Order>(1);
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage!=null){
			pb.setCurrentPage(Integer.parseInt(currentPage));
		}
		orderService.getOrder(pb,username);
		request.setAttribute("pageBean", pb);
		return request.getRequestDispatcher("app/myorder.jsp");
	}
	
	public Object getOrder_sys(HttpServletRequest request,HttpServletResponse response){
		PageBean<Order> pb=new PageBean<Order>(1);
		String username = request.getParameter("userName");
		String currentPage = request.getParameter("currentPage");
		if(currentPage!=null){
			pb.setCurrentPage(Integer.parseInt(currentPage));
		}
		orderService.getOrder(pb,username);
		request.setAttribute("pageBean", pb);
		return request.getRequestDispatcher("sys/tradeList.jsp");
	}
	
	public Object saveOrder(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("login");
		ShoppingCart shoppingCart=(ShoppingCart)session.getAttribute("cart");
		if(username!=null && shoppingCart!=null){
			orderService.saveOrder(username,shoppingCart);
			shoppingCart.clear();
		}
		return getOrder(request, response);
	}
	
	public Object cancel(HttpServletRequest request,HttpServletResponse response){
		String oid = request.getParameter("oid");
		orderService.cancel(oid);
		return getOrder(request, response);
	}
	public Object cancel_sys(HttpServletRequest request,HttpServletResponse response){
		String oid = request.getParameter("oid");
		orderService.cancel(oid);
		return getOrder_sys(request, response);
	}
	
	public Object confirm(HttpServletRequest request,HttpServletResponse response){
		String oid=request.getParameter("oid");
		String status = request.getParameter("status");
		orderService.confirm(oid,status);
		return getOrder(request,response);
	}
	public Object confirm_sys(HttpServletRequest request,HttpServletResponse response){
		confirm(request, response);
		return getOrder_sys(request, response);
	}
	
	public Object pay(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("login");
		
		String oid=request.getParameter("oid");
		Order order=orderService.findOrder(oid);
		
		//1.检查登录
		if((String)session.getAttribute("login")==null){
			request.setAttribute("error", "请先登录");
			return request.getRequestDispatcher("app/myaccount.jsp");
		}
		//2.库存
		if(!bookService.checkAmount(order)){
			request.setAttribute("error", "库存不足");
			return request.getRequestDispatcher("orderServlet?method=getOrder");
		}
		//3.检查账户余额
		
		double money=order.getTotal();
		boolean checkBalance = accountService.checkBalance(username,money);
		
		if(!checkBalance){
			request.setAttribute("error","余额不足");
			return request.getRequestDispatcher("orderServlet?method=getOrder");
		}
		
		//事务操作
		int res=orderService.pay(order);
		//ShoppingCart sc=(ShoppingCart)session.getAttribute("cart");
		//sc.clear();
		
		if(res==1){
			request.setAttribute("ok","yes");			
		}else{
			request.setAttribute("ok", "no");
		}
		
		return request.getRequestDispatcher("bookServlet?method=showNew");
	}
	public Object search(HttpServletRequest request,HttpServletResponse response){
		return getOrder_sys(request, response);
	}

}
