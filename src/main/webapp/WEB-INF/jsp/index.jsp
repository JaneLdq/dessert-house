<%@ page language="java" contentType="text/html; charset=utf-8" %>
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
				<img src="<%=imgPath %>/activity/2.jpg">
				<div class="activity-panel"></div>
	        </div>
	        <div class="swiper-slide">
				<img src="<%=imgPath %>/activity/3.jpg">
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
			<div class="more"><i class="fa fa-ellipsis-h"></i></div>
		</div>
		<div class="section-content new">
			<div class="new-item up-item">
				<div class="new-item-content">
					<a class="img" href="<%=request.getContextPath()%>/dessert/d/1"><img src="<%=imgPath%>/hot/1.png"></a>
					<div class="intro">
						<a class="name" href="<%=request.getContextPath()%>/dessert/d/1">它的名字</a>
						<p>这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍</p>
					</div>
				</div>
			</div><!--  
			--><div class="new-item down-item">
				<div class="new-item-content active">
					<div class="intro">
						<a class="name" href="<%=request.getContextPath()%>/dessert/d/1">它的名字</a>
						<p>这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍</p>
					</div>
					<a class="img" href="<%=request.getContextPath()%>/dessert/d/2"><img src="<%=imgPath%>/hot/2.png"></a>
				</div>
			</div><!--  
			--><div class="new-item up-item">
				<div class="new-item-content">
					<a class="img" href="<%=request.getContextPath()%>/dessert/d/1"><img src="<%=imgPath%>/hot/4.png"></a>
					<div class="intro">
						<a class="name" href="<%=request.getContextPath()%>/dessert/d/1">它的名字</a>
						<p>这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍</p>
					</div>
				</div>
			</div><!--  
			--><div class="new-item down-item">
				<div class="new-item-content active">
					<div class="intro">
						<a class="name" href="<%=request.getContextPath()%>/dessert/d/1">它的名字</a>
						<p>这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍这是一段介绍</p>
					</div>
					<a class="img" href="<%=request.getContextPath()%>/dessert/d/2"><img src="<%=imgPath%>/hot/3.png"></a>
				</div>
			</div>
		</div>
	</div>	
	
	<div class="index-section">
		<div class="section-title brown">
			<div class="left line"></div>
			<div class="content">人气推荐</div>
			<div class="right line"></div>
		</div>
		<div class="section-content recommend">
			<ul class="dessert-thumbnail-list">
				<li class="dessert-thumbnail-item">
					<a href="<%=contextPath%>/dessert/d/1"><img class="img" src="<%=contextPath%>/img/dessert/2.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">黑森林蛋糕</a>
				</li><!-- 
				--><li class="dessert-thumbnail-item">
					<a href="<%=contextPath%>/dessert/d/1"><img class="img" src="<%=contextPath%>/img/dessert/11.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">黑森林蛋糕</a>
				</li><!-- 
				--><li class="dessert-thumbnail-item">
					<a href="<%=contextPath%>/dessert/d/1"><img class="img" src="<%=contextPath%>/img/dessert/5.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">黑森林蛋糕</a>
				</li><!-- 
				--><li class="dessert-thumbnail-item">
					<a href="<%=contextPath%>/dessert/d/1"><img class="img" src="<%=contextPath%>/img/dessert/8.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">黑森林蛋糕</a>
				</li><li class="dessert-thumbnail-item">
					<a href="<%=contextPath%>/dessert/d/1"><img class="img" src="<%=contextPath%>/img/dessert/2.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">黑森林蛋糕</a>
				</li><!-- 
				--><li class="dessert-thumbnail-item">
					<a href="<%=contextPath%>/dessert/d/1"><img class="img" src="<%=contextPath%>/img/dessert/11.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">黑森林蛋糕</a>
				</li><!-- 
				--><li class="dessert-thumbnail-item">
					<a href="<%=contextPath%>/dessert/d/1"><img class="img" src="<%=contextPath%>/img/dessert/5.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">黑森林蛋糕</a>
				</li><!-- 
				--><li class="dessert-thumbnail-item">
					<a href="<%=contextPath%>/dessert/d/1"><img class="img" src="<%=contextPath%>/img/dessert/8.jpg"></a>
					<a class="name" href="<%=contextPath%>/dessert/d/1">黑森林蛋糕</a>
				</li>
			</ul>
		</div>
	</div>	
	
	</div>
	<script src="//cdn.bootcss.com/Swiper/3.3.0/js/swiper.jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/index.js"></script>
</body>
</html>