<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-editable.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>查看产品计划 - 恬</title>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>
    <div class="wrapper">
	    <ol class="breadcrumb">
	        <li><a href="<%=request.getContextPath()%>/plan">
            <span class="icon glyphicon glyphicon-th-list"></span>产品计划列表</a></li>
	        <li class="active">修改计划</li>
	    </ol>
	    <div class="view-plan-title js-plan-title">
            <label>计划编号：<span id="js-id">${plan.id}</span></label>
	        <label>店面：<span id="js-store">${plan.storeName}</span></label>
	        <label>日期：<span id="js-date">${plan.date}</span></label>
            <c:choose>
            <c:when test="${plan.state==2 }"> 
                <label>状态：<span class="highlight" id="js-state" value="${plan.state}">${plan.stateStr}</span></label>
            </c:when>
            <c:otherwise>            
                <label>状态：<span id="js-state" value="${plan.state}">${plan.stateStr}</span></label>
            </c:otherwise>
            </c:choose>
	    </div>
	    <div class="view-plan-panel js-plan-detail-panel">
	        <table class="editable js-plan-detail-table" 
	            data-toggle="table" 
	            data-classes="table table-no-bordered"
	            data-height="400" id="table-${i}">
	            <thead>
	            <tr>
                    <th data-field="id">#</th>
	                <th data-field="dessertId">商品编号</th>
	                <th data-field="name">名称</th>
	                <th data-field="quantity" data-editable="true">计划数量</th>
	                <th data-field="price" data-editable="true">单价</th>
	            </tr>
	            </thead>
	            <tbody>
	            <c:forEach items="${items}" var="i">
	                <tr>
                        <td>${i.id}</td>
	                    <td>${i.dessertId}</td>
	                    <td>${i.dessertName}</td>
	                    <td><input type="number" value="${i.quantity}"></td>
	                    <td><input type="number" value="${i.price}"></td>
	                </tr>
	            </c:forEach>
	            </tbody>
	        </table>
            <button class="right plan-submit btn btn-primary" id="js-plan-modify-submit">保存修改</button>
            <button class="right btn btn-defautl">取消</button>
	    </div>
	</div>
    <div class="toaster" style="display:none"></div>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-editable.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/plan-modify.js"></script>
</body>
</html>