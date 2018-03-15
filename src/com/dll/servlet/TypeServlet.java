package com.dll.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dll.entity.Type;

public class TypeServlet extends BaseServlet {
	public Object save(HttpServletRequest req, HttpServletResponse resp){
		String typeName = req.getParameter("typeName");
		boolean flag = typeService.save(typeName);
		if(flag){
			return list(req,resp);
		}
		return "error/error.jsp";
	}
	
	public Object list(HttpServletRequest req, HttpServletResponse resp){
		List<Type> types = typeService.getAll();
		req.setAttribute("types", types);
		return req.getRequestDispatcher("sys/typeList.jsp");
	}
	
	public Object deleteById(HttpServletRequest req, HttpServletResponse resp){
		String id = req.getParameter("id");
		int res = typeService.deleteById(Integer.parseInt(id));
		if(res==1){
			return list(req,resp);
		}
		return "error/error.jsp";
	}
	
	public Object update(HttpServletRequest req, HttpServletResponse resp){
		String id = req.getParameter("id");
		String typeName = req.getParameter("updateFoodType");
		int res=typeService.update(Integer.parseInt(id),typeName);
		if(res==1)return list(req,resp);
		return "error/error.jsp";
	}
}
