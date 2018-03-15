<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/sys/style/js/jquery.js"></script>
<script type="text/javascript">

	function validate(){
		var flag=true;
		if(!(validateEmail()&&validateUsername()&&validatePhone()&&validateAddress()&&
		validateCheckPassword()&&validatePassword())){
			alert("validateEmail:"+validateEmail());
			alert("请填写正确后，在提交");
			flag=false;		
		}
		$(":input").each(function(){
			if($(this).val()==""){
				flag=false;
			}
		});
		return flag;
	}
		
	function error(id,msg){
		$("#"+id+"Text").html(msg);
		$("#"+id+"img").attr("src","${pageContext.request.contextPath}/images/no.png");
		$("#"+id+"msg").css("display","block");
	}	
		
	function right(id){
		$("#"+id+"img").attr("src","${pageContext.request.contextPath}/images/yes.png");
		$("#"+id+"msg").css("display","none");
	}
	
	/*
		邮件校验
	*/
	function validateEmail(){
		var id="email";
		var val=$("#"+id).val();
		var emailReg=/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
			if(val!=""){
				if(!emailReg.test(val)){
					error(id,"邮箱不合法<br/>");
					return false;
				}else{
					right(id);
					return true;
				}	
			}
		return false;
	}	

	/*
		地址校验
	*/
	function validatePhone(){
		var id="phone";
		var val=$("#"+id).val();
		var phoneReg=/(\+86|0086)?(\s)*1[34578]\d{9}/g;
		if(val!=""){
			if(!phoneReg.test(val)){
				error(id,"手机号码不合法<br/>");
				return false;
			}else{
				right(id);
				return true;
			}
		}
		return false;
	}
	
	/*
		地址验证
	*/
	function validateAddress(){
		var id="address";
		var val=$("#"+id).val();
		var addReg=/[\u4e00-\u9fa5]+省[\u4e00-\u9fa5]+市[\u4e00-\u9fa5]+/;
			if(val!=""){
				if(addReg.test(val)){
					right(id);
					return true;
				}else{
					error(id,"地址不合法<br/>");
					return false;
				}
			}
		return false;
	}
	
	function lenCheck(){
		var len;
		var reg2=/[^\x00-\xff]/g;
		len=$("#username").val().length;
		$("#usernamemsg").css("display","block");
		$("#usernameText").html("当前"+len+"个字符<br/>");
		if(len>=5&&len<=17)
		return true;
		else 
		return false;
	}
	
	/*
		用户名校验
	*/
	function validateUsername(){
		var flag=true;
		var id="username";
		var val=$("#"+id).val();
		var reg=/[\w\u4e00-\u9fa5]{5,17}/g;
			if(val!=""){
				$.ajax({
					url:"${pageContext.request.contextPath}/accountServlet",
					data:{method:"ajaxCheck",username:val},
					type:"post",
					dataType:"json",
					async:false,
					success:function(result){
						if(result){
							error(id,"名字被占用<br/>");	
							flag=false;	
							return false;
						}else{
							if(!lenCheck()){
								error(id,"长度不合法<br/>");
								flag=false;
								return false;
							}else if(!reg.test(val)){
								error(id,"含有非法字符<br/>");
								flag=false;
								return false;
							}else{
								right(id);
								return true;
							}		
						}
					}
				});
			}
		return flag;
	}
	
	/*
		密码校验
	*/
	function validatePassword(){
			var id="password";
			var val=$("#"+id).val();
			var pwdExp=/^[a-zA-Z]\w{4,16}$/;
			if(val!=""){
				if(pwdExp.test(val)){
					right(id);
					return true;
				}else{
					error(id,"以字母开头[5-17]个字符");
					return false;
				}
			}
			return false;
	 }
	 
	 /*
	 密码确认框
	 */
	 function validateCheckPassword(){
	 		var id="checkPassword";
	 		var val=$("#"+id).val();
			if(val!=""){
				if($("#password").val()!=val){
					error(id,"密码不一致<br/>");
					return false;
				}else{
					right(id);
					return true;
				}
			}
			return false;
	 }
	
	$(function(){
		$(".contact_input").blur(function(){
			var id=$(this).attr("id");
			eval("validate"+id.substring(0,1).toUpperCase()+id.substring(1)+"()");
		});
		
		$(".contact_input").focus(function(){
			var id=$(this).attr("id");
			$("#"+id+"img").attr("src","");
			$("#"+id+"msg").css("display","none");
		});
		
		$(":input:eq(0)").keyup(function(){
			lenCheck();
		});
		
	});
		
	function yes(){
		alert("注册成功");
	}
	function no(){
		alert("注册失败");
	}
