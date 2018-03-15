<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />
</head>
<body>
<div id="wrap">
<jsp:include page="/app/top.jsp"></jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>Contact Us</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">服务E-mail：1353025954@qq.com</p>
  	        <p class="details">订购E-mail：order@qq.com</p>
            <p class="details">投诉E-mail：99315@ts.com</p>
            <p class="details"> 工作时间：9:00-19:00</p>
	    	<p class="details"> 来函地址：江苏省南京市南京晓庄学院 邮编：312000</p>
            	<form action="${pageContext.request.contextPath}/contactServlet?method=contact" method="post">
              	<div class="contact_form">
                <div class="form_subtitle">all fields are requierd</div>          
                    <div class="form_row">
                    <label class="contact"><strong>Name:</strong></label>
                    <input type="text" class="contact_input" name="name"/>
                    </div>  

                    <div class="form_row">
                    <label class="contact"><strong>Email:</strong></label>
                    <input type="text" class="contact_input" name="email"/>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>Phone:</strong></label>
                    <input type="text" class="contact_input" name="phone"/>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>Company:</strong></label>
                    <input type="text" class="contact_input" name="company"/>
                    </div>


                    <div class="form_row">
                    	<label class="contact"><strong>Message:</strong></label>
                    	<textarea class="contact_textarea" name="message"></textarea>
                    </div>

                    
                    <div class="form_row">
                    	<input type="submit" class="contact" value="提交您宝贵的建议"/>
                    </div>      
                </div>  
            
          </div>	
          </form>
              
            
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <jsp:include page="/app/right.jsp" ></jsp:include>
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
        <jsp:include page="/app/foot.jsp"></jsp:include>
    

</div>

</body>
</html>