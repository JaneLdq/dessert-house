<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 	String imgPath = request.getContextPath() + "/img"; 
	int num = 0;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//cdn.bootcss.com/Swiper/3.3.0/css/swiper.min.css">
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>品尝 · 食 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
	<div class="swiper-container m-dessert-swiper">
	    <div class="swiper-wrapper">
	        <div class="swiper-slide">
	        	<a href="#"><img src="<%=imgPath %>/dessert/recommend/1.jpg"></a>
			</div>
	        <div class="swiper-slide">
				<a href="#"><img src="<%=imgPath %>/dessert/recommend/2.jpg"></a>
	        </div>
	        <div class="swiper-slide">
				<a href="#"><img src="<%=imgPath %>/dessert/recommend/3.jpg"></a>
	        </div>
	        <div class="swiper-slide">
				<a href="#"><img src="<%=imgPath %>/dessert/recommend/4.jpg"></a>
	        </div>
	        <div class="swiper-slide">
				<a href="#"><img src="<%=imgPath %>/dessert/recommend/5.jpg"></a>
	        </div>
	    </div>
	    <div class="swiper-pagination"></div>	    
	</div>
	<div class="panel m-dessert-panel">
		<c:forEach items="${desserts}" var="d">
			<% 	if(num % 3 == 0){
					out.print("<div class='row'>");
			} %>
			<div class="col dessert">
				<a href="<%=request.getContextPath()%>/dessert/d/${d.id}">
				<img class="dessert-img" src="<%=imgPath %>/dessert/${d.id}.jpg" alt="${d.name}"></a>
				<div class="dessert-desc">
					<a href="<%=request.getContextPath()%>/dessert/d/${d.id}" class="dessert-name">${d.name}</a>
					<span class="dessert-price"><i class="fa fa-rmb"></i>${d.price}</span>
				</div>
			</div>
			<% 	if(num % 3 == 2){
					out.print("</div>");
				}
				num++;
			%>
		</c:forEach>
	</div>
	<nav>
		<ul class="pagination">
   			<c:if test="${pre >=0 }">   
   				<li class="left pre"><a href="<%=request.getContextPath() %>/dessert/${pre}"><i class="fa fa-angle-left"></i>上一页</a></li>  
   			</c:if>
   			<c:if test="${next >0 }">   
				<li class="right next"><a href="<%=request.getContextPath() %>/dessert/${next}">下一页 <i class="fa fa-angle-right"></i></a></li> 
   			</c:if>
   			<div class="clear-fix"></div>
		</ul>
	</nav>
	</div>
	<script src="//cdn.bootcss.com/Swiper/3.3.0/js/swiper.jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/dessert_index.js"></script>
</body>
</html>