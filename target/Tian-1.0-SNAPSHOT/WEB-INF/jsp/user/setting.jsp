<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>个人设置 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/jsp/common/left_nav.jsp"></jsp:include>
		<div class="right main">
		<div class="panel user-setting-panel">
			<ul class="tab-list">
				<li class="tab-item active">个人信息</li>
				<li class="tab-item">头像设置</li>
				<li class="tab-item">修改密码</li>
			</ul>
			<div class="separator"></div>
			<div class="tab-panel user-info-setting">
				<form class="user-setting-form" id="js-user-setting-form">
					<div class="form-group">
						<label class="label">用户昵称：</label>
						<input type="text" required value="${user.nickname}" name="nickname">
						<span class="required">*</span>
					</div>
					<div class="form-group">
						<label class="label">手机号：</label>
						<input type="text" required value="${user.tel}" name="tel" disabled>
						<span class="required">*</span>
						<p class="form-tip">手机号将作为用户账号用于登录验证，暂时不支持更改</p>
					</div>
					<div class="form-group">
						<label class="label">真实姓名：</label>
						<input type="text" required value="${user.name}" name="name">
						<span class="required">*</span>
						<p class="form-tip">请提交您的真实姓名以确保订单能正确送到您手中</p>
					</div>
					<div class="form-group">
						<label class="label">性别：</label>
						<c:choose>
							<c:when test="${user.sex==1}">
								<input type="radio" name="sex" value="1" checked> 男
								<input type="radio" name="sex" value="0"> 女
							</c:when>
							<c:otherwise>
								<input type="radio" name="sex" value="1"> 男
								<input type="radio" name="sex" value="0" checked> 女
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<label class="label">生日：</label>
						<input type="date" value="${user.birth}" name="birth">
						<span class="required">*</span>
					</div>
					<div class="form-group">
						<label class="label">地址：</label>
						<input class="address" type="text" required value="${user.address}" name="address">
						<span class="required">*</span>
						<p class="form-tip">请详细填写您的地址（精确到门牌号）以确保订单能正确送到您手中</p>
					</div>
					<div class="form-group">
						<label class="label">邮箱：</label>
						<input class="email" type="email" value="${user.email}" name="email">
						<p class="form-tip">我们将通过邮箱向您推送上市新品或最近优惠活动</p>
					</div>
					<button class="btn btn-submit" type="button" id="js-setting-submit">保存修改</button>
				</form>
			</div>
			<div class="tab-panel user-avatar-setting" style="display:none">
            <c:choose>
                <c:when test="${user.avatar}">
                <img class="avatar" id="js-avatar" src="${user.avatar}" alt="${user.nickname}">
                </c:when>
                <c:otherwise>
                <img class="avatar" id="js-avatar" src="/DessertHouse/img/avatar.jpg" alt="${user.nickname}">
                </c:otherwise>
                </c:choose>
				<form enctype="multipart/form-data" method="post" name="avatar" id="js-avatar-form">
					<input type="file" name="avatar" id="js-avatar-upload" style="display: none;" onchange="showAvatar()">
				</form>
				<a class="avatar-upload" onclick="document.getElementById('js-avatar-upload').click()">上传头像</a>
				<p class="form-tip">支持.jpg, png, gif格式</p>
				<div class="btn btn-avatar-save" id="js-avatar-submit">保存修改</div>
			</div>
			<div class="tab-panel user-pwd-setting" style="display:none">
				<form class="user-pwd-form" id="js-user-pwd-form">
					<div class="form-group">
						<label class="label">原始密码：</label>
						<input type="password" required name="password">
						<span class="required">*</span>
					</div>
					<div class="form-group">
						<label class="label">新密码：</label>
						<input type="password" required name="newpwd">
						<span class="required">*</span>
						<p class="form-tip">请输入6-16位数字或字母，区分大小写</p>
					</div>
					<div class="form-group">
						<label class="label">新密码确认：</label>
						<input type="password" required name="confirm">
						<span class="required">*</span>
					</div>
					<button class="btn btn-submit" type="button" id="js-password-submit">保存修改</button>
				</form>
			</div>
		</div>
		</div>
		<div class="clear-fix"></div>
	</div>
	<div class="toaster" style="display:none"></div>
	<script src="<%=request.getContextPath() %>/js/setting.js"></script>
</body>
</html>