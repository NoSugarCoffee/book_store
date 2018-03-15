<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />
<script type="text/javascript">

	function reload(){
		var date=new Date();
		document.getElementById("checkCode").src="${pageContext.request.contextPath}/checkCodeServlet?date="+date.getTime();
	}
</script>
</head>
<body>
<div id="wrap">

       <jsp:include page="/app/top.jsp"></jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>My account</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
             	欢迎注册成为我们的会员，您将在这里汲取知识的源泉！！
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">login into your account</div>
                 <form name="register" action="${pageContext.request.contextPath}/accountServlet?method=login" method="post">          
                    <div class="form_row">
                    <label class="contact"><strong>用户名:</strong></label>
                    <input type="text" class="contact_input" name="username"/>
                    </div>  
                   	 
                    <div class="form_row">
                    <label class="contact"><strong>密码:</strong></label>
                    <input type="text" class="contact_input" name="password"/>
                    </div> 
                      
                    <div class="form_row">
                    <label class="contact" ><strong>验证码:</strong></label>
                    <input type="text" class="contact_input"  style="width:100px" name="checkCode"/>
                    <img id="checkCode" src="${pageContext.request.contextPath}/checkCodeServlet" style="margin-left: 20px"/>
                    <a href="javascript:reload()">看不清楚</a>
                    </div>  
                    <c:if test="${not empty error}">                 
						<div class="form_row">
						 <label class="contact" ></label><span style="color: red">${error}</span>
						</div>
					</c:if>
                    <div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" />
                        Remember me
                        </div>
                    </div> 

                    
                    <div class="form_row">
                    <input type="submit" class="register" value="login" />
                    </div>   
                    
                  </form>     
                    
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