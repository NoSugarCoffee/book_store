package com.dll.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dll.entity.Book;

public class UploadUtils {
	public static Object  upload(HttpServletRequest request,HttpServletResponse response){
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			List<FileItem> items=null;
			Map<String,Object> map=new HashMap<String, Object>();
			try {

				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Iterator<FileItem> iterator = items.iterator();
			while(iterator.hasNext()){
				FileItem item = iterator.next();
				if(item.isFormField()){
					System.out.println(item.getFieldName()+":"+item.getString());
					try {
						map.put(item.getFieldName(),new String((item.getString("iso8859-1")).getBytes("iso8859-1"),"UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else{
					String filename = item.getName();
					if(filename!=null && !"".equals(filename)){
							filename = filename.substring(filename.lastIndexOf("\\") + 1, filename.length());
							map.put(item.getFieldName(),filename);
							
							String storeLoc=request.getSession().getServletContext().getRealPath("/");
							String path="E:Workspaces/MyEclipse 10/book_store/WebRoot/bookimg/";
							File f=new File(path,filename);
							try {
								item.write(f);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							ImageSizeUtils.resizeImage(path+filename,path+"small_"+filename, 60,90);
							ImageSizeUtils.resizeImage(path+filename,path+"thuma_"+filename, 20,30);
						}
					}
			}
			try {
				Book book=MyUtils.MapToBean(map, Book.class);
				book.setDateTime(new Date());
				return book;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("不是2进制的传输方式");
		}
		return null;
	}
}
