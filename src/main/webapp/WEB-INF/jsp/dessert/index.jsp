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
	<!-- 
	<div class="swiper-container m-dessert-swiper">
	    <div class="swiper-wrapper">
	        <div class="swiper-slide">
	        	<a href="#"><img src="<%=imgPath %>/dessert/recommend/1.jpg"></a>
			</div>
	    </div>
	    <div class="swiper-pagination"></div>	    
	</div>
	-->
	<div class="filters">
		<ul class="filter">
			<li class="filter-title ul">按品种分类</li>
			<li><a class="active js-type-filter" href="javascript:void(0)" value="-1">不限</a></li>
			<li><a class="js-type-filter" href="javascript:void(0)" value="0">蛋糕</a></li>
			<li><a class="js-type-filter" href="javascript:void(0)" value="1">面包</a></li>
			<li><a class="js-type-filter" href="javascript:void(0)" value="2">甜点</a></li>
			<li><a class="js-type-filter" href="javascript:void(0)" value="3">咖啡</a></li>
			<li><a class="js-type-filter" href="javascript:void(0)" value="4">茶饮</a></li>
			<li><a class="js-type-filter" href="javascript:void(0)" value="5">果汁</a></li>
		</ul>
		<div class="filter-separator"></div>
		<ul class="filter">
			<li class="filter-title bl">按条件排序</li>
			<li><a class="active js-order-filter" href="javascript:void(0)" value="0">不限</a></li>
			<li><a class="js-order-filter" href="javascript:void(0)" value="1">销量</a></li>
			<li><a class="js-order-filter" href="javascript:void(0)" value="2">上架时间</a></li>
		</ul>
		<div class="right search">
			<input class="search-input" type="text" placeholder="搜索甜品">
			<div class="btn search-btn right"><i class="fa fa-search"></i></div>
		</div>
	</div>

	<div class="panel m-dessert-panel" id="js-dessert-panel">
		<c:forEach items="${desserts}" var="d">
			<div class="dessert">
				<a href="<%=request.getContextPath()%>/dessert/d/${d.id}">
				<img class="dessert-img" src="<%=imgPath %>/dessert/${d.id}.jpg" alt="${d.name}"></a>
				<div class="dessert-desc">
					<a href="<%=request.getContextPath()%>/dessert/d/${d.id}" class="dessert-name">${d.name}</a>
					<span class="dessert-price"><i class="fa fa-rmb"></i>${d.price}</span>
					<!-- 
					<div class="shop-cart">
						<div class="number-picker js-number-picker" id="1">
							<input type="button" class="minus" value="-">
							<input type="number" class="value js-dessert-value" did="${d.id}" min="0">
							<input type="button" class="plus" value="+">
						</div>
						<div class="cart-icon"><i class="fa fa-shopping-cart"></i></div>
					</div>
					-->
				</div>
			</div>
		</c:forEach>
	</div>
	<ul class="dessert-stack-nav">
		<li class="stack-nav-item nav-to-cart">
			<i class="fa fa-shopping-cart"></i>
		</li>
		<li class="stack-nav-item active js-type-filter" value="0"><i class="nav-icon cake-icon"></i><span>蛋糕</span></li>
		<li class="stack-nav-item js-type-filter" value="1"><i class="nav-icon bread-icon"></i><span>面包</span></li>
		<li class="stack-nav-item js-type-filter" value="2"><i class="nav-icon cookie-icon"></i><span>甜点</span></li>
		<li class="stack-nav-item js-type-filter" value="3"><i class="nav-icon coffee-icon"></i><span>咖啡</span></li>
		<li class="stack-nav-item js-type-filter" value="4"><i class="nav-icon tea-icon"></i><span>茶饮</span></li>
		<li class="stack-nav-item js-type-fitler" value="5"><i class="nav-icon juice-icon"></i><span>果汁</span></li>
		<li class="stack-nav-item nav-to-top"><i class="fa fa-angle-up"></i></li>
	</ul>
	<!-- 
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
	-->
	</div>
	<script src="//cdn.bootcss.com/Swiper/3.3.0/js/swiper.jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/dessert_index.js"></script>
</body>
</html>