<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String url = request.getRequestURI();
%>
<nav class="nav-bar">
	<div class="nav-panel <%
		if(!url.contains("/admin/")){
			out.print(" fluid");
		}	
	%>">
		<ul class="nav nav-pills">
			<li role="presentation"><a href="#">恬</a></li>
			<c:choose>
				<c:when test="${role == 0}">
					<li role="presentation" class="<%
			  			if(url.contains("/admin/index")){
							out.print("active");
						}
			  		%>"><a href="<%=request.getContextPath()%>/admin">店面管理</a></li>
			  		<li role="presentation" class="<%
			  			if(url.contains("/admin/staff")){
							out.print("active");
						}
			  		%>"><a href="<%=request.getContextPath()%>/admin/staff">店员管理</a></li>
				</c:when>
				<c:when test="${role == 1 }">
					<li role="presentation" class="<%
			  			if(url.contains("/manage/index")){
							out.print("active");
						}
			  		%>"><a href="<%=request.getContextPath()%>/manage">计划审批</a></li>
			  		<li role="presentation" class="<%
			  			if(url.contains("/manage/stats")){
							out.print("active");
						}
			  		%>"><a href="<%=request.getContextPath()%>/manage/stats">统计分析</a></li>
                    <li role="presentation" class="<%
                        if(url.contains("/sale/member")){
                            out.print("active");
                        }
                    %>"><a href="<%=request.getContextPath()%>/manage/member">会员信息</a></li>
				</c:when>
				<c:when test="${role == 2 }">
					<li role="presentation" class="<%
			  			if(url.contains("/plan/index")){
							out.print("active");
						}
			  		%>"><a href="<%=request.getContextPath()%>/plan">产品计划列表</a></li>
			  		<li role="presentation" class="<%
			  			if(url.contains("/plan/create")){
							out.print("active");
						}
			  		%>"><a href="<%=request.getContextPath()%>/plan/create">新建产品计划</a></li>
				</c:when>
				<c:otherwise>
					<li role="presentation" class="<%
		  				if(url.contains("/sale/index")){
							out.print("active");
						}
		  			%>"><a href="<%=request.getContextPath()%>/sale">销售</a></li>
                    <li role="presentation" class="<%
                        if(url.contains("/sale/order")){
                            out.print("active");
                        }
                    %>"><a href="<%=request.getContextPath()%>/sale/order">订单</a></li>
		  			<li role="presentation" class="<%
		  				if(url.contains("/sale/member")){
							out.print("active");
						}
		  			%>"><a href="<%=request.getContextPath()%>/sale/member">会员</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<div class="right-nav-items">
		<%
			if(request.getSession().getAttribute("hasLogin") != null){
				out.print("<ul class='nav nav-pills'>"
					+ "<li role='presentation'>"
					+ "<a href='" + request.getContextPath() + "/auth/logout'>退出登录</a></li>"
			  		+ "</ul>");
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