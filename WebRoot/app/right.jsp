<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'type.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />
  </head>
  <!-- 图书分类 -->
  <jsp:include page="/bookServlet">
  	<jsp:param value="typeList" name="method"/>
  </jsp:include>
  <!--推荐-->
  <jsp:include page="/bookServlet">
  	<jsp:param value="recommend" name="method"/>
  </jsp:include>
  <body>
    <div class="right_content">
              <div class="" >
	              <form action="${pageContext.request.contextPath}/bookServlet?method=search" method="post">
	              	<input type="text" name="bookName" value="请输入要查找的图书名字" style="border-radius:5px;height:20px;margin-left: 5px"/>
	              	<input class="register" type="submit" value="search" style="float: none;margin-left: 20px"/>
	              </form>
              </div>
              <div class="cart">
                  <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/cart.gif" alt="" title="" /></span>My cart</div>
                  <div class="home_cart_content">
                  ${sessionScope.cart.totalQuantity} x items | <span class="red">TOTAL: ￥ ${sessionScope.cart.totalMoney}</span>
                  </div>
                  <a href="${pageContext.request.contextPath}/app/cart.jsp" class="view_cart">view cart</a>
              
              </div>
        
        
             <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet3.gif" alt="" title="" /></span>About Our Store</div> 
             <div class="about">
             <p>
             <img src="${pageContext.request.contextPath}/images/about.gif" alt="" title="" class="right" />
             	世界上最大的网上图书运营商，覆盖各类图书：计算机、儿童、动漫、互联网...
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet4.gif" alt="" title="" /></span>Recommend</div> 
                    <c:forEach var="recommendBook" items="${recommendBooks}">
                    <div class="new_prod_box">
                        <a href="details.html">${recommendBook.bookName}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${pageContext.request.contextPath}/images/jian.png" alt="" title="" /></span>
                        <a href="${pageContext.request.contextPath}/bookServlet?method=detail&id=${recommendBook.id}"><img src="${pageContext.request.contextPath}/bookimg/small_${recommendBook.imgPath}" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    </c:forEach>
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet5.gif" alt="" title="" /></span>Categories</div> 
                
                <ul class="list">
                <!-- 类型列表 -->
                <c:forEach items="${requestScope.types}" var="item">
               	 	<li><a href="${pageContext.request.contextPath}/bookServlet?method=getAll&curentPage=1&minPrice=${requestScope.pageBean.condition.minPrice}&maxPrice=${requestScope.pageBean.condition.maxPrice}&type=${item.id}">${item.typeName}</a></li>
                </c:forEach>
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet6.gif" alt="" title="" /></span>Partners</div> 
                
                <ul class="list">
                <li><a href="http://www.baidu.com">百度</a></li>
                <li><a href="http://www.dangdang.com/?_utm_brand_id=11106&_ddclickunion=460-5-biaoti|ad_type=0|sys_id=1">当当网</a></li>
                <li><a href="https://ke.qq.com/">腾讯课堂</a></li>
                <li><a href="http://study.163.com/">网易云课堂</a></li>
                <li><a href="http://www.csdn.net/">csdn</a></li>                          
                <li><a href="http://www.imooc.com/">慕课网</a></li>                          
                </ul>      
             </div>         
        </div>
  </body>
</html>
