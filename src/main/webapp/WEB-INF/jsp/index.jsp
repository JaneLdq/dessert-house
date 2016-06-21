<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% String imgPath = request.getContextPath() + "/img"; %>
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
		<img class="activity-icon" src="<%=imgPath%>/activity/a_icon.png">
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
	
	<!-- 
	<div class="swiper-container new-swiper">
	    <div class="swiper-wrapper">
	        <div class="swiper-slide">
				<div class="new-panel">
					<img class="left" src="<%=imgPath %>/newproduct/1.jpg">
					<div class="right new-desc">产品1</div>
				</div>
			</div>
	        <div class="swiper-slide">
	        	<div class="new-panel">
	        		<img class="right" src="<%=imgPath %>/newproduct/2.jpg">
	        		<div class="left new-desc">产品2</div>
				</div>
	        </div>
	        <div class="swiper-slide">
	        	<div class="new-panel">
					<img class="left" src="<%=imgPath %>/newproduct/3.jpg">
					<div class="right new-desc">产品3</div>
				</div>
	        </div>
	        <div class="swiper-slide">
	        	<div class="new-panel">
					<img class="left" src="<%=imgPath %>/newproduct/4.jpg">
					<div class="right new-desc">产品4</div>
				</div>
	        </div>
	        <div class="swiper-slide">
	        	<div class="new-panel">
					<img class="left" src="<%=imgPath %>/newproduct/5.jpg">
					<div class="right new-desc">产品5</div>
				</div>
	        </div>
	    </div>
	    <div class="swiper-button-next swiper-button-white"></div>
        <div class="swiper-button-prev swiper-button-white"></div>    
	</div>

	<div class="hot-panel">
		<div class="hot-panel-row">
			<div class="hot-item">
				<img src="<%=imgPath %>/hotproduct/1.jpg"/>
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
			</div>
			<div class="hot-item">
				<img class="img-bl img-br" src="<%=imgPath %>/hotproduct/2.jpg"/>
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
			</div>
			<div class="hot-item">
				<img src="<%=imgPath %>/hotproduct/4.jpg"/>
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
			</div>
		</div>
		<div class="hot-panel-row">
			<div class="hot-item hot-item-right">
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
				<img class="img-tr img-tl img-br" src="<%=imgPath %>/hotproduct/5.jpg"/>
			</div>
			<div class="hot-item hot-item-right">
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
				<img class="img-tl img-br img-bl" src="<%=imgPath %>/hotproduct/1.jpg"/>
			</div>
			<div class="hot-item hot-item-right">
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
				<img class="img-bl img-tr img-tl" src="<%=imgPath %>/hotproduct/2.jpg"/>
			</div>
		</div>
		<div class="hot-panel-row">
			<div class="hot-item">
				<img src="<%=imgPath %>/hotproduct/1.jpg"/>
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
			</div>
			<div class="hot-item">
				<img class="img-tr img-tl" src="<%=imgPath %>/hotproduct/2.jpg"/>
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
			</div>
			<div class="hot-item">
				<img src="<%=imgPath %>/hotproduct/5.jpg"/>
				<div class="hot-item-desc">
					<a class="name" href="#">名字</a>
					<span class="price">￥ 12.00</span>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>	
	-->
	</div>
	<script src="//cdn.bootcss.com/Swiper/3.3.0/js/swiper.jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/index.js"></script>
</body>
</html>