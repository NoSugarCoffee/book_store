package com.dll.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dll.entity.Account;
import com.dll.entity.PageBean;
import com.dll.entity.ShoppingCart;

public class AccountServlet extends BaseServlet{
	
	private String msg="";
	/*
	 * 登录
	 */
	public Object login(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String checkCode = request.getParameter("checkCode");
		
		if(username==null||password==null||checkCode==null||
			"".equals(username.trim())||"".equals(password.trim())||"".equals(checkCode.trim())){
			msg="不能为空项哦(*^_^*)!!";
			return AccountServlet.errorJump(request, msg);
		}
		
		String code = (String)request.getSession().getAttribute("checkCode");
		if(!code.equalsIgnoreCase(checkCode)){
			msg="验证码错误，请重试";
			return AccountServlet.errorJump(request, msg);
		}
		
		Account account = accountService.findByName(username);
		if(account==null ||!account.getPassword().equals(password)){
			msg="用户名与密码不匹配";
			return AccountServlet.errorJump(request, msg);
		}
		request.getSession().setAttribute("login", username);
		return request.getRequestDispatcher("/bookServlet?method=getAll");
	}
	
	public Object adminLogin(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		System.out.println(username);
		System.out.println(password);
		if(username!=null && password!=null && !username.trim().equals("") && !password.trim().equals("")){
			
			if(accountService.adminLogin(username,password)){
				return "sys/index.jsp";
			}
		}
		request.setAttribute("msg", "用户名或者密码不正确");
		System.out.println("2");
		return request.getRequestDispatcher("sys/login.jsp");
	}
	
	/*
	 * ajax验证
	 */
	public Object ajaxCheck(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("username");
		boolean flag = accountService.ajaxCheck(username);
		System.out.println(flag);
		try {
			response.getWriter().print(flag);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	/*
	 *错误跳转地址
	 * */
	public static Object errorJump(HttpServletRequest request,String msg){
		request.setAttribute("error",msg);
		return request.getRequestDispatcher("/app/myaccount.jsp");
	}
	
	/*
	 * 登出
	 * */
	public Object logout(HttpServletRequest request,HttpServletResponse response){
		request.getSession().invalidate();
		return request.getRequestDispatcher("/bookServlet?method=showNew");
	}
	
	/*
	 * 注册
	 * */
	public Object save(HttpServletRequest request,HttpServletResponse response){
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Account account=new Account(username, password, email, phone, address,0);
		if(accountService.save(account)){
			request.setAttribute("ok","yes");			
		}else{
			request.setAttribute("ok", "no");
		}
		return request.getRequestDispatcher("app/myaccount.jsp");
	}
	/*
	 *分页的账户
	 */
	public Object getAccountsByPageList(HttpServletRequest request,HttpServletResponse response){
		String currentPage = request.getParameter("currentPage");	
		PageBean<Account> pb=new PageBean<Account>(1);
		if(currentPage!=null){
			pb.setCurrentPage(Integer.parseInt(currentPage));
		}
		accountService.getAccountsByPageList(pb);
		request.setAttribute("pageBean",pb);
		return request.getRequestDispatcher("sys/accountList.jsp");
	}
	
	/*
	 *删除账户 
	 */
	public Object delete(HttpServletRequest request,HttpServletResponse response){
		String accountId=request.getParameter("accountid");		
		accountService.delete(Integer.parseInt(accountId));
		return getAccountsByPageList(request, response);
	}
	
	/*
	 * 更新账户
	 */
	public Object update(HttpServletRequest request,HttpServletResponse response){
		String accountid = request.getParameter("accountid");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String balance = request.getParameter("balance");
		System.out.println(balance);
		
		Account account=new Account(Integer.parseInt(accountid),username, password, email, phone, address, Double.parseDouble(balance));
		accountService.update(account);
		
		return getAccountsByPageList(request, response);
	}
	public Object findById(HttpServletRequest request,HttpServletResponse response){
		String accountid=request.getParameter("accountid");
		Account account=accountService.findById(Integer.parseInt(accountid));
		request.setAttribute("account", account);
		return request.getRequestDispatcher("sys/updateAccount.jsp");
	}
	
	
	/*
	 * 支付
	 */
	/*public Object pay(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("login");
		//1.检查登录
		if((String)session.getAttribute("login")==null){
			request.setAttribute("error", "请先登录");
			return request.getRequestDispatcher("app/myaccount.jsp");
		}
		ShoppingCart shoppingCart=(ShoppingCart)session.getAttribute("cart");
		//2.检查库存
		if(!bookService.checkAmount(shoppingCart)){
			request.setAttribute("error", "库存不足");
			return request.getRequestDispatcher("app/myorder.jsp");
		}
		//3.检查账户余额
		double money = shoppingCart.getTotalMoney();
		boolean checkBalance = accountService.checkBalance(username,money);
		
		if(!checkBalance){
			request.setAttribute("error","余额不足");
			return request.getRequestDispatcher("app/myorder.jsp");
		}
		//事务操作
		int res=accountService.pay(username,shoppingCart);
		
		//ShoppingCart sc=(ShoppingCart)session.getAttribute("cart");
		//sc.clear();
		
		if(res==1){
			request.setAttribute("ok","yes");			
		}else{
			request.setAttribute("ok", "no");
		}
		
		return request.getRequestDispatcher("bookServlet?method=showNew");
	}*/
	
	
	/*public Object pay(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("login");
		//1.检查登录
		if((String)session.getAttribute("login")==null){
			request.setAttribute("error", "请先登录");
			return request.getRequestDispatcher("app/myaccount.jsp");
		}
		ShoppingCart shoppingCart=(ShoppingCart)session.getAttribute("cart");
		//2.检查库存
		if(!bookService.checkAmount(shoppingCart)){
			request.setAttribute("error", "库存不足");
			return request.getRequestDispatcher("app/myorder.jsp");
		}
		//3.检查账户余额
		double money = shoppingCart.getTotalMoney();
		
		boolean checkBalance = accountService.checkBalance(username,money);
		
		if(!checkBalance){
			request.setAttribute("error","余额不足");
			return request.getRequestDispatcher("app/myorder.jsp");
		}
		//事务操作
		int res=accountService.pay(username,shoppingCart);
		
		//ShoppingCart sc=(ShoppingCart)session.getAttribute("cart");
		//sc.clear();
		
		if(res==1){
			request.setAttribute("ok","yes");			
		}else{
			request.setAttribute("ok", "no");
		}
		
		return request.getRequestDispatcher("bookServlet?method=showNew");
	}*/
}
