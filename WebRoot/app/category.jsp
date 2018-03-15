<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />

</head>
<body>
<div id="wrap">

       <jsp:include page="/app/top.jsp"></jsp:include>
       
       
       <div class="center_content">
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="${pageContext.request.contextPath}/bookServlet?method=showNew">主页</a> &gt;&gt; 所有图书
            </div>
            <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>图书类</div>
           
           <div class="new_products" style="width:510px;height:900px">
           			<c:choose>	
           			<c:when test="${not empty requestScope.pageBean.pageData}">
           			<!-- 图书展示 -->
           			<c:forEach items="${requestScope.pageBean.pageData}" var="book">
           				<div class="hoverclass">
	           				<div class="new_prod_box" style="height:170px;width:145px;">
	                        <a href="${pageContext.request.contextPath}/app/details.jsp" style="color: black">${book.bookName}</a>
	                        <div class="new_prod_bg">
	                        
	                        <a href="${pageContext.request.contextPath}/bookServlet?method=detail&currentPage=${requestScope.pageBean.currentPage}&id=${book.id}&minPrice=${requestScope.pageBean.condition.minPrice}&maxPrice=${requestScope.pageBean.condition.maxPrice}&type=${pageBean.condition.id}">
	                        <img src="${pageContext.request.contextPath}/bookimg/small_${book.imgPath}" alt="" title="" class="thumb" border="0" /></a>
	                        </div>
	                       	<span style="color:#6F605A">￥${book.price} </span>
	                    	</div>
                    	</div>
           			</c:forEach>
           			</c:when>
           			<c:otherwise>
           				没有你要的书籍
           			</c:otherwise>
           			</c:choose>
			<!-- 分页按钮 -->
            <div class="pagination"> 
           		  <c:choose>
           		  	<c:when test="${requestScope.pageBean.hasPre eq true}">
           		  		<a href="${pageContext.request.contextPath}/bookServlet?currentPage=1&minPrice=${requestScope.pageBean.condition.minPrice}&maxPrice=${requestScope.pageBean.condition.maxPrice}&type=${pageBean.condition.id}"><<</a>
           		  	</c:when>
           		  	<c:otherwise>
           		  	 	<span class="disabled"><<</span>
           		  	</c:otherwise>
           		  </c:choose>
           		 
           		  <c:forEach var="i" begin="1" step="1" end="${requestScope.pageBean.totalPages}">
           		  	<c:choose>
           		  		<c:when test="${requestScope.pageBean.currentPage==pageScope.i}">
           		  			<span class="current"><c:out value="${i}"></c:out></span>
           		  		</c:when>
      	   				<c:otherwise>
         					<a href="${pageContext.request.contextPath}/bookServlet?currentPage=${pageScope.i}&minPrice=${requestScope.pageBean.condition.minPrice}&maxPrice=${requestScope.pageBean.condition.maxPrice}&type=${pageBean.condition.id}"><c:out value="${i}"></c:out></a>
         				</c:otherwise>
         			</c:choose>
           		  </c:forEach>
           		  
           		  <c:choose>
           		  	<c:when test="${requestScope.pageBean.hasNext eq true}">
           		  		<a href="${pageContext.request.contextPath}/bookServlet?currentPage=${pageBean.totalPages}&type=${pageBean.condition.id}&minPrice=${requestScope.pageBean.condition.minPrice}&maxPrice=${requestScope.pageBean.condition.maxPrice}">>></a>
           		  	</c:when>
           		  	<c:otherwise>
           		  	 	<span class="disabled">>></span>
           		  	</c:otherwise>
           		  </c:choose>
            </div>  
            
            </div> 
          
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <jsp:include page="/app/right.jsp" ></jsp:include>
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <jsp:include page="/app/foot.jsp"></jsp:include>
    

</div>

</body>
</html>