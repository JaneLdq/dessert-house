<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>会员 - 恬</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>  
    <div class="wrapper-fluid">
        <h4>会员列表</h4>
        <div class="sale-member-list">
        <table data-toggle="table" data-height="500" 
                data-pagination="true"
                data-search="true"
                data-show-columns="true"
                data-minimum-count-columns="3"
                data-url="/DessertHouse/sale/getMembers">
            <thead>
                <tr>
                    <th data-field="mid">会员卡</th>
                    <th data-field="level">等级</th>
                    <th data-field="name">姓名</th>
                    <th data-field="sex"
                        data-formatter="sexFormatter">性别</th>
                    <th data-field="birth">生日</th>
                    <th data-field="address">地址</th>
                    <th data-field="charge">充值总额</th>
                    <th data-field="consumption">消费总额</th>
                    <th data-field="point">积分</th>
                    <th data-field="detail"
                        data-formatter="detailFormatter"
                        data-events="detailEvents">详细记录</th>
                </tr>
            </thead>
        </table>
        </div>
    </div>
    <div class="modal fade" id="js-payment-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">缴费清单</h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal-member-info">
                            <label>会员卡号：<span class="highlight" id="js-payment-modal-mid"></span></label>
                            <label>会员姓名： <span class="highlight" id="js-payment-modal-name"></span></label>
                        </div>
                        <table id="js-payment-table"
                               data-toggle="table"
                               data-height="299"
                               data-url="/DessertHouse/sale/payment?id=1">
                            <thead>
                            <tr>
                                <th data-field="id">#</th>
                                <th data-field="value">金额</th>
                                <th data-field="created_at">日期</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
        <div class="modal fade" id="js-order-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">消费记录</h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal-member-info">
                            <label>会员卡号：<span class="highlight" id="js-order-modal-mid"></span></label>
                            <label>会员姓名： <span class="highlight" id="js-order-modal-name"></span></label>
                        </div>
                        <table id="js-order-table"
                               data-toggle="table"
                               data-height="299"
                               data-url="/DessertHouse/sale/memberOrder?id=1">
                            <thead>
                            <tr>
                                <th data-field="id">#</th>
                                <th data-field="createdAtStr">消费时间</th>
                                <th data-field="discount">折扣</th>
                                <th data-field="total">交易金额</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="modal-footer clear-fix">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    <script src="<%=request.getContextPath() %>/js/member-list.js"></script>
</body>
</html>