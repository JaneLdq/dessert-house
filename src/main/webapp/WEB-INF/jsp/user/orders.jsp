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
					<li class="cell o-detail">订单详情</li>
					<li class="cell o-sum">金额</li>
					<li class="cell o-date">预定日期</li>
					<li class="cell o-state">状态</li>
					<li class="clear-fix"></li>
				</ul>
				<div class="order-list">
                    <c:forEach items="${orders}" var="o">
                    <div class="order-item">
                        <ul class="order-basic">
                            <li class="time">${o.date} </li>
                            <li class="order-number"><label>订单号：</label>${o.id}</li>
                            <li class="store"><label>店铺：</label>${o.storeId}</li>
                            <li class="btn btn-sm js-btn-one-more" >再来一单</li>
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
                            <div class="cell o-state">-</div>
                            <div class="clear-fix"></div>
                        </div>
                    </div>
                    </c:forEach>
				</div>
			</div>
			<div class="tab-panel unfinished-order">
			</div>
            <!-- 
                <ul class="table-pagination">
                    <li class="left pre" id="js-payment-pre""><i class="fa fa-angle-left"></i></li>
                    <li class="left current" id="js-payment-current" max="${max}" page="${current}">${current}</li>  
                    <li class="right next" id="js-payment-next"><i class="fa fa-angle-right"></i></li> 
                    <div class="clear-fix"></div>
                </ul>-->
		</div>
		</div>
        <div class="clear-fix"></div>
	</div>
    <div class="modal common-modal msg-modal" id="one-more-modal" style="display:none">
        <a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
        <div class="modal-content">再来一单提交成功!</div>
    </div>
    <div class="toaster" style="display:none"></div>
    <script src="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/js/order.js"></script>
</body>