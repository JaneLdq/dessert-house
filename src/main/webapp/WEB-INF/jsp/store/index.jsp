<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int num = 0; %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>循迹 · 店 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<!-- <div class="store-intro">这里放点小软文~</div>-->
		<div class="panel store-panel">
			<c:forEach items="${stores}" var="store">
				<% 	if(num % 2 == 0){
						out.print("<div class='row'>");
					} 
				%>
				<div class="col col-lg store-card">
					<a class="store-img" href="<%=request.getContextPath()%>/store/${store.id}">
					<img src="<%=request.getContextPath() %>/img/store/${store.id}.jpg" alt="${store.name}"></a>
					<div class="store-desc">
						<a class="store-name" href="<%=request.getContextPath()%>/store/${store.id}">${store.name}</a>
						<p><i class="fa fa-phone"></i>${store.tel}</p>
						<p><i class="fa fa-map-marker"></i>${store.address}</p>
					</div>
				</div>
				<% 	
					if(num % 2 == 1){
						out.print("</div>");
					}
					num++;
				%>
			</c:forEach>
		</div>
	</div>
</body>
</html>