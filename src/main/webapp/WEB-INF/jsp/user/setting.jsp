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
		<div class="panel m-user-panel user-setting-panel">
			<ul class="tab-list">
				<li class="tab-item active">个人信息</li>
				<li class="tab-item">收货地址</li>
				<li class="tab-item">修改密码</li>
			</ul>
			<div class="separator"></div>
			<div class="tab-panel user-info-setting">
				<div class="user-avatar-setting">
					<label class="label left">当前头像：</label>
	            	<c:choose>
		                <c:when test="${user.avatar != ''}">
		                <img class="avatar left" id="js-avatar" src="${user.avatar}" alt="${user.nickname}">
		                </c:when>
		                <c:otherwise>
		                <img class="avatar left" id="js-avatar" src="<%=request.getContextPath()%>/img/avatar.jpg" alt="${user.nickname}">
		                </c:otherwise>
	                </c:choose>
	                <div class="left operation">
						<form enctype="multipart/form-data" method="post" name="avatar" id="js-avatar-form">
							<input type="file" name="avatar" id="js-avatar-upload" style="display: none;" onchange="showAvatar()">
						</form>
						<a class="avatar-upload" onclick="document.getElementById('js-avatar-upload').click()">上传图片</a>
						<p class="form-tip">支持.jpg, png, gif格式</p>
						<!-- <div class="btn btn-avatar-save" id="js-avatar-submit">修改头像</div> -->
					</div>
					<div class="clear-fix"></div>
				</div>
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
					<button class="btn btn-submit" type="button" id="js-setting-submit">保存修改</button>
				</form>
			</div>
			<div class="tab-panel user-account-setting">
				<div class="user-address-setting">
					<label class="label left">地址列表：</label>
					<button class="btn left">新增收货地址</button>
					<div class="clear-fix"></div>
					<ul class="address-list">
						<c:if test="${defaultAddress != null}">
							<li class="address-item default" aid="${defaultAddress.id}">
								<a class="right operation" href="javascript:void(0)"><i class="fa fa-close"></i>删除</a>
								<a class="right operation" href="javascript:void(0)"><i class="fa fa-pencil"></i>修改</a>
								<div class="address-detail">
									<div class="address-detail-item">
										<label class="label">收货人：</label>
										<div class="left">${defaultAddress.receiver}</div>
										<div class="clear-fix"></div>
									</div>
									<div class="address-detail-item">
										<label class="label">地址：</label>
										<div class="left">${defaultAddress.address}</div>
										<div class="clear-fix"></div>
									</div>
									<div class="address-detail-item">
										<label class="label">电话：</label>
										<div class="left">${defaultAddress.tel}</div>
										<div class="clear-fix"></div>
									</div>
								</div>
								<div class="default-tag">默认地址</div>
								<div class="clear-fix"></div>
							</li>
						</c:if>
						<c:forEach items="${addrList}" var="addr">
						<li class="address-item" aid="${addr.id}">
							<a class="right operation" href="javascript:void(0)"><i class="fa fa-close"></i>删除</a>
							<a class="right operation" href="javascript:void(0)"><i class="fa fa-pencil"></i>修改</a>
							<div class="address-detail">
								<div class="address-detail-item">
									<label class="label">收货人：</label>
									<div class="left">${addr.receiver}</div>
									<div class="clear-fix"></div>
								</div>
								<div class="address-detail-item">
									<label class="label">地址：</label>
									<div class="left">${addr.address}</div>
									<div class="clear-fix"></div>
								</div>
								<div class="address-detail-item">
									<label class="label">电话：</label>
									<div class="left">${addr.tel}</div>
									<div class="clear-fix"></div>
								</div>
							</div>
							<div class="default-tag" hidden>默认地址</div>
							<div class="clear-fix"></div>
						</li>
						</c:forEach>
					</ul>
				</div>
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