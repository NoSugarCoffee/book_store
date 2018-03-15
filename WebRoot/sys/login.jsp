
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	管理员登录
</title>
    <style type="text/css">
    	#admin_denglu
		{
			width:340px;
			height:153px;
			background-image:url(${pageContext.request.contextPath}/sys/style/images/new_denglu.jpg);
			background-repeat: no-repeat;
			padding:120px 0 0 140px;
			font-size:12px;
			margin:100px auto;
		}
    </style>
</head>
<body>

<form action="${pageContext.request.contextPath}/accountServlet?method=adminLogin" method="post">

<div id="admin_denglu">
    用户名: <input name="userName" type="text" id="userNameTxt" style="width:125px;" />
    <span id="rv1" style="color:Red;display:none;">请先填写用户名</span><br /><br />
    密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="password" id="password" style="width:125px;" />
    <span id="rv2" style="color:Red;display:none;">请先输入密码</span><br /><br />
    <span style=" width:20px; display:block; float:left"></span>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="image" name="login" id="login" src="${pageContext.request.contextPath}/sys/style/images/denglu.gif" onclick="" style="border-width:0px;" />
   <br />
    <span id="infornlabel" style="color:Red;">${msg}</span>
</div>

</form>
    
</body>
</html>
