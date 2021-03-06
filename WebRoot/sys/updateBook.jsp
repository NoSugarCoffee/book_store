﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <!-- 包含公共的JSP代码片段 -->
	
<title>无线图书平台</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/page_common.js"></script>
<link href="${pageContext.request.contextPath}/sys/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sys/style/css/index_1.css" />

</head>
<jsp:include page="/bookServlet">
  	<jsp:param value="typeList" name="method"/>
</jsp:include>

<body>

<!-- 页面标题 -->
<div id="TitleArea">
	<div id="TitleArea_Head"></div>
	<div id="TitleArea_Title">
		<div id="TitleArea_Title_Content">
			<img border="0" width="13" height="13" src="${pageContext.request.contextPath}/sys/style/images/title_arrow.gif"/> 更新图书
		</div>
    </div>
	<div id="TitleArea_End"></div>
</div>

<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
	<!-- 表单内容 -->
	<form action="${pageContext.request.contextPath}/bookServlet?method=update" method="post" enctype="multipart/form-data">
		<!-- 本段标题（分段标题） -->
		<div class="ItemBlock_Title">
        	<img width="4" height="7" border="0" src="${pageContext.request.contextPath}/sys/style/images/item_point.gif"> 图书信息&nbsp;
        </div>
        
		<!-- 本段表单字段 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
				<div class="ItemBlock2">
					<table cellpadding="0" cellspacing="0" class="mainForm">
						<input type="hidden" name="id" value="${param.id}"/>
                    	<tr>
							<td width="80px">类别</td>
							<td>
								<select name="type">
	                            	 <c:forEach items="${requestScope.types}" var="item" varStatus="i">
	                            	 	<option id="${item.id}" value="${item.id}" >${item.typeName}</option>
	               					 </c:forEach>
                            	</select>
                            </td>
						</tr>
						<tr>
							<td width="80px">书名</td>
							<td><input type="text" name="bookName" class="InputStyle" value="${bookDetail.bookName}"/> *</td>
						</tr>
						<tr>
							<td>价格</td>
							<td><input type="text" name="price" class="InputStyle" value="${bookDetail.price}"/> *</td>
						</tr>
						
						<tr>
							<td>作者</td>
							<td><input type="text" name="author" class="InputStyle" value="${bookDetail.author}"/> *</td>
						</tr>
						
						<tr>
							<td>出版社</td>
							<td><input type="text" name="publishing" class="InputStyle" value="${bookDetail.publishing}"/> *</td>
						</tr>
						
						<tr>
							<td>库存</td>
							<td><input type="text" name="storeNumber" class="InputStyle" value="${bookDetail.storeNumber}"/> *</td>
						</tr>
						
						<tr>
							<td>简介</td>
							<td><textarea name="details" class="TextareaStyle">${bookDetail.details}</textarea></td>
						</tr>
						<tr>
							<td width="80px">图片</td>
							<td>
									<img style='max-width:68px;width:68px;width:expression(width>68?"68px":width "px");max-width: 68px;' 
									src="${pageContext.request.contextPath}/bookimg/${bookDetail.imgPath}">
									<input type="file" name="imgPath"/> *
							</td>
						</tr>
					</table>
				</div>
            </div>
        </div>
		
		<!-- 表单操作 -->
		<div id="InputDetailBar">
				<input type="submit" value="修改" class="FunctionButtonInput">
            <a href="javascript:history.go(-1);" class="FunctionButton">返回</a>
        </div>
	</form>
</div>
</body>
</html>
