<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>销售 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>	
	<div class="container wrapper-fluid">
        <div class="sale-order-operation">
            <div class="sale-order-info">
                <label>服务员工号：${staff.sid}</label>
                <label>姓名：${staff.name}</label>
                <label id="js-store-id" store-id="${staff.store_id}">所在店面：${staff.storeName}</label>
            </div>
            </div>
	    <div class="sale-order-panel">
	        <div class="sale-order-title">
                <h4>销售单</h4>
                <label>时间：<span class="real-time">-</span></label>
                <div class="sale-order-member">
                    <label>会员卡号： V</label>
                    <input type="text" id="js-member-id">
                    <span class="tip" id="js-add-member-msg"></span>        
                </div>
                <div class="sale-order-add-dessert">
                    <label>商品编号：</label>
                    <input type="text" name="dessert">
                    <label>数量：</label>
                    <input type="number" name="quantity" min="1">
                    <button class="btn btn-primary btn-sm" id="js-add-dessert-btn">添加</button>
                    <span class="error-tip" id="js-add-error-msg"></span>   
                </div>
                <div class="clear-fix"></div>
            </div>
            <table class="sale-item-list" id="js-sale-item-table" data-toggle="table" data-height="360"
                    data-unique-id="id" >
                <thead>
                    <tr>
                        <th class="col-md-2 col-sm-2" data-field="id" data-valign="middle"  data-align="center">商品编号</th>
                        <th class="col-md-5 col-sm-5" data-field="name" data-valign="middle"  data-align="center">商品名称</th>
                        <th class="col-md-2 col-sm-2" data-field="quantity" data-valign="middle"  data-align="center">数量</th>
                        <th class="col-md-2 col-sm-2" data-field="price" data-valign="middle"  data-align="center">单价</th>
                        <th class="col-md-1 col-sm-1" data-field="remove"
                            data-align="center"
                            data-formatter="removeFormatter"
                            data-events="removeEvents"></th>
                    </tr>
                </thead>
            </table>
            <div class="sale-order-bottom">
                <label>总金额：<span id="js-total">0</span></label>
                <label>折扣：<span id="js-discount">0</span></label>
                <label>应付：<span class="highlight" id="js-final-total">0</span></label>
                <button class="right btn btn-primary" id="js-sale-submit">完成交易</button>
                <button class="right btn btn-default">取消</button>
            </div>
        </div>
        <div class="clear-fix"></div>
    </div>
    <div class="toaster" style="display: none"></div>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script><script src="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/js/sale.js"></script>
</body>
</html>