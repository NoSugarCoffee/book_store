<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 包含公共的JSP代码片段 -->
	
<title></title>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/page_common.js"></script>
<link href="${pageContext.request.contextPath}/sys/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="${pageContext.request.contextPath}/sys/stylesheet" type="text/css" href="style/css/index_1.css" />

</head>
<body>
	<!-- 页面标题 -->
	<div id="TitleArea">
		<div id="TitleArea_Head"></div>
		<div id="TitleArea_Title">
			<div id="TitleArea_Title_Content">
				<img border="0" width="13" height="13"
					src="${pageContext.request.contextPath}/sys/style/images/title_arrow.gif" /> 类别列表
			</div>
		</div>
		<div id="TitleArea_End"></div>
	</div>
	<!-- 过滤条件 -->
	<div id="QueryArea">
		<form action="${pageContext.request.contextPath}/FoodTypeServlet?method=search" method="post">
			<input type="hidden" name="method" value="search">
			<input type="text" name="foodType" title="请输入类别名称">
			<input type="submit" value="搜索">
		</form>
	</div>

	<!-- 主内容区域（数据列表或表单显示） -->
	<div id="MainArea">
		<table class="MainArea_Content" align="center" cellspacing="0" cellpadding="0">
			<!-- 表头-->
			<thead>
				<tr align="center" valign="middle" id="TableTitle">
					<td>类别编号</td>
					<td>类别名称</td>
					<td>操作</td>
				</tr>
			</thead>
			<!--显示数据列表 -->
			<tbody id="TableData">
					<c:choose>
						<c:when test="${not empty requestScope.types}">	
							<c:forEach items="${requestScope.types}" var="every">
								<tr>
									<td>${every.id}</td>
									<td>${every.typeName}</td>
									<td>
										<a href="${pageContext.request.contextPath}/sys/updateType.jsp?id=${every.id}">更新</a>
										<a onclick="return delconfirm()" href="${pageContext.request.contextPath}/typeServlet?method=deleteById&id=${every.id}">删除</a>
									</td>
								<tr>
							</c:forEach>			
						</c:when>
						<c:otherwise>
							没有数据
						</c:otherwise>		
					</c:choose>				
			</tbody>
		</table>
		<!-- 其他功能超链接 -->
		<div id="TableTail" align="center">
			<div class="FunctionButton">
				<a href="${pageContext.request.contextPath}/sys/saveType.jsp">添加</a>
			</div>
		</div>
	</div>
</body>
</html>
