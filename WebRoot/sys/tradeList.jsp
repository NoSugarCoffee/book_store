<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
 	<!-- 包含公共的JSP代码片段 -->
	
<title></title>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/page_common.js"></script>
<link href="${pageContext.request.contextPath}/sys/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sys/style/css/index_1.css" />
</head>
<style type="text/css">
	a{text-decoration: underline;}
</style>

<body>
<!-- 页面标题 -->
<div id="TitleArea">
	<div id="TitleArea_Head"></div>
	<div id="TitleArea_Title">
		<div id="TitleArea_Title_Content">
			<img border="0" width="13" height="13" src="${pageContext.request.contextPath}/sys/style/images/title_arrow.gif"/> 交易列表
		</div>
    </div>
	<div id="TitleArea_End"></div>
</div>


<!-- 过滤条件 -->
<div id="QueryArea">
	<form action="${pageContext.request.contextPath}/orderServlet?method=search" method="post">
		<input type="text" name="userName" title="请输入图书名称">
		<input type="submit" value="搜索">
	</form>
</div>


<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">

		<!--显示数据列表 -->
		    <div>
        <table class="MainArea_Content" align="center" cellspacing="0" cellpadding="0">
        <!-- 表头-->
        <thead>
            <tr align="center" valign="middle" id="TableTitle">
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
        </thead>
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
		                    	<span>未付款</span>
		                    	<br/>
		                    	<a href="${pageContext.request.contextPath}/orderServlet?method=cancel_sys&oid=${item.oid}">取消</a>
		                    	<br/>
		                    	</c:when>
		                    	
		                    	<c:when test="${item.status eq 2}">
		                    	<span >已付款</span>
		                    	<br/>
		                    	<a href="${pageContext.request.contextPath}/orderServlet?method=confirm_sys&oid=${item.oid}&status=3">确认发货</a>
		                    		<br/>
		                    	</c:when>
		                    	
		                    	<c:when test="${item.status eq 3}">
		                    	<span>已发货</span>
		                    	</c:when>
		                    	
		                    	<c:when test="${item.status eq 4}">
		                    	<span>成功交易</span>
		                    	</c:when>
		                    </c:choose>
	                    </td>               
	               	 </tr>
	               	 <tr><td><br/><br/></td></tr>
                </c:forEach>
                
            </table>
            </div>
            
             <div id="TableTail" align="center">
		<a href="${pageContext.request.contextPath}/orderServlet?method=getOrder_sys&currentPage=1">首页</a>  
		 <c:choose>
	  		  	<c:when test="${requestScope.pageBean.hasPre eq true}">
	  		  		<a href="${pageContext.request.contextPath}/orderServlet?method=getOrder_sys&currentPage=${requestScope.pageBean.prePage}">上一页</a>
	  		  	</c:when>
	  		  	<c:otherwise>
	  		  	 	<span class="disabled">上一页</span>
	  			</c:otherwise>
	 	 </c:choose> 
	  	
	  	<c:choose>
	  		  	<c:when test="${requestScope.pageBean.hasNext eq true}">
	  		  		<a href="${pageContext.request.contextPath}/orderServlet?method=getOrder_sys&currentPage=${requestScope.pageBean.nextPage}">下一页</a>
	  		  	</c:when>
	  		  	<c:otherwise>
	  		  	 	<span class="disabled">下一页</span>
	  			</c:otherwise>
	 	 </c:choose>
	 	<a href="${pageContext.request.contextPath}/orderServlet?method=getOrder_sys&currentPage=${requestScope.pageBean.totalPages}">末页</a>  
    </div> 
</div>
</body>
</html>
