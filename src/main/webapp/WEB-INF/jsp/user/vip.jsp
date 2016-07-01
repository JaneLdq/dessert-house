<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>我的会员卡 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/jsp/common/left_nav.jsp"></jsp:include>
		<div class="right main">
		<div class="panel m-user-panel vip-panel">
			<div class="panel-title">我的会员卡</div>
			<div class="separator"></div>
			<div class="section">
				<div class="sub-title">基本信息</div>
				<div class="sub-content">
					<ul class="info-list vip-info">
						<li><label>会员卡号：</label><span class="value"> ${member.mid}</span></li>
						<li><label>状态：</label><span class="value" value="${member.state}">
							<c:choose>
								<c:when test="${member.state==0 }">未激活</c:when>
								<c:when test="${member.state==1 }">已激活</c:when>
								<c:when test="${member.state==2 }">已暂停</c:when>
								<c:otherwise>停止作废</c:otherwise>
							</c:choose></span>
							<c:choose>
								<c:when test="${member.state==0 }">
							 		<a class="btn btn-sm vip-btn" href="<%=request.getContextPath()%>/user/charge">立即激活</a>
							 	</c:when>
								<c:when test="${member.state==2 }">
									<a href="<%=request.getContextPath()%>/user/charge">充值恢复</a>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							</li>
						<li><label>等级：</label><span class="value"> ${member.level}</span></li>
						<li><label>余额：</label><span class="value"> ${member.balance}</span>
                            <c:if test="${member.state != 3}">
							     <a class="btn btn-sm vip-btn" href="<%=request.getContextPath()%>/user/charge">充  值</a>
                            </c:if>
                            </li>
						<li><label>积分：</label><span class="value"> ${member.point}</span></li>
						<li><label>激活日期：</label><span class="value"> ${member.active_time}</span></li>
						<li><label>有效期至：</label><span class="value"> ${member.validity}</span></li>
					</ul>
				</div>
				<div class="clear-fix"></div>
			</div>
			<div class="section">
				<div class="sub-title">银行账号</div>
				<div class="sub-content">
					<ul class="info-list">
						<li><label>银行卡号：</label><span class="value" id="js-bank-id">${member.bank_card}</span></li>
					</ul>
				</div>
				<div class="clear-fix"></div>
			</div>
			<!-- 
			<div class="section">
				<div class="sub-title">其他操作</div>
				<div class="sub-content">
					<ul class="info-list">
                        <c:choose>
                        <c:when test="${member.state != 3}">
						    <li><a class="gray" href="javascript:void(0)" id="js-cancel">取消会员</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="gray" href="<%=request.getContextPath() %>/user/newcard">办理新会员卡</a></li>
                        </c:otherwise>
                        </c:choose>
					</ul>
				</div>
				<div class="clear-fix"></div>
			</div>
			-->
		</div>
		</div>
		<div class="clear-fix"></div>
	</div>
	<script src="<%=request.getContextPath() %>/js/user-info.js"></script>
</body>
</html>