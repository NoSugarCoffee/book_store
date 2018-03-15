<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/myfocus-2.0.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/mf-pattern/mF_51xflash.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mf-pattern/mF_51xflash.js"></script>



<script type="text/javascript">
	myFocus.set({id:'picBox'});
	
	function yes(){
		alert("支付成功");
	}
</script>

<style type="text/css">
	.main{
		width:900px;
		height:926px;
	}
	.pic{
		width:900px;
	}	
	.ad{
		width:900px;
		height:310px;
		overflow:hidden;
		margin-bottom:15px;
		border-bottom:1px #b2b2b2 dashed;
	}
	.pic img{
		margin-left:-50px;
	}
</style>

</head>
<body>

<c:if test="${requestScope.ok eq 'yes'}">
		<script type="text/javascript">yes()</script>
	</c:if>
	
<div id="wrap">
	   <!--顶部  -->
       <jsp:include page="/app/top.jsp"></jsp:include>
       <!-- 中部 -->
       <!-- left_content -->
       	<div class="main">
            	<div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>推荐</div>
            		<!--  轮播效果 -->
           		<div class="ad" id="picBox">
            	<div class="loading"><img src="${pageContext.request.contextPath}/images/loading.gif"></img></div>
            		<div class="pic">
            			<ul>
            				<li><img src="${pageContext.request.contextPath}/images/ad2.jpg" /></li>
            				<li><img src="${pageContext.request.contextPath}/images/ad3.jpg"/></li>
            				<li><img src="${pageContext.request.contextPath}/images/ad4.jpg"/></li>
            			</ul>
            		</div>
            	</div>	
            	      
            	<div class="title" style="width:900px;background: floralwhite"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet2.gif" alt="" title="" /></span>新品展示</div> 
           
            	<!-- 新品展示 -->
            	<div class="new_products" style="height: 200px;width: 900px;padding-left: 23px;">
           			<c:forEach items="${requestScope.books}" var="book">
           				<div class="new_prod_box" style="margin: 10px">
	                    	<!-- <p style="background-color:#6F605A; border-radius:5px"> </p>-->
	                    	<a href="${pageContext.request.contextPath}/bookServlet?method=detail&id=${book.id}" style="color:black;text-align: center;">${book.bookName} </a>
	                     	<div class="new_prod_bg">
	                        	<span class="new_icon"><img src="${pageContext.request.contextPath}/images/new_icon.gif" alt="" title="" /></span>
	                        	<a href="${pageContext.request.contextPath}/bookServlet?method=detail&id=${book.id}"><img src="${pageContext.request.contextPath}/bookimg/small_${book.imgPath}" alt="" title="" class="thumb" border="0" /></a>
	                     	</div>
	                     	<a href="${pageContext.request.contextPath}/bookServlet?method=detail&id=${book.id}" style="color:#6F605A">￥${book.price} </a>          
                   		</div>	
           			</c:forEach>
            	</div> 
            	
            	
            	<div class="title" style="width:900px;background: floralwhite"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet2.gif" alt="" title="" />
            	</span>热销排行</div>
            	<div class="new_products" style="height: 200px;width: 900px;padding-left: 23px;">
           			<c:forEach items="${requestScope.hotBook}" var="book">
           				<div class="new_prod_box" style="margin: 10px">
	                    	<!-- <p style="background-color:#6F605A; border-radius:5px"> </p>--><a href="${pageContext.request.contextPath}/bookServlet?method=detail&id=${book.id}" style="color:black;text-align: center;">${book.bookName} </a>
	                     	<div class="new_prod_bg">
	                        	<span class="new_icon"><img src="${pageContext.request.contextPath}/images/hot.gif" alt="" title="" /></span>
	                        	<a href="${pageContext.request.contextPath}/bookServlet?method=detail&id=${book.id}"><img src="${pageContext.request.contextPath}/bookimg/small_${book.imgPath}" alt="" title="" class="thumb" border="0" /></a>
	                     	</div>        
	                     	<a href="${pageContext.request.contextPath}/bookServlet?method=detail&id=${book.id}" style="color:#6F605A">￥${book.price} </a>
                   		</div>	
                   		
           			</c:forEach>
            	</div> 
            	
        </div><!--end of left content-->
        <div class="clear"></div>
        <jsp:include page="/app/foot.jsp"></jsp:include>
</div>
</body>
</html>