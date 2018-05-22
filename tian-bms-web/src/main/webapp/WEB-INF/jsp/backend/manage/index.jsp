<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>产品计划审批 - 恬</title>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>	
    <div class="wrapper-fluid">
    <div class="store-list-panel">
        <div class="list-group">
            <a class="list-group-item active js-store-plan-btn" href="javascript:void(0)" sid="0">所有店面</a>
    	    <c:forEach items="${stores}" var="s">
                <a class="list-group-item js-store-plan-btn" href="javascript:void(0)" sid="${s.id}">${s.name}</a>
            </c:forEach>
        </div>
    </div>
    <div class="plan-list-panel">
        <table id="js-plan-table" data-toggle="table" data-row-style="rowStyle" data-url="<%=request.getContextPath() %>/plan/getPlanByStore">
            <thead>
                <tr>
                    <th rowspan="2" data-field="check" data-checkbox="true"></th>
                    <th rowspan="2" data-field="id" data-valign="middle"  data-align="center" data-sortable="true">编号</th>
                    <th rowspan="2" data-field="storeName" data-valign="middle" data-align="center"  data-sortable="true">店面</th>
                    <th rowspan="2" data-field="date" data-valign="middle" data-align="center" data-sortable="true">日期</th>
                    <th rowspan="2" data-field="state" data-valign="middle"  data-align="center" data-sortable="true" data-formatter="stateFormatter">状态</th>
                    <th colspan="3" data-align="center" >操作</th>
                </tr>
                <tr>
                    <th data-field="view" 
                        data-align="center"
                        data-formatter="viewFormatter">查看</th>
                    <th data-field="pass" 
                        data-align="center"
                        data-events="passEvents" 
                        data-formatter="passFormatter">批准</th>
                    <th data-field="reject" 
                        data-align="center" 
                        data-events="rejectEvents" 
                        data-formatter="rejectFormatter">否决</th>
                     </tr>
             </thead>
        </table>
        </div>
        <div class="clear-fix"></div>
    </div>
    <div class="toaster" style="display: none"></div>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    <script src="<%=request.getContextPath() %>/js/plan-pass.js"></script>
</body>
</html>