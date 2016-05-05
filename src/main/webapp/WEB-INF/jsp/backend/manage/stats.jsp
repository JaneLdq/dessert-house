<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>会员统计 - 恬</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>  
<div class="wrapper-fluid">
    <ul class="stat-nav left nav nav-pills nav-stacked">
        <li class="active"><a href="<%=request.getContextPath()%>/manage/stats">会员统计</a></li>
        <li><a href="<%=request.getContextPath()%>/manage/stats/sale">销售详情</a></li>
    </ul>
    <div class="right stat-panel">
        <div class="left" id="js-sex" style="height: 400px; width: 500px"></div>
        <div class="left" id="js-age" style="height: 400px; width: 500px"></div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/plugins/echarts/echarts.common.min.js"></script>
<script src="<%=request.getContextPath()%>/plugins/echarts/macarons.js"></script>
<script src="<%=request.getContextPath()%>/js/stat.js"></script>
</body>
</html>