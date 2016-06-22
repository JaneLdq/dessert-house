<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>会员注册 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
	<div class="reg-panel">
		<div>
			<h2 class="reg-title">会员注册</h2>
		</div>
		<form action="<c:url value="/auth/regform"/>" method="POST" id="js-reg-form">
			<div class="form-group">
				<label class="label">手机号：</label>
				<input type="text" name="tel" required autocomplete="off">
				<span class="required">*</span>
				<c:choose>
					<c:when test="${result==-1}">
						<div class="msg error" id="js-tel-msg">该手机号已被注册！</div>
					</c:when>
					<c:otherwise>
						<div class="msg error" id="js-tel-msg" style="display: none"></div>
					</c:otherwise>
				</c:choose>
				<p class="form-tip">手机号将作为用户账号用于登录验证</p>
			</div>
			<div class="form-group">
				<label class='label'>密码：</label>
				<input type="password" name="password" required autocomplete="off">
				<span class="required">*</span>
				<div class="msg error" id="js-psw-msg" style="display: none"></div>
				<p class="form-tip">6-16位数字或字母，区分大小写</p>
			</div>
			<div class="form-group">
				<label class="label">用户昵称：</label>
				<input type="text" name="nickname" required>
				<span class="required">*</span>
				<div class="msg error" id="js-nickname-msg" style="display: none"></div>
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
			<button class="btn" type="button" id="js-submit">注册</button>
		</form>
	</div>
	</div>
	<script src="<%=request.getContextPath() %>/js/register.js"></script>
</body>
</html>