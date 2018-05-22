<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>统计 - 恬</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>  
<div class="wrapper-fluid">
    <ul class="stat-nav left nav nav-pills nav-stacked">
        <li><a href="<%=request.getContextPath()%>/manage/stats">会员统计</a></li>
        <li class="active"><a href="<%=request.getContextPath()%>/manage/stats/sale">销售详情</a></li>
    </ul>
    <div class="right stat-panel">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#sale" aria-controls="sale" role="tab" data-toggle="tab">销售订单</a></li>
            <li role="presentation"><a href="#book" aria-controls="book" role="tab" data-toggle="tab">预订订单</a></li>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="sale">
                <div class="order-table-panel">
                    <table
                        data-toggle="table"
                        data-unique-id="id"
                        data-pagination="true"
                        data-height="500"
                        data-url="<%=request.getContextPath()%>/sale/getOrders?type=0">
                        <thead>
                        <tr>
                            <th class="col-md-2 col-sm-2"
                                data-field="id"
                                data-valign="middle"
                                data-align="center"
                                data-formatter="detailFormatter"
                                data-events="detailEvents">编号</th>
                            <th class="col-md-3 col-sm-3" data-field="date" data-valign="middle"  data-align="center">时间</th>
                            <th class="col-md-2 col-sm-2" data-field="mid" data-valign="middle"  data-align="center">会员</th>
                            <th class="col-md-2 col-sm-2" data-field="discount" data-valign="middle"  data-align="center">折扣</th>
                            <th class="col-md-3 col-sm-3" data-field="total" data-valign="middle"  data-align="center">成交金额</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="book">
                <div class="order-table-panel">
                    <table
                            data-toggle="table"
                            data-unique-id="id"
                            data-pagination="true"
                            data-height="500"
                            data-url="<%=request.getContextPath()%>/sale/getOrders?type=1">
                        <thead>
                        <tr>
                            <th class="col-md-2 col-sm-2"
                                data-field="id"
                                data-valign="middle"
                                data-align="center"
                                data-formatter="detailFormatter"
                                data-events="detailEvents">编号</th>
                            <th class="col-md-3 col-sm-3" data-field="date" data-valign="middle"  data-align="center">时间</th>
                            <th class="col-md-2 col-sm-2" data-field="mid" data-valign="middle"  data-align="center">会员</th>
                            <th class="col-md-2 col-sm-2" data-field="discount" data-valign="middle"  data-align="center">折扣</th>
                            <th class="col-md-3 col-sm-3" data-field="total" data-valign="middle"  data-align="center">成交金额</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script src="<%=request.getContextPath()%>/plugins/echarts/echarts.common.min.js"></script>
<script src="<%=request.getContextPath()%>/plugins/echarts/macarons.js"></script>
<script src="<%=request.getContextPath()%>/js/stat.js"></script>
<script src="<%=request.getContextPath() %>/js/saleorder.js"></script>
</body>
</html>