</script>
</head>
<body>
	<c:if test="${requestScope.ok eq 'yes'}">
		<script type="text/javascript">yes()</script>
	</c:if>
	<c:if test="${requestScope.ok eq 'no'}">
		<script type="text/javascript">no()</script>
	</c:if>
		

<div id="wrap">
       <jsp:include page="/app/top.jsp"></jsp:include>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>Register</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
             欢迎注册成为我们的会员，您将在这里汲取知识的源泉！！ 
            </p>
              	<div class="contact_form">
                <div class="form_subtitle">create new account</div>
                 <form name="register" action="${pageContext.request.contextPath}/accountServlet?method=save" method="post" id="registForm">          
                    <div class="form_row">
                    <label class="contact"><strong>Username:</strong></label>
                    <input type="text" class="contact_input" name="username" id="username"/><img class="imgclass" id="usernameimg" src=""></img>
                    </div>
                    <div class="form_row_msg" id="usernamemsg">
                   		<label class="contact"></label>
                   		<span id="usernameText"><br/></span>
                   		<label class="contact"></label>
                   		<span>[5-17个字符]不能有特殊字符哟(*^_^*)</span>
                   	</div> 
					
                    <div class="form_row">
                    <label class="contact"><strong>Password:</strong></label>
                    <input type="password" class="contact_input" name="password" id="password"/><img class="imgclass"  id="passwordimg" src=""></img>
                    </div>
                    <div class="form_row_msg" id="passwordmsg">
                   		<label class="contact"></label>
                   		<span id="passwordText"><br/></span>
                   	</div>
                   	
                   	<div class="form_row">
                    <label class="contact"><strong>CheckPwd:</strong></label>
                    <input type="password" class="contact_input" name="checkpassword" id="checkPassword"/><img class="imgclass" id="checkPasswordimg" src=""></img>
                    </div>
                    <div class="form_row_msg" id="checkPasswordmsg">
                   		<label class="contact"></label>
                   		<span id="checkPasswordText"><br/></span>
                   	</div>
                     

                    <div class="form_row">
                    <label class="contact"><strong>Email:</strong></label>
                    <input type="text" class="contact_input" name="email" id="email"/><img class="imgclass" id="emailimg" src=""></img>
                    </div>
                    <div class="form_row_msg" id="emailmsg">
                   		<label class="contact"></label>
                   		<span id="emailText"><br/></span>
                   	</div>


                    <div class="form_row">
                    <label class="contact"><strong>Phone:</strong></label>
                    <input type="text" class="contact_input" name="phone" id="phone"/><img class="imgclass" id="phoneimg" src=""></img>
                    </div>
                    <div class="form_row_msg" id="phonemsg">
                   		<label class="contact"></label>
                   		<span id="phoneText"></span>
                   	</div> 
                    
                    <div class="form_row">
                    <label class="contact"><strong>Address:</strong></label>
                    <input type="text" class="contact_input" name="address" id="address"/><img class="imgclass" id="addressimg" src=""></img>
                    </div>
                    <div class="form_row_msg" id="addressmsg">
                   		<label class="contact"></label>
                   		<span id="addressText"></span>
                   	</div>                     

                    <div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" id="chk" value="0" onchange="change()"/>
                        I agree to the <a href="#">terms &amp; conditions</a>
                        </div>
                    </div> 
    
                    <div class="form_row" style="margin: 0 auto;" id="btn">
                    <input type="submit" class="register"  value="register" id="btn" onclick="return validate()"/>                		
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