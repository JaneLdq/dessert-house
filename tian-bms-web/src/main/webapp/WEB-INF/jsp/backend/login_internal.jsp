<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>登录 - 恬</title>
</head>
<body>
	<nav class="nav-bar">
		<div class="nav-panel">
			<ul class="nav nav-pills">
				<li role="presentation"><a href="#">恬</a></li>
			</ul>
			<div class="right-nav-items">
				<ul class='nav nav-pills'><li role='presentation'><a href='<%=request.getContextPath()%>/auth'>用户登录</a></li></ul>			
			</div>
		</div>
	</nav>
	<div class="login-form" >
		<div>
			<h2 class="login-title">员工登录</h2>
		</div>
		<div class="error-msg" id="js-error-msg" style="display: none">${msg}</div>
		<form action="<c:url value="/auth/internal"/>" method="POST">
			<div class="form-group">
				<label for="id">工号</label>
				<input type="text" class="form-control" placeholder="工号" name="id" id="id">
			</div>
			<div class="form-group">
				<label for="password">密码</label>
				<input type="password" class="form-control" placeholder="请输入密码" name="password" id="password">
			</div>
			<button class="btn btn-primary" type="submit" >登录</button>
		</form>
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