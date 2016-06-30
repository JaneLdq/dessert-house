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
	<div class="m-search">
		<input class="search-input js-search-input left" id="js-search-input" type="text" placeholder="搜索" value="${key}">
		<div class="btn search-btn left" id="js-search"><i class="fa fa-search"></i></div>
		<div class="clear-fix"></div>
	</div>
	<div class="search-filter">
		<ul class="filter">
			<li><a class="active js-type-filter" href="javascript:void(0)" value="-1">不限</a></li><!--
			--><li><a class="js-type-filter" href="javascript:void(0)" value="0">蛋糕</a></li><!--
			--><li><a class="js-type-filter" href="javascript:void(0)" value="1">面包</a></li><!--
			--><li><a class="js-type-filter" href="javascript:void(0)" value="2">甜点</a></li><!--
			--><li><a class="js-type-filter" href="javascript:void(0)" value="3">咖啡</a></li><!--
			--><li><a class="js-type-filter" href="javascript:void(0)" value="4">茶饮</a></li><!--
			--><li><a class="js-type-filter" href="javascript:void(0)" value="5">果汁</a></li>
		</ul>
	</div>

	<div class="panel m-dessert-panel" id="js-dessert-panel">
		<c:forEach items="${desserts}" var="d">
			<div class="dessert">
				<a href="javascript:void(0)" onclick="jumpToDessertDetail(this)" did="${d.id}">
				<img class="dessert-img" src="<%=imgPath %>/dessert/${d.id}.jpg" alt="${d.name}"></a>
				<div class="dessert-desc">
					<a href="javascript:void(0)" onclick="jumpToDessertDetail(this)" did="${d.id}" class="dessert-name">${d.name}</a>
					<span class="dessert-price"><i class="fa fa-rmb"></i>${d.price}</span>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="clear-fix"></div>
	
	</div>
	<script src="//cdn.bootcss.com/Swiper/3.3.0/js/swiper.jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/search.js"></script>
</body>
</html>