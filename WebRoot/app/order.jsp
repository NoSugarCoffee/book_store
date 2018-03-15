<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />

</head>

<body>
<div id="wrap">
      <jsp:include page="/app/top.jsp"></jsp:include>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>My Order</div>
        
        	<div class="feat_prod_box_details">
            <table class="cart_table">
            	<tr class="cart_title">
                	<td>缩略图</td>
                	<td>书名</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>总价</td>               
                </tr>
                <c:forEach items="${sessionScope.cart.books}" var="item">
                	<tr>
	                	<td><a href="details.html"><img src="${pageContext.request.contextPath}/bookimg/thuma_${item.book.imgPath}" alt="" title="" border="0" class="cart_thumb" /></a></td>
	                	<td>${item.book.bookName}</td>
	                    <td>￥ ${item.book.price}</td>
	                    <td>${item.quantity}</td>
	                    <td>￥ ${item.book.price*item.quantity}</td>               
	               	 </tr>
                </c:forEach>
                <tr>
                <td colspan="4" class="cart_total"><span class="red">总共需要支付：</span></td>
                <td> ￥ ${sessionScope.cart.totalMoney}</td>                
                </tr>  
            </table>
            
            <a href="${pageContext.request.contextPath}/app/cart.jsp" class="continue">&lt; continue</a>
            <a href="${pageContext.request.contextPath}/accountServlet?method=pay" class="checkout">checkout &gt;</a>
            </div>
            
        <div class="clear"></div>
         <div style="color: red;font-size: 14px;margin-left: 172px;">${error}</div>
        </div><!--end of left content-->
        <jsp:include page="right.jsp"></jsp:include>
      	<!--end of right content-->
       
       <div class="clear"></div>
       </div><!--end of center content-->
        <jsp:include page="/app/foot.jsp"></jsp:include>
</div>

</body>
</html>