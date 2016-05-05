<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String url = request.getRequestURI();
%>
<nav class="navbar">
	<div class="nav-panel">
		<div class="nav-items">
			<a class="nav-item <% 
				if(url.contains("/jsp/index")){
					out.print("active");
				}
			%>" href="<%=path %>/index">初见</a><a class="nav-item <% 
				if(url.contains("store/index")){
					out.print("active");
				}
			%>" href="<%=path %>/stores">循迹 · 店</a><a class="nav-item <% 
				if(url.contains("dessert/index")){
					out.print("active");
				}
			%>" href="<%=path %>/desserts">品尝 · 食</a>
		</div>
		<div class="right-nav-items">
		<%
			if(request.getSession().getAttribute("isUser") != null){
				out.print("<a class='nav-item nav-item-cart' href='" + path + "/cart'>"
						+ "<i class='cart-msg js-cart-msg'></i>"
						+ "<i class='fa fa-shopping-cart'></i></a>");
				out.print("<a class='nav-item' id='js-user' href='javascript:void(0)'><i class='fa fa-user'></i></a>"
				+ 	"<div class='popup' id='js-user-popup' style='display:none'>"
	        	+	"<a class='item' href='" + path + "/user'><i class='fa fa-user fa-fw'></i> 个人中心</a>"
	            +	"<a class='item' href='" + path + "/user/setting'><i class='fa fa-cog fa-fw'></i> 个人设置</a>"
	    	    +	"<a class='item' href='" + path + "/auth/logout'><i class='fa fa-sign-out fa-fw'>"
	            + 	"</i> 退出账号</a></div>");
				
			}else{
				if(url.contains("login_internal")){
					out.print("<a class='nav-item' href='" + path + "/auth'>用户登录</a>");
				}else if(url.contains("login")){
					out.print("<a class='nav-item' href='" + path + "/auth/internal'>员工登录</a>");
				}else{
					out.print("<a class='nav-item' href='" + path + "/auth'>登录 · 注册</a>");
				}
			}
		%>			
		</div>
	</div>
</nav>