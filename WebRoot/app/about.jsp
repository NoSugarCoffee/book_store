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
            <div class="title"><span class="title_icon"><img src="${pageContext.request.contextPath}/images/bullet1.gif" alt="" title="" /></span>About us</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            <img src="${pageContext.request.contextPath}/images/about.gif" alt="" title="" class="right" /> 
               	南京晓庄学院图书网（www.njxzlib.com）是全球知名的综合性网上购物商城，由国内著名出版机构科文公司、美国老虎基金、美国IDG集团、卢森堡剑桥集团、亚洲创业投资基金（原名软银中国创业基金）共同投资成立。<br /><br />
                        从1999年11月南京晓庄学院图书网(www.njxzlib.com) 正式开通至今，当当已从早期的网上卖书拓展到网上卖各品类百货，包括图书音像、美妆、家居、母婴、服装和3C数码等几十个大类，其中在库图书、音像商品超过80万种，百货50余万种；目前当当网的注册用户遍及全国32个省、市、自治区和直辖市，每天有450万独立UV，每天要发出20多万个包裹；物流方面，当当在全国11个城市设有21个仓库，共37万多平，并在21个城市提供当日达服务，在158个城市提供次日达服务， 在11个城市提供夜间递服务。<br /><br />
         南京晓庄学院图书网于美国时间2010年12月8日在纽约证券交易所正式挂牌上市，成为中国第一家完全基于线上业务、在美国上市的B2C网上商城。自路演阶段，当当网就以广阔的发展前景而受到大批基金和股票投资人的追捧，上市当天股价即上涨86%，并以103倍的高PE和3亿1千3百万美金的IPO融资额，连创中国公司境外上市市盈率和亚太区2010年高科技公司融资额度两项历史新高。         
            </p>
            </div>	
        <div class="clear"></div>
        </div><!--end of left content-->
       <jsp:include page="/app/right.jsp" ></jsp:include>
       <div class="clear"></div>
       </div><!--end of center content-->
      <jsp:include page="/app/foot.jsp" ></jsp:include>
    

</div>

</body>
</html>