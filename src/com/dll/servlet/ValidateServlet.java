package com.dll.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dll.entity.Account;
import com.dll.factory.BeanFactory;
import com.dll.service.IAccountService;

public class ValidateServlet extends HttpServlet {
	public IAccountService accountService=(IAccountService)BeanFactory.getInstance("AccountService");
	/*
	 * ajax验证
	 * */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ajaxcheck(request,response);
	}
	public boolean ajaxcheck(HttpServletRequest request, HttpServletResponse response){
		String username = request.getParameter("username");
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(username==null||"".equals(username)){
			request.setAttribute("error", "不能为空项");
			request.getRequestDispatcher("app/myaccount.jsp");
			return false;
		}
		Account account= accountService.findByName(username);
		out.print(account==null?true:false);		
		out.close();
		return true;
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
