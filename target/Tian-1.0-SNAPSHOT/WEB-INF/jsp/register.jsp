<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>用户注册 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
	<div class="reg-panel">
		<div>
			<h2 class="reg-title">用户注册</h2>
		</div>
		<div class="error-msg" id="js-error-msg" style="display: none">${msg}</div>
		<form action="<c:url value="/auth/regform"/>" method="POST" id="js-reg-form">
			<div class="form-group">
				<label class="label">手机号：</label>
				<input style="display:none">
				<input type="text" name="tel" required autocomplete="off">
				<span class="required">*</span>
				<p class="form-tip">手机号将作为用户账号用于登录验证</p>
			</div>
			<div class="form-group">
				<label class='label'>密码：</label>
				<input style="display:none">
				<input type="password" name="password" required autocomplete="off">
				<span class="required">*</span>
				<p class="form-tip">6-16位数字或字母，区分大小写</p>
			</div>
			<div class="form-group">
				<label class="label">用户昵称：</label>
				<input type="text" name="nickname" required>
				<span class="required">*</span>
			</div>
			<div class="form-group">
				<label class="label">性别：</label>
				<input type="radio" name="sex" value="1" checked> 男
				<input type="radio" name="sex" value="0"> 女
			</div>
			<div class="form-group">
				<label class="label">生日：</label>
				<input type="date" value="1970-01-01" name="birth" required>
			</div>
			<div class="form-group">
				<label class="label">邮箱：</label>
				<input class="input-lg" type="email" name="email">
				<p class="form-tip">我们将通过邮箱向您推送上市新品或最近优惠活动</p>
			</div>
			<button class="btn" type="button" id="js-submit">注册</button>
		</form>
	</div>
	</div>
	<script src="<%=request.getContextPath() %>/js/register.js"></script>
</body>
</html>