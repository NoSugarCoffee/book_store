<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />

<style type="text/css">

tr.cart_title{
	height: 20px
}
</style>

<script type="text/javascript">
	function error(){
		alert("${requestScope.error}");
	}
</script>

</head>

<c:if test="${not empty requestScope.error}">
		<script type="text/javascript">error()</script>
</c:if>

<body>
<div id="wrap">
      <jsp:include page="/app/top.jsp"></jsp:include>
       <div>
            <div class="title" style="width:900px"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>Order List</div>
        
        	<div class="feat_prod_box_details">
            <table class="cart_table" style="height: 500px;width:900px;">
            	<tr class="cart_title">
                	<td>订单号</td>
                	<td>订购时间</td>
                	<td>
                		<table>
                			<tr>
                				<td>书名</td>
                				<td>数量</td>
                				<td>价格</td>
                			</tr>
                		</table>
                	</td>
                    <td>总价</td>  
                    <td>状态</td>             
                </tr>
                <c:forEach items="${requestScope.pageBean.pageData}" var="item">
                	<tr>
	                	<td>${item.oid}</td>
	                	<td>${item.orderTime}</td>
	                    <td> 
							<table style:"width:200px">	                    	
	                    	<c:forEach items="${item.orderItem}" var="i">
	                    	<tr>
	                    			<td>${i.bookName}</td>
	                    			<td>${i.quantity}</td>
	                    			<td>${i.price }</td>
	                    	</tr>
	                    	</c:forEach>
	                    	</table>
	                    </td>
	                    <td>${item.total}</td>
	                    <td> 
		                    <c:choose>
		                    	<c:when test="${item.status eq 1}">
		                    	<a href="${pageContext.request.contextPath}/orderServlet?method=pay&oid=${item.oid}">去付款</a>
		                    	<br/>
		                    	<a href="${pageContext.request.contextPath}/orderServlet?method=cancel&oid=${item.oid}">取消</a>
		                    	<br/>
		                    	</c:when>
		                    	
		                    	<c:when test="${item.status eq 2}">
		                    	<span >已付款</span>
		                    	<br/>
		                    	</c:when>
		                    	
		                    	<c:when test="${item.status eq 3}">
		                    	<span>卖家已发货</span>
		                    	<br/>
		                    	<a href="${pageContext.request.contextPath}/orderServlet?method=confirm&oid=${item.oid}&status=4">确认收货</a>
		                    	<br/>
		                    	</c:when>
		                    	
		                    	<c:when test="${item.status eq 4}">
		                    	<span>成功交易</span>
		                    	</c:when>
		                    </c:choose>
	                    </td>               
	               	 </tr>
                </c:forEach>
            </table>
            
            </div>
        	 <div class="pagination" style="width: 900px"> 
           		  <c:choose>
           		  	<c:when test="${requestScope.pageBean.hasPre eq true}">
           		  		<a href="${pageContext.request.contextPath}/orderServlet?method=getOrder&currentPage=1"><<</a>
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
         					<a href="${pageContext.request.contextPath}/orderServlet?method=getOrder&currentPage=${i}"><c:out value="${i}"></c:out></a>
         				</c:otherwise>
         			</c:choose>
           		  </c:forEach>
           		  
           		  <c:choose>
           		  	<c:when test="${requestScope.pageBean.hasNext eq true}">
           		  		<a href="${pageContext.request.contextPath}/orderServlet?method=getOrder&currentPage=${requestScope.pageBean.totalPages}">>></a>
           		  	</c:when>
           		  	<c:otherwise>
           		  	 	<span class="disabled">>></span>
           		  	</c:otherwise>
           		  </c:choose>
            </div>  
            
            </div>     
 		      	
        <jsp:include page="/app/foot.jsp"></jsp:include>
</div>

</body>
</html>