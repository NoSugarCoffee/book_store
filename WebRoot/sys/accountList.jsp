<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<body>
<!-- 页面标题 -->
<div id="TitleArea">
	<div id="TitleArea_Head"></div>
	<div id="TitleArea_Title">
		<div id="TitleArea_Title_Content">
			<img border="0" width="13" height="13" src="${pageContext.request.contextPath}/sys/style/images/title_arrow.gif"/> 账户列表
		</div>
    </div>
	<div id="TitleArea_End"></div>
</div>


	<!-- 过滤条件 -->
	<div id="QueryArea">
		<form action="/wirelessplatform/food.html" method="get">
			<input type="hidden" name="method" value="search">
			<input type="text" name="keyword" title="请输入用户名">
			<input type="submit" value="搜索">
		</form>
	</div>
<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <table class="MainArea_Content" align="center" cellspacing="0" cellpadding="0">
        <!-- 表头-->
        <thead>
            <tr align="center" valign="middle" id="TableTitle">
				<td>用户名</td>
				<td>密码</td>
				<td>邮箱</td>
                <td>电话</td>
				<td>地址</td>
				<td>余额</td>
				<td>操作</td>
			</tr>
		</thead>	
		<!--显示数据列表 -->
        <tbody id="TableData">
			<c:choose>
				<c:when test="${not empty pageBean}">
					<c:forEach items="${pageBean.pageData}" var="account">
						<tr class="TableDetail1">
							<td>
								${account.username}&nbsp;
							</td>
							<td>
								${account.password}&nbsp;
							</td>
							<td>
								${account.email}&nbsp;
							</td>
							<td>
								${account.phone}&nbsp;
							</td>
							<td>
								${account.address}&nbsp;
							</td>
							<td>
								${account.balance}&nbsp;
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/accountServlet?method=findById&accountid=${account.accountid}"  class="FunctionButton">更新</a>				
								<a href="accountServlet?method=delete&accountid=${account.accountid}" onClick="return delConfirm();"class="FunctionButton">删除</a>		
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					没有数据
				</c:otherwise>
			</c:choose>        
        </tbody>
    </table>
    
    <div id="TableTail" align="center">
		<a href="${pageContext.request.contextPath}/accountServlet?method=getAccountsByPageList&cureentPage=1">首页</a>  
		 <c:choose>
	  		  	<c:when test="${requestScope.pageBean.hasPre eq true}">
	  		  		<a href="${pageContext.request.contextPath}/accountServlet?method=getAccountsByPageList&currentPage=${requestScope.pageBean.prePage}">上一页</a>
	  		  	</c:when>
	  		  	<c:otherwise>
	  		  	 	<span class="disabled">上一页</span>
	  			</c:otherwise>
	 	 </c:choose> 
	  	
	  	<c:choose>
	  		  	<c:when test="${requestScope.pageBean.hasNext eq true}">
	  		  		<a href="${pageContext.request.contextPath}/accountServlet?method=getAccountsByPageList&currentPage=${requestScope.pageBean.nextPage}">下一页</a>
	  		  	</c:when>
	  		  	<c:otherwise>
	  		  	 	<span class="disabled">下一页</span>
	  			</c:otherwise>
	 	 </c:choose>
	 	<a href="${pageContext.request.contextPath}/accountServlet?method=getAccountsByPageList&currentPage=${requestScope.pageBean.totalPages}">末页</a>  
    </div> 
	
   <!-- 其他功能超链接 -->
	<div id="TableTail" align="center">
		<div class="FunctionButton"><a href="${pageContext.request.contextPath}/sys/saveBook.jsp">添加</a></div>
    </div> 
</div>
</body>
</html>
