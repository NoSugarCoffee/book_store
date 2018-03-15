<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<form action="${pageContext.request.contextPath}/accountServlet?method=update&accountid=${account.accountid}" method="post">
		<!-- 本段标题（分段标题） -->
		<div class="ItemBlock_Title">
        	<img width="4" height="7" border="0" src="${pageContext.request.contextPath}/sys/style/images/item_point.gif"> 账户信息&nbsp;
        </div>
        
		<!-- 本段表单字段 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
				<div class="ItemBlock2">
					<table cellpadding="0" cellspacing="0" class="mainForm">
                    	<tr>
							<td width="80px">用户名</td>
							<td><input type="text" name="username" class="InputStyle" value="${account.username}"/></td>
						</tr>
						<tr>
							<td width="80px">密码</td>
							<td><input type="text" name="password" class="InputStyle" value="${account.password}"/></td>
						</tr>
						<tr>
							<td>邮箱</td>
							<td><input type="text" name="email" class="InputStyle" value="${account.email}"/></td>
						</tr>
						
						<tr>
							<td>电话</td>
							<td><input type="text" name="phone" class="InputStyle" value="${account.phone}"/></td>
						</tr>
						
						<tr>
							<td>地址</td>
							<td><input type="text" name="address" class="InputStyle" value="${account.address}"/></td>
						</tr>
						
						<tr>
							<td>余额</td>
							<td><input type="text" name="balance" class="InputStyle" value="${account.balance}"/></td>
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
