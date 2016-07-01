<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.css" type="text/css" media="screen" />
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>我的购物车 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
	<div class="m-cart-title">
		我的购物车
	</div>
	<c:if test="${len >0 }">
		<div class="m-cart-panel">
	</c:if>
	<c:if test="${len <= 0 }">
		<div class="m-cart-panel empty">
	</c:if>
		<c:if test="${len > 0}">
		<ul class="cart-thead">
			<li class="column t-checkbox">
				<input type="checkbox"></li>
			<li class="column t-dessert">甜品</li>
			<li class="column t-date">日期</li>
			<li class="column t-price">单价(元)</li>
			<li class="column t-quantity">数量</li>
			<li class="column t-sum">总价（元）</li>
			<li class="column t-op">操作</li>
		</ul>
		</c:if>
		<div class="cart-list">
		<c:choose>
			<c:when test="${len == 0}">
				<div class="cart-list-empty">
					<img src="<%=contextPath%>/img/cart.png">
					<p>购物车什么都没有，</p>
					<a href="<c:url value="/dessert"/>"> 马上去逛逛！Ψ(￣∀￣)Ψ</a>
				</div>
			</c:when>
			<c:otherwise>
			<c:forEach items="${items}" var="item">
				<ul class="cart-list-item" cid="${item.id}">
					<li class="cell l-checkbox">
						<input type="checkbox">
					</li>
					<li class="cell l-dessert">
						<img class="left cart-cell-dessert-img" src="<%=request.getContextPath()%>/img/dessert/${item.dessertId}.jpg" alt="${item.dessertName})"/>
						<div class="left cart-cell-dessert-info">
							<a class="name" href="<%=request.getContextPath() %>/dessert/d/${item.dessertId}" >${item.dessertName}</a>
							<ul class="detail-info">
							<c:forEach items="${item.additionList}" var="i">
								<li class="item">${i.val}</li>
							</c:forEach>
							</ul>
							<a class="store-address js-cell-dessert-store" href="<%=request.getContextPath() %>/store/${item.storeId}" cid="${item.id}" sid="${item.storeId}"><i class="fa fa-map-marker"></i>  ${item.storeName}</a>	
						</div>
					</li>
					<li class="cell l-date">
						<input class="js-cell-dessert-date" type="date" date="${item.date}"
						did="${item.dessertId}" sid="${item.storeId}" cid="${item.id}" value="${item.date}" min="${minDate}" max="${maxDate}" required>
					</li>
					<li class="cell l-price">
						${item.price}
					</li>
					<li class="cell l-quantity">
						<div class="number-picker js-number-picker">
							<input type="button" class="minus" value="-" cid="${item.id}">
							<input type="number" class="value js-dessert-value" cid="${item.id}" did="${item.dessertId}" value="${item.quantity}" max="${item.max}" min=1>
							<input type="button" class="plus" value="+" cid="${item.id}" did="${item.dessertId}">
						</div>
						<span class="quantity-remain">库存：<span class="js-dessert-remain" cid="${item.id}">${item.max}</span></span>
					</li>
					<li class="cell l-sum js-cart-item-total" cid="${item.id}">
						${item.total}
					</li>
					<li class="cell l-op">
						<a class="js-delete-cart-item" cid="${item.id}">删除</a>
					</li>
				</ul>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
		<c:if test="${len > 0}">
		<div class="cart-op js-cart-op">
			<div class="left tip op-tip" style="display:none">
				<span class="left select-all"><input type="checkbox">全选</span>
				<a class="left" href="javascript:void(0)">删除选中商品</a>
			</div>
			<!-- <div class="right btn btn-submit" id="js-cart-submit">结算</div>	-->	
			<a class="right btn btn-submit" href="<%=contextPath%>/cart/order">结算</a>
			<div class="right tip total-tip">
				<p>总价：<span class="js-sum"><i class="fa fa-rmb"></i></span></p>
				<p>已享受会员折扣：<span id="js-discount">- <i class="fa fa-rmb"></i></span></p>
			</div>
			<div class="right tip select-tip" style="display:none">已选择<span class="num">0</span>份甜点</div>
			<div class="clear-fix"></div>
		</div>
		</c:if>
	</div>
	<div class="m-dessert-recommend" style="margin-top: 0">
		<div class="title">
			<div class="left line"></div>
			<div class="content">猜你喜欢</div>
			<div class="right line"></div>
		</div>
		<ul class="dessert-thumbnail-list">
			<c:forEach items="${likes}" var="l"><li class="dessert-thumbnail-item">
				<a href="javascript:void(0)" onclick="jumpToDessertDetail(this)" did="${l.id}" >
					<img class="img" src="<%=contextPath%>/img/dessert/${l.id}.jpg"></a>
				<a class="name" href="javascript:void(0)" onclick="jumpToDessertDetail(this)" did="${d.id}">${l.name}</a>
			</li></c:forEach>
		</ul>
	</div>
	</div>
	<div class="toaster" style="display:none"></div>
	<script src="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/cart.js"></script>
</body>
</html>