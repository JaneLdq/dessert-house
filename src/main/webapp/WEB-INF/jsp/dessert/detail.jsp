<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.css" type="text/css" media="screen" />
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>${dessert.name} - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<div class="m-dessert-detail">
			<div class="left img-panel">
				<img class="img-lg" src="<%=request.getContextPath()%>/img/dessert/${dessert.id}.jpg">
			</div>
			<div class="right info-panel">
				<h2 class="name">${dessert.name}</h2>
				<input type="hidden" id="js-dessert-id" value="${dessert.id}">
				<span class="price"><i class="fa fa-rmb"></i>${dessert.price}</span>
				<div class="desc">${dessert.desc}</div>
				<div class="separator"></div>
				<div class="options">
					<span class="tip"><i class="fa fa-calendar"></i>所有商品需提前<span class="highlight">1-7</span>天预订</span>
					<div class="option"><label>日期：</label>
						<input id="js-date" type="date" required min="${minDate}" max="${maxDate}" value="${minDate}">
					</div>
					<div class="option"><label>店面：</label>
						<select id="js-store-selector">
							<c:forEach items="${stores}" var="store">
							<option value="${store.id}" 
								<c:if test="${storeId == store.id}">
									<c:out value=" selected"></c:out>
								</c:if>
							>${store.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="option"><label>规格：</label>
						<c:choose>
						<c:when test="${dessert.type == 0}">
							<ul class="cake-size-list">
								<li class="size-item active">1.2磅</li>
								<li class="size-item">2.2磅</li>
								<li class="size-item">3.2磅</li>
								<li class="size-item">6磅</li>
							</ul>
						</c:when>
						<c:when test="${dessert.type > 2}">
							<ul class="cake-size-list">
								<li class="size-item">大杯（800ml）</li>
								<li class="size-item">中杯（500ml）</li>
							</ul>
						</c:when>
						</c:choose>
					</div>
					<c:if test="${dessert.type > 2}">
						<div class="option"><label>温度：</label>
							<ul class="cake-size-list">
								<li class="size-item">热</li>
								<li class="size-item">冰</li>
								<li class="size-item">去冰</li>
							</ul>
						</div>
					</c:if>
					<div class="option"><label>数量：</label>
						<div class="number-picker js-number-picker" id="1">
							<input type="button" class="minus" value="-">
							<input type="number" class="value js-dessert-value" id="js-dessert-value" id="1" value="0" max="${quantity}" min="0">
							<input type="button" class="plus" value="+">
						</div>
						<span class="tip">（该店当日剩余库存：<span id="js-quantity">${quantity}</span>）</span>
					</div>
				</div>
				<div class="btn btn-submit" id="js-add-dessert">加入购物车</div>
			</div>
			<div class="dessert-pre-next">
				<div class="pre"><i class="fa fa-angle-left fa-lg"></i></div>
				<div class="next"><i class="fa fa-angle-right fa-lg"></i></div>
			</div>
			<div class="clear-fix"></div>
		</div>
		<c:if test="${dessert.type == 0 }">
			<div class="m-dessert-size">
				<div class="title">关于规格</div>
				<ul>
				  	<li><label>规格</label><span>1.2磅</span><span>2.2磅</span><span>3.2磅</span><span>6磅</span></li>
				  	<li><label>推荐使用人数</label><span>4-5人</span><span>7-8人</span><span>10-12人</span><span>15-20人</span></li>
				 	<li><label>标准餐具配备</label><span>免费配送5套餐具</span><span>免费配送10套餐具</span><span>免费配送15套餐具</span><span>免费配送20套餐具</span></li>
				</ul>
			</div>
		</c:if>
		<div class="m-dessert-recommend">
			<div class="title">
				<div class="left line"></div>
				<div class="content">你可能还会喜欢</div>
				<div class="right line"></div></div>
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
				</li>
			</ul>
		</div>
	</div>
	<div class="modal common-modal cart-modal" id="add-modal" style="display:none">
		<div class="modal-content">
			甜品已加入购物车!
		</div>
		<div class="modal-ops">
			<a class="btn" href="<%= request.getContextPath()%>/desserts">再看看其他的~</a>
			<a class="btn" href="<%= request.getContextPath()%>/cart">结账！</a>
		</div>
	</div>
	<script src="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/dessert_detail.js"></script>
</body>
</html>