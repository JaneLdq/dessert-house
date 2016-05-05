<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>产品计划 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>	
	<div class="wrapper-fluid">
		<div class="plan-panel">
			<div class="store-list-panel">
				<div class="list-group">
					<a class="list-group-item active js-store-plan-btn" href="javascript:void(0)" sid="0">所有店面</a>
					<c:forEach items="${stores}" var="s">
						<a class="list-group-item js-store-plan-btn" href="javascript:void(0)" sid="${s.id}">${s.name}</a>
					</c:forEach>
				</div>
			</div>
			<div class="plan-list-panel">
				<div class="plan-selector" style="display:none">
					筛选：
					<input type="date">
					<div class="right btn-group btn-group-sm" role="group" aria-label="...">
					  	<button type="button" class="btn btn-primary">待审核</button>
					  	<button type="button" class="btn btn-default">审核通过</button>
					  	<button type="button" class="btn btn-default">审核未通过</button>
					</div>
				</div>
				<table id="js-plan-table" data-toggle="table" data-row-style="rowStyle" data-url="<%=request.getContextPath()%>/plan/getPlanByStore">
						<thead>
							<tr>
                                <th rowspan="2" data-field="id" data-valign="middle"  data-align="center" data-sortable="true">编号</th>
								<th rowspan="2" data-field="storeName" data-valign="middle" data-align="center"  data-sortable="true">店面</th>
								<th rowspan="2" data-field="date" data-valign="middle" data-align="center" data-sortable="true">日期</th>
								<th rowspan="2" data-field="state" data-valign="middle"  data-align="center" data-sortable="true" data-formatter="stateFormatter">状态</th>
								<th colspan="2" data-align="center" >操作</th>
							</tr>
							<tr>
                                <th data-field="view" 
                                    data-align="center"
                                    data-formatter="viewFormatter">查看</th>
								<th data-field="modify" 
									data-align="center" 
									data-events="modifyEvents" 
	                        		data-formatter="modifyFormatter">修改</th>
							</tr>
						</thead>
					</table>
			</div>
            <div class="clear-fix"></div>
		</div>
	</div>
    <div class="toaster" style="display: none"></div>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
	<script src="<%=request.getContextPath() %>/js/plan.js"></script>
</body>
</html>