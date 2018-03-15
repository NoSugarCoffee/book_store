package com.dll.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dll.entity.Contact;


public class ContactServlet extends BaseServlet {
	public Object contact(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String company = request.getParameter("company");
		String message = request.getParameter("message");
		
		Contact contact=new Contact(name, email, phone, company, message);
		contactService.save(contact);
		return request.getRequestDispatcher("app/contact.jsp");
	}

}
