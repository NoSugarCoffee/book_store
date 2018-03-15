<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/lightbox.css" />
  </head>
  <body>
   
      <div class="header">
       		<div class="logo"><a href="index.html"><img src="${pageContext.request.contextPath}/images/logo.gif" alt="" title="" border="0" /></a></div>            
        	<div id="menu">
	            <ul>                                                                       
		            <li><a href="${pageContext.request.contextPath}/bookServlet?method=showNew">主页</a></li>
		            <li><a href="${pageContext.request.contextPath}/app/register.jsp">注册</a></li>
		            <li><a href="${pageContext.request.contextPath}/app/myaccount.jsp">登录</a></li>
		            <li><a href="${pageContext.request.contextPath}/bookServlet?method=getAll">所有书籍</a></li>
		            <li><a href="${pageContext.request.contextPath}/app/about.jsp">关于我们</a></li>
		            <li><a href="${pageContext.request.contextPath}/app/contact.jsp">联系我们</a></li>
	            </ul>
	            
	            <div class="user">
	            <c:choose>
	            	<c:when test="${not empty sessionScope.login}">
			            <span>欢迎您：</span>
			            <a href="${pageContext.request.contextPath}/orderServlet?method=getOrder"><span>${sessionScope.login}</span></a>
		            	<span><a href="${pageContext.request.contextPath}/accountServlet?method=logout">注销</a></span>
	            	</c:when>
	            	<c:otherwise><span>当前状态：<a href="${pageContext.request.contextPath}/app/myaccount.jsp">未登录</a></span></c:otherwise>
	            </c:choose>
	            </div>
        </div>  
       </div> 
  </body>
</html>
