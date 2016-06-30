<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 	String imgPath = request.getContextPath() + "/img"; 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//cdn.bootcss.com/Swiper/3.3.0/css/swiper.min.css">
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper home-wrapper">
	<div class="activity-tag">
		<span class="activity-title">最新活动</span>
		<!-- <img class="activity-icon" src="<%=imgPath%>/activity/a_icon.png">-->
	</div>
	<div class="swiper-container activity-swiper">
	    <div class="swiper-wrapper">
	        <div class="swiper-slide">
	        	<img src="<%=imgPath %>/activity/1.jpg">
	        	<div class="activity-panel"></div>
			</div>
	        <div class="swiper-slide">
				<img src="<%=imgPath %>/activity/1.jpg">
				<div class="activity-panel"></div>
	        </div>
	        <div class="swiper-slide">
				<img src="<%=imgPath %>/activity/1.jpg">
	        	<div class="activity-panel"></div>
	        </div>
	    </div>
	    <div class="swiper-pagination"></div>	    
	</div>

	<div class="index-section">
		<div class="section-title">
			<div class="left line"></div>
			<div class="content">夏日新品</div>
			<div class="right line"></div>
			<a class="more" href="<%=request.getContextPath()%>/desserts"><i class="fa fa-ellipsis-h"></i></a>
		</div>
		<div class="section-content new">
		<c:forEach items="${newList}" var="newItem" varStatus="status"><c:choose><c:when test="${status.index %2 == 0}"><div class="new-item up-item">
				<div class="new-item-content">
					<a class="img" href="<%=request.getContextPath()%>/dessert/d/${newItem.id}"><img src="<%=imgPath%>/dessert/${newItem.id}.jpg"></a>
					<div class="intro">
						<a class="name" href="<%=request.getContextPath()%>/dessert/d/${newItem.id}">${newItem.name}</a>
						<p>${newItem.desc}</p>
					</div>
				</div>
			</div></c:when><c:otherwise><div class="new-item down-item">
				<div class="new-item-content active">
					<div class="intro">
						<a class="name" href="<%=request.getContextPath()%>/dessert/d/${newItem.id}">${newItem.name}</a>
						<p>${newItem.desc}</p>
					</div>
					<a class="img" href="<%=request.getContextPath()%>/dessert/d/${newItem.id}"><img src="<%=imgPath%>/dessert/${newItem.id}.jpg"></a>
				</div>
			</div></c:otherwise></c:choose></c:forEach>
		</div>
	</div>	
	
	<div class="index-section">
		<div class="section-title brown">
			<div class="left line"></div>
			<div class="content">人气推荐</div>
			<div class="right line"></div>
			<a class="more" href="<%=request.getContextPath()%>/desserts"><i class="fa fa-ellipsis-h"></i></a>
		</div>
		<div class="section-content recommend">
			<ul class="dessert-thumbnail-list">
			<c:forEach items="${hotList}" var="hotItem"><li class="dessert-thumbnail-item"><a href="<%=contextPath%>/dessert/d/${hotItem.id}">
					<img class="img" src="<%=contextPath%>/img/dessert/${hotItem.id}.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">${hotItem.name}</a>
				</li></c:forEach>
			</ul>
		</div>
	</div>	
	
	</div>
	<script src="//cdn.bootcss.com/Swiper/3.3.0/js/swiper.jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/index.js"></script>
</body>
</html>