package com.dll.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dll.entity.Book;
import com.dll.entity.Condition;
import com.dll.entity.PageBean;
import com.dll.entity.Type;
import com.dll.util.UploadUtils;


public class BookServlet extends BaseServlet {
	 /**
	  * 所有的书
	  * @param request
	  * @param response
	  * @return
	  */
	public Object getAll(HttpServletRequest request,HttpServletResponse response){
		//接受所以的条件
		String currentPage =(String)request.getParameter("currentPage");
		String type =(String)request.getParameter("type");
		String minPrice =(String)request.getParameter("minPrice");
		String maxPrice =(String)request.getParameter("maxPrice");
		
		PageBean<Book> pb = new PageBean<Book>(1);
		Condition condition=new Condition();
		if(type!=null&&!type.equals("")){
			condition.setId(Integer.parseInt(type));
		}
		if(currentPage!=null&&!currentPage.equals("")){
			 pb.setCurrentPage(Integer.parseInt(currentPage));		
		}
		if(minPrice!=null&&!minPrice.equals("")){
			condition.setMinPrice(Integer.parseInt(minPrice));
		}
		if(maxPrice!=null&&!maxPrice.equals("")){
			condition.setMaxPrice(Integer.parseInt(maxPrice));
		}
		pb.setCondition(condition);
		bookService.getAll(pb);
		request.setAttribute("pageBean",pb);
		return request.getRequestDispatcher("app/category.jsp");
	}
	
	public Object detail(HttpServletRequest request,HttpServletResponse response){
		String id =(String)request.getParameter("id");
		Book book = bookService.find(Integer.parseInt(id));
		request.setAttribute("bookDetail",book);
		
		return  request.getRequestDispatcher("app/details.jsp");
	}
	public Object showNew(HttpServletRequest request,HttpServletResponse response){
		List<Book> books = bookService.getByTime();
		List<Book> hotBook = bookService.hotBook();
		request.setAttribute("hotBook", hotBook);
		request.setAttribute("books", books);
		return request.getRequestDispatcher("app/index.jsp");
	}

	/*
	 * 后台的查询
	 * */
	public Object listAll(HttpServletRequest request,HttpServletResponse response){	
		getAll(request, response);
		List<Type> typelist = typeService.getAll();
		request.setAttribute("typelist", typelist);
		return request.getRequestDispatcher("sys/bookList.jsp") ;
	}
	/*
	 *增加新书 
	 */
	public Object addBook(HttpServletRequest request,HttpServletResponse response){
		return listAll(request,response);
	}
	
	public Object findById(HttpServletRequest request,HttpServletResponse response){
		String id =(String)request.getParameter("id");
		Book book = bookService.find(Integer.parseInt(id));
		request.setAttribute("bookDetail",book);
		return  request.getRequestDispatcher("sys/updateBook.jsp");
	}
	
	/*
	 * 更新书
	 */
	public Object update(HttpServletRequest request,HttpServletResponse response){
		Book book=(Book)UploadUtils.upload(request, response);
		bookService.update(book);
		return listAll(request, response);
	}
	
	public Object save(HttpServletRequest request,HttpServletResponse response){
		Book book = (Book)UploadUtils.upload(request,response);
		bookService.save(book);
		return listAll(request, response);
	}
	public Object delete(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		bookService.delete(Integer.parseInt(id));
		return listAll(request, response);
	}
	
	/*
	 * 书的模糊查询
	 */
	public Object findByName(HttpServletRequest request,HttpServletResponse response){
		String bookName = request.getParameter("bookName");
		List<Book> bookList = bookService.findByName(bookName);
		request.setAttribute("pageBean", bookList);
		return "sys/bookList.jsp";
	}
	/*
	 * 前台的查询
	 * */
	public Object search(HttpServletRequest request,HttpServletResponse response){
		String bookName = request.getParameter("bookName");
		PageBean<Book> pb=new PageBean<Book>(1);
		List<Book> bookList = bookService.findByName(bookName);
		pb.setPageData(bookList);
		request.setAttribute("pageBean", pb);
		return request.getRequestDispatcher("app/category.jsp");
	}
}
