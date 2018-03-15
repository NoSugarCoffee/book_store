package com.dll.util;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JumpUtils {
	public static void Jump(Object uri,HttpServletRequest request, HttpServletResponse response){
		if(uri instanceof RequestDispatcher){
			try {
				((RequestDispatcher) uri).forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(uri instanceof String){
			try {
				response.sendRedirect(request.getContextPath()+"/"+(String)uri);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
