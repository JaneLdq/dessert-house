<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>订单 - 恬</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>  
<div class="container wrapper-fluid">
    
    <div class="order-detail-panel">
        <h4>订单详情<span class="right highlight">#<span id="js-order-id">-</span></span></h4>
        <div class="order-detail-title">
            <div class="order-detail-basic">
                        <p>创建时间： <span id="js-order-date">-</span></p>
                        <p>所属店面： <span id="js-order-store">-</span></p>
                        <p>会员ID： <span id="js-order-mid">-</span> 会员姓名：<span id="js-order-member-name">-</span></p>
                        <p>成交金额： <span id="js-order-total">-</span> 折扣：<span id="js-order-discount">-</span></p>
            </div>
            <div class="order-detail-items">
            	<label>商品列表</label>
                <table data-toggle="table" data-height="300" id="js-order-detail-table">
                	<thead>
                    	<tr>
                        	<th data-field="dessertId" >编号</th>
                            <th data-field="name">商品名</th>
                        	<th data-field="quantity" data-align="center">数量</th>
                        	<th data-field="price" data-align="center">单价</th>
                        </tr>
                 	</thead>
                 </table>
             </div>
        </div>
    </div>
    <div class="order-tab-panel">
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
                    data-url="/DessertHouse/sale/getOrders?type=0">
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
                    data-url="/DessertHouse/sale/getOrders?type=1">
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
    <div class="toaster" style="display: none"></div>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    <script src="<%=request.getContextPath() %>/js/saleorder.js"></script>
</body>
</html>