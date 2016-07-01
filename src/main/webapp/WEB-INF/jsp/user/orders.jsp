<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.css" type="text/css" media="screen" />
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>我的订单 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/jsp/common/left_nav.jsp"></jsp:include>
		<div class="right main">
		<div class="panel m-user-panel order-panel">
			<!-- ul class="tab-list">
				<li class="tab-item active">待完成订单</li>
				<li class="tab-item">已完成订单</li>
			</ul -->
            <div class="panel-title">我的订单</div>
			<div class="separator"></div>
			<div class="tab-panel finished-order">
				<ul class="order-list-head">
					<li class="cell o-detail">订单列表</li>
					<li class="cell o-sum">金额</li>
					<li class="cell o-date">预订日期</li>
					<li class="cell o-state">状态</li>
					<li class="clear-fix"></li>
				</ul>
				<div class="order-list" id="js-order-list">
                    <c:forEach items="${orders}" var="o">
                    <div class="order-item">
                        <ul class="order-basic">
                        	<li class="date">${o.date}</li>
                            <li class="order-number"><label>订单号：</label>${o.id}</li>
                            <li class="store"><label>店铺：</label>
                                <a class="name" href="<%=request.getContextPath() %>/store/${o.store.id}">${o.store.name}</a></li>
                        </ul>
                        <div class="order-detail">
                            <div class="cell o-detail">
                            <c:forEach items="${o.items}" var="d">
                                <ul class="order-dessert-list">
                                    <li class="cell l-name"><a class="name" 
                                    href="<%=request.getContextPath() %>/dessert/d/${d.dessertId}">${d.name}</a></li>
                                    <li class="cell l-quantity">x${d.quantity}</li>
                                    <li class="cell l-price">${d.price}</li>
                                    <li class="clear-fix"></li>
                                </ul>
                            </c:forEach>
                            </div>
                            <div class="cell o-sum"><i class="fa fa-rmb"></i>${o.total}</div>
                            <div class="cell o-date">${o.sendDate}</div>
                            <div class="cell o-state">${o.state}</div>
                            <div class="clear-fix"></div>
                        </div>
                        <c:if test="${o.type==1}">
                        <div class="order-bottom">
                            <div class="address left">
                                <c:if test="${o.sendType==0}">
                                    <span><label>收货人：</label>${o.address.receiver}</span>
                                    <span><label>联系电话：</label>${o.address.tel}</span>
                                    <span class="addr"><label>收货地址：</label>${o.address.address}</span>
                                </c:if>
                                <c:if test="${o.sendType==1}">
                                    <span><label>自提</label></span><br/><br/>
                                </c:if>
                            </div><div class="ops right">
                            <c:if test="${o.state!='已完成' && o.state!='已退订'}">
                                <button class="btn btn-sm btn-cancel right" onclick="showCancelModal(this)" oid="${o.id}">退订</button>
                            </c:if>
                            <button class="btn btn-sm right js-btn-one-more" onclick="showOneMoreModal(this)" oid="${o.id}"
                            	price="${o.total}">再来一单</button>
                        </div>
                        </c:if>
                        	<div class="clear-fix"></div>
                        </div>
                    </div>
                    </c:forEach>
				</div>
			</div>
			<div class="tab-panel unfinished-order">
			</div>
            <ul class="table-pagination">
                <li class="left pre" id="js-order-pre"><i class="fa fa-angle-left"></i></li>
                <li class="left current" id="js-order-current" max="${max}" page="${current}">${current}</li>
                <li class="right next" id="js-order-next"><i class="fa fa-angle-right"></i></li>
                <div class="clear-fix"></div>
            </ul>
		</div>
		</div>
        <div class="clear-fix"></div>
	</div>
    <div class="modal common-modal one-more-modal" id="one-more-modal" style="display:none">
        <a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
        <div class="modal-title">再来一单</div>
        <div class="modal-content">
        	<div>请选择预定日期和取货方式：</div>
        	<div class="option"><label>日 期：</label>
				<input id="js-date" type="date">
			</div>
			<div class="option"><label>取货方式：</label>
				<input type="radio" name="pick-type" value="0" checked><label class="radio-label">送货上门</label>
				<input type="radio" name="pick-type" value="1"><label class="radio-label">自提</label>
			</div>
			<div class="option">
				<label>支付总额：</label><span id="js-one-more-price"></span>
			</div>
        </div>
        <div class="modal-ops">
			<a class="btn" href="#close" rel="modal:close" class="modal-close">取消</a>
			<a class="btn" id="js-order-one-more-submit" href="javascript:void(0)" onclick="oneMoreOrder(this)">确定</a>
		</div>
    </div>
    <div class="modal common-modal cart-modal" id="cancel-modal" style="display:none">
        <a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
        <div class="modal-content">您确定要退订吗？</div>
        <div class="modal-ops">
			<a class="btn" href="#close" rel="modal:close" class="modal-close">取消</a>
			<a class="btn" id="js-order-cancel-submit" href="javascript:void(0)" onclick="cancelOrder(this)">确定</a>
		</div>
    </div>
    <div class="toaster" style="display:none"></div>
    <script src="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/js/order-list.js"></script>
</body>