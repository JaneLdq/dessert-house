<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.css" type="text/css" media="screen" />
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>我的积分 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/jsp/common/left_nav.jsp"></jsp:include>
		<div class="right main">
			<div class="panel">
				<div class="panel-title">我的积分</div>
				<div class="separator"></div>
				<div class="point-info">
					当前积分：<span class="highlight" id="js-point">${member.point}</span>
					<a href="#exchange-modal" rel="modal:open">积分兑换</a>
				</div>
				<div class="point-detail">积分明细</div>
				<div class="point-record">
					<table class="table" border=1 id="js-point-record">
						<tr class="table-head">
							<th class="date">日期</th>
							<th class="budget">收入/支出</th>
							<th class="desc">详细说明</th>
						</tr>
						<c:forEach items="${points}" var="p">
							<tr class="table-row">
								<td class="date">${p.created_at }</td>
								<c:choose>
									<c:when test="${p.type==0}">
										<td class="budget plus">+${p.value}</td>
									</c:when>
									<c:otherwise>
										<td class="budget minus">-${p.value}</td>
									</c:otherwise>
								</c:choose>
								<td class="desc">
									<c:choose>
									<c:when test="${p.type==0}">
										购物获得积分
									</c:when>
									<c:otherwise>
										积分兑换
									</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<ul class="table-pagination">
		   			<li class="left pre" id="js-point-pre"><i class="fa fa-angle-left"></i></li>
		   			<li class="left current" id="js-point-current" max="${max}" page="${current}">${current}</li>  
					<li class="right next" id="js-point-next"><i class="fa fa-angle-right"></i></li> 
		   			<div class="clear-fix"></div>
				</ul>
			</div>
		</div>
	</div>
	<div id="exchange-modal" class="modal exchange-modal" style="display: none">
		<a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
		<div class="modal-title">积分兑换</div>
		<div class="modal-content">
			<span>兑换规则：10积分 = 1RMB</span>
			<div class="info">
				<label>当前积分：</label><span class="highlight" id="js-modal-point">${member.point}</span>
				<form>
					<div class="form-group">
						<label>兑换数额：</label>
						<input type="number" id="js-point-input" min="0" max="${member.point}" value="0">
						<span>= <span id="js-point-to-rmb">0</span> RMB</span>
					</div>
					<a class="btn" id="js-exchange-submit">我要兑换</a>
					<div class="clear-fix"></div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal common-modal msg-modal" id="point-msg-modal" style="display:none">
		<a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
		<div class="modal-content">(≧∇≦)ﾉ  兑换成功！</div>
	</div>
	<script src="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/point.js"></script>
</body>