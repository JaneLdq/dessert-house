<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>登录 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="login-form login-panel" >
		<div>
			<h2 class="login-title">用户登录</h2>
		</div>
		<div class="error-msg" id="js-error-msg" style="display: none">${msg}</div>
		<form action="<c:url value="/auth/user"/>" method="POST">
			<div class="form-group">
				<label class="label">手机号</label>
				<input type="text" placeholder="请输入手机号" name="id" >
			</div>
			<div class="form-group">
				<label class="label">密码</label>
				<input type="password" placeholder="请输入密码" name="password">
			</div>
			<div class="form-group">
				<a class="right" href="/forgetPassword">忘记密码?</a>
			</div>
			<button class="btn" type="submit" >登录</button>
		</form>
		<a class="reg-link" href="<%=request.getContextPath()%>/auth/reg">没有账号，我要注册！</a>
	</div>
	
	<script>
		$(document).ready(function(){
			var msg = $('#js-error-msg').html();
			if(msg.length > 0){
				$('#js-error-msg').show();
			}
		})
	</script>
</body>
</html>