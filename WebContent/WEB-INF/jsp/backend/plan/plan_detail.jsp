<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  Integer role = (Integer)request.getSession().getAttribute("role"); %>
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
	        <li>
            <%
                if(role == 1){
                    out.print("<a href='" + request.getContextPath() + "/manage'>");
                } else {
                    out.print("<a href='" + request.getContextPath() + "/plan'>");
                }
            %>
            <span class="icon glyphicon glyphicon-th-list"></span>产品计划列表</a></li>
	        <li class="active">查看计划</li>
	    </ol>
	    <div class="view-plan-title js-plan-title">
            <label>计划编号：<span id="js-id">${plan.id}</span></label>
	        <label>店面：<span id="js-store">${plan.storeName}</span></label>
	        <label>日期：<span id="js-date">${plan.date}</span></label>
            <c:choose>
            <c:when test="${plan.state==2}"> 
                <label>状态：<span class="highlight" id="js-state" value="${plan.state}">${plan.stateStr}</span></label>
                <c:choose>
                <c:when test="${role == 1}">
                    <button class='right btn btn-primary' id='js-pass-plan'>批准计划</button>
                </c:when>
                <c:otherwise>
                    <a href='" + request.getContextPath() + "/plan/modify/${plan.id}'><button class='right btn btn-default'>修改计划</button></a>         
                </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${plan.state==0}"> 
                <label>状态：<span id="js-state" value="${plan.state}">${plan.stateStr}</span></label>
                <c:if test="${role == 1}">
                    <button class='right btn btn-default' id='js-reject-plan'>否决计划</button> 
                    <button class='right btn btn-primary' id='js-pass-plan'>批准计划</button> 
                </c:if>         
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
	                <th data-field="id">商品编号</th>
	                <th data-field="name">名称</th>
	                <th data-field="quantity" data-editable="true">计划数量</th>
	                <th data-field="price" data-editable="true">单价</th>
	            </tr>
	            </thead>
	            <tbody>
	            <c:forEach items="${items}" var="i">
	                <tr>
	                    <td>${i.dessertId}</td>
	                    <td>${i.dessertName}</td>
	                    <td>${i.quantity}</td>
	                    <td>${i.price}</td>
	                </tr>
	            </c:forEach>
	            </tbody>
	        </table>
	    </div>
        <c:if test="${pre>0}">
            <a class="left btn btn-default" href="<%=request.getContextPath()%>/plan/view/${pre}">上一条</a>
        </c:if>
        <c:if test="${next>0}">
            <a class="right btn btn-default" href="<%=request.getContextPath()%>/plan/view/${next}">下一条</a>
        </c:if>
	</div>
    <div class="toaster" style="display:none"></div>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-editable.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/plan-detail.js"></script>
</body>
</html>