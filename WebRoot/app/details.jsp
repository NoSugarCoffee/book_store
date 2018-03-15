<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/app/lightbox.css" type="text/css" media="screen" />
	
	<script src="${pageContext.request.contextPath}/js/prototype.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/java.js"></script>
</head>
<body>
<div id="wrap">

       <jsp:include page="/app/top.jsp"></jsp:include>
       
       
       <div class="center_content">
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="index.html">home</a> &gt;&gt; 详情页
            </div>
            <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>${bookDetail.bookName}</div>
        
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img"><a href="${pageContext.request.contextPath}/app/details.jsp"><img src="${pageContext.request.contextPath}/bookimg/thuma_${bookDetail.imgPath}" alt="" title="" border="0" /></a>
                <br /><br />
                <a href="${pageContext.request.contextPath}/bookimg/${bookDetail.imgPath}" rel="lightbox"><img src="${pageContext.request.contextPath}/images/zoom.gif" alt="" title="" border="0" /></a>
                </div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                   	<div class="prod_title">详情</div>
                    <!-- <p class="details">${bookDetail.details}<br/></p> -->
                    <div class="price"><strong>作者:</strong> <span class="red">${bookDetail.author}</span></div>
                    <div class="price"><strong>价格:</strong> <span class="red">￥${bookDetail.price}</span></div>
                    <div class="price"><strong>出版社:</strong> <span class="red">${bookDetail.publishing}</span></div>
                    <!--  <div class="price"><strong>COLORS:</strong> 
                    <span class="colors"><img src="${pageContext.request.contextPath}/images/color1.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="${pageContext.request.contextPath}/images/color2.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="${pageContext.request.contextPath}/images/color3.gif" alt="" title="" border="0" /></span></div>
                    -->
                    <!-- 两个按钮区域 -->
                    
                    <a href="${pageContext.request.contextPath}/addCartServlet?method=add&id=${param.id}&currentPage=${param.currentPage}&type=${param.type}" class="more"><img src="${pageContext.request.contextPath}/images/order_now.gif" alt="" title="" border="0" /></a>
                    <a href="${pageContext.request.contextPath}/bookServlet?currentPage=${param.currentPage}&type=${param.type}" class="more"><img src="${pageContext.request.contextPath}/images/back.png" alt="" title="" border="0" /></a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
            <div id="demo" class="demolayout">
                <ul id="demo-nav" class="demolayout">
                <li><a class="" href="#tab1">描述</a></li>
                <!-- <li><a class="" href="#tab2">其他</a></li> -->
                </ul>
    
            <div class="tabs-container">
                    <div style="display: block;" class="tab" id="tab1">
                          <p class="more_details">${bookDetail.details}</p>             
                                          
                    </div>	
                   <div style="display: none;" class="tab" id="tab2">
                   <!-- <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>    

                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                     -->  
                    <div class="clear"></div>
                    
                  </div>	
            
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
<script type="text/javascript">

var tabber1 = new Yetii({
id: 'demo'
});

</script>
</html>