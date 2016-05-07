<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>缴费记录 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/jsp/common/left_nav.jsp"></jsp:include>
		<div class="right main">
			<div class="panel">
				<div class="panel-title">我的缴费记录</div>
				<div class="separator"></div>
				<div class="payment-info">
					会员卡余额：<span class="highlight"><i class="fa fa-rmb"></i>${member.balance}</span>
					<c:if test="${member.state !=3}">
                        <a class="" href="<%= request.getContextPath()%>/user/charge">充值</a>
                    </c:if>
				</div>
				<div class="payment-detail">缴费明细</div>
				<div class="payment-record">
					<table class="table" border=1  id="js-payment-record">
						<tr class="table-head">
							<th class="date">日期</th>
							<th class="value">金额（元）</th>
						</tr>
						<c:forEach items="${payments}" var="p">
							<tr class="table-row">
							<td class="date">${p.created_at}</td>
							<td class="budget">${p.value}</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<ul class="table-pagination">
		   			<li class="left pre" id="js-payment-pre""><i class="fa fa-angle-left"></i></li>
		   			<li class="left current" id="js-payment-current" max="${max}" page="${current}">${current}</li>  
					<li class="right next" id="js-payment-next"><i class="fa fa-angle-right"></i></li> 
		   			<div class="clear-fix"></div>
				</ul>
			</div>
		</div>
		<div class="clear-fix"></div>
	</div>
	<script src="<%=request.getContextPath()%>/js/payment.js"></script>
</body>