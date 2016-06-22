<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>办理会员 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<div class="reg-panel panel-lg">
			<p>亲爱的<span class="reg-user-name">${nickname}</span>，恭喜你成为·恬·注册会员！</p>
			<p>为了方便您的网上购物体验，请您仔细阅读我们的<a href="javascript:void(0)">用户协议</a>并填写您的详细信息，预祝您购物愉快！</p>
			<form id="js-member-form" action="<c:url value="/auth/regmember"/>" method="POST">
				<div class="form-group">
					<label class="label">真实姓名：</label>
					<input type="text" name="name" required>
					<span class="required">*</span>
					<div class="msg error" id="js-name-msg" style="display: none"></div>
					<p class="form-tip">请提交您的真实姓名以确保订单能正确送到您手中</p>
				</div>
				<div class="form-group">
					<label class="label">地址：</label>
					<input class="input-lg" type="text" name="address" required>
					<span class="required">*</span>
					<div class="msg error" id="js-address-msg" style="display: none"></div>
					<p class="form-tip">请详细填写您的地址（精确到门牌号）以确保订单能正确送到您手中</p>
				</div>
				<div class="form-group">
					<label class="label">银行卡：</label>
					<input style="display:none">
					<input class="input-lg" type="text" name="bankcard" required autocomplete="off">
					<span class="required">*</span>
					<div class="msg error" id="js-bankcard-msg" style="display: none"></div>
					<p class="form-tip">用户绑定会员卡充值操作</p>
				</div>
				<div class="form-group">
					<label class="label">支付密码：</label>
					<input style="display:none">
					<input class="password" name="paypassword" type="password" required autocomplete="off">
                    <span class="required">*</span>
                    <div class="msg error" id="js-payword-msg" style="display: none"></div>
					<p class="form-tip">6位数字，会员卡激活或充值前需进行支付验证</p>
				</div>
				<button class="btn" type="button" id="js-submit">完善会员信息</button>
				<button class="jump-link" type="submit">跳过，以后再说</button>
			</form>
		</div>
	</div>
	
	<script src="<%=request.getContextPath()%>/js/member.js"></script>
</body>
</html>