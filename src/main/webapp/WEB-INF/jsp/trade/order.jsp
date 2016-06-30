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
	<div class="wrapper m-order-wrapper">
		<div class="m-order-info">
			<h1>确认收货地址</h1>
			<div id="js-address-list" address-id="${address.id}">
				<ul>
					<li><i class="fa fa-map-marker"></i></li>
					<li><label>收货人：</label><span class="js-current-receiver">${address.receiver}</span></li>
					<li><label>收货地址：</label><span class="js-current-address">${address.address}</span></li>
					<li><label>联系电话：</label><span class="js-current-tel">${address.tel}</span></li>
					<li class="btn btn-sm" id="js-address-selector">选择其他地址</li>
				</ul>
				<button class="btn btn-sm js-add-address">使用新地址</button>
			</div>
			<div class="customer-pick-up">
				<div class="type-selector js-type-selector" style="display:none">
					<input type="radio" name="pick-type" id="js-take-out" value="0" checked><label>送货上门</label>
				</div>
				<div class="type-selector">
					<input type="radio" name="pick-type" id="js-customer-pick-up" value="1"><label>我要自提</label>
					<p class="tip js-type-selector" style="display:none">蛋糕预订请在备注中注明具体取餐时段，其他甜品可在预订日期任意时间段到店获取，谢谢您的配合！</p>
				</div>
			</div>
		</div>
		<div class="m-order-info">
			<h1>备注</h1>
			<textarea id="js-remark" rows="1" placeholder="如有特殊要求，请在备注中注明，我们会尽量满足您的合理需求！"></textarea>
		</div>
		<div class="m-order-item">
			<h1>确认订单信息</h1>
			<ul class="cart-thead">
				<li class="column t-dessert">甜品</li>
				<li class="column t-date">日期</li>
				<li class="column t-price">单价(元)</li>
				<li class="column t-quantity">数量</li>
				<li class="column t-sum">总价（元）</li>
			</ul>
			<c:forEach items="${items}" var="item">
			<ul class="cart-list-item" cid="${item.id}">
					<li class="cell l-dessert">
						<img class="left cart-cell-dessert-img" src="<%=request.getContextPath()%>/img/dessert/${item.dessertId}.jpg" alt="${item.dessertName})"/>
						<div class="left cart-cell-dessert-info">
							<a class="name" href="<%=request.getContextPath() %>/dessert/d/${item.dessertId}" >${item.dessertName}</a>
							<ul class="detail-info">
								<c:forEach items="${item.additionList}" var="i">
									<li class="item">${i.val }</li>
								</c:forEach>
							</ul>
							<span class="store-address js-cell-dessert-store" cid="${item.id}" sid="${item.storeId}"><i class="fa fa-map-marker"></i>  ${item.storeName}</span>	
						</div>
					</li>
					<li class="cell l-date">${item.date }</li>
					<li class="cell l-price">${item.price}</li>
					<li class="cell l-quantity">${item.quantity}</li>
					<li class="cell l-sum js-cart-item-total" cid="${item.id}">${item.total}</li>
				</ul>
			</c:forEach>
		</div>
		<div class="m-order-total">
			<div class="cart-op js-cart-op">
				<div class="right btn btn-submit" id="js-order-submit">提交订单</div>
				<div class="right tip total-tip">
					<p>总价：<span class="sum js-sum"><i class="fa fa-rmb"></i>${sum}</span></p>
					<p>已享受会员折扣：<span id="js-discount">- <i class="fa fa-rmb"></i>${discount}</span></p>
				</div>
				<a class="back right" href="<%=request.getContextPath()%>/cart"><i class="fa fa-mail-reply"></i>返回购物车</a>
				<div class="clear-fix"></div>
			</div>
			<div class="clear-fix"></div>
		</div>
	</div>
	<div class="modal common-modal cart-modal" id="confirm-modal" style="display:none">
		<a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
		<div class="modal-content">
			<p>您确定要提交订单吗？</p>
			<p>共计<span class="highlight js-sum"><i class="fa fa-rmb"></i>${sum}</span></p>
		</div>
		<div class="modal-ops">
			<a class="btn" href="#close" rel="modal:close" class="modal-close">再看一眼</a>
			<a class="btn" id="js-order-modal-submit" href="javascript:void(0)">确定！</a>
		</div>
	</div>
	<div class="modal common-modal msg-modal" id="charge-msg-modal" style="display:none">
		<a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
		<div class="modal-content"></div>
	</div>
	<div class="modal common-modal select-address-modal" id="select-address-modal" style="display:none">
		<a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
		<div class="modal-title">选择收货地址</div>
		<div class="modal-content">
			<ul class="address-list">
			<c:forEach items="${addressList}" var="addr">
				<li>
					<input type="radio" name="address">
					<label>收货人：</label><span class="">${addr.receiver}</span>
					<label>收货地址：</label><span class="">${addr.address}</span>
					<label>联系电话：</label><span class="">${addr.tel}</span>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/address_modal.jsp"></jsp:include>
	<div class="toaster" style="display:none"></div>
	<script src="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/order.js"></script>
</body>
</html>