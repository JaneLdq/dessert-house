<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String urlStr = request.getRequestURI();
%>
<div class="left sider">
	<div class="user-info">
		<a href="<%=request.getContextPath()%>/user/setting">
            <c:choose>
                <c:when test="${user.avatar}">
                    <img class="avatar js-left-info-avatar" src="${user.avatar}" alt="avator">
                </c:when>
                <c:otherwise>
                    <img class="avatar js-left-info-avatar" src="/DessertHouse/img/avatar.jpg" alt="avator">
                </c:otherwise>
            </c:choose>
        </a>
		<a class="nickname js-left-info-nickname" href="<%=request.getContextPath()%>/user/setting">${user.nickname}</a>
		<div class="account">
			<c:choose>
				<c:when test="${member.state == 0}">
					<div class="lock" id="js-lock">
						<a href="<%=request.getContextPath()%>/user/charge" ><i class="fa fa-lock left lock-icon"></i>未激活</a>
					</div>
				</c:when>
				<c:when test="${member.state == 2}">
					<div class="lock" id="js-lock">
						<a href="<%=request.getContextPath()%>/user/charge" ><i class="fa fa-lock left lock-icon"></i>已暂停</a>
					</div>
				</c:when>
				<c:when test="${member.state == 3}">
					<div class="lock" id="js-lock">
						<a href="<%=request.getContextPath()%>/user/newcard" ><i class="fa fa-lock left lock-icon"></i>已停止</a>
					</div>
				</c:when>
			</c:choose>
			<ul class="account-info">
				<li><label>会员卡：</label>${member.mid}</li>
				<li><label>等级：</label><span id="js-info-level">${member.level}</span></li>
				<li><label>余额：</label><span id="js-info-balance">${member.balance}</span></li>
				<li><label>积分：</label><span id="js-info-point">${member.point}</span></li>
				<li><label>有效期至：</label><span id="js-info-validity">${member.validity}</span></li>
			</ul>
		</div>
	</div>
	<div class="left-nav user-left-nav">
		<div class="left-nav-items">
			<a class="left-nav-item left 
			<% 
				if(urlStr.contains("/user/vip")){
					out.print("active");
				}
			%>" href="<%=request.getContextPath() %>/user/vip">我的会员卡</a>
			<a class="left-nav-item left 
			<% 
				if(urlStr.contains("/user/orders")){
					out.print("active");
				}
			%>" href="<%=request.getContextPath() %>/user/orders">我的订单</a>
			<a class="left-nav-item left  
			<% 
				if(urlStr.contains("/user/points")){
					out.print("active");
				}
			%>" href="<%=request.getContextPath() %>/user/points">我的积分记录</a>
			<a class="left-nav-item left 
			<% 
				if(urlStr.contains("/user/payments")){
					out.print("active");
				}
			%>" href="<%=request.getContextPath() %>/user/payments">我的缴费记录</a>
			<a class="clear-fix"></a>
		</div>
	</div>
</div>