<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-editable.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>创建产品计划 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>	
	<div class="wrapper">
		<div class="create-plan-option js-plan-option">
			<div class="option">
				<label>店面：</label>
				<select class="input" id="js-store-selector">
					<c:forEach items="${stores}" var="s">
						<option value="${s.id}">${s.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="option">
				<label>起始日期：</label>
				<input class="input" type="date" id="js-date-selector" min="${minDate}" value="${minDate}">
			</div>
			<button class="btn btn-primary" id="js-create-plan-submit">新建产品计划</button>
		</div>
		<div class="create-plan-title js-plan-title">
			<label>店面：<span id="js-selected-store"></span></label>
			<label>日期：<span id="js-selected-date"></span></label>
			<div class="btn btn-sm btn-default" id="js-modify-option">修改</div>
		</div>
		<div class="create-plan-panel js-plan-detail-panel">
			<ul class="nav nav-tabs" role="tablist" id="js-plan-tabs">
    			<li role="presentation" class="active"><a class="js-plan-tab" href="#plan-detail-1" aria-controls="plan-detail-1" role="tab" data-toggle="tab"></a></li>
    			<c:forEach var="i" begin="2" end="7">
    				<li role="presentation"><a class="js-plan-tab" href="#plan-detail-${i}" aria-controls="plan-detail-${i}" role="tab" data-toggle="tab"></a></li>
    			</c:forEach>
  			</ul>
			<ul class="tab-content tab-panes js-plan-tab-panes">
				<c:forEach var="i" begin="1" end="7">
				<c:choose>
				<c:when test="${i==1}">
					<li role="tabpanel" class="tab-pane active js-plan-pane" id="plan-detail-${i}">
				</c:when>
				<c:otherwise>
					<li role="tabpanel" class="tab-pane fade js-plan-pane" id="plan-detail-${i}">
				</c:otherwise>
				</c:choose>
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
							<c:forEach items="${desserts}" var="d">
								<tr>
									<td>${d.id}</td>
									<td>${d.name}</td>
									<td><input type="number" value="30"></td>
									<td><input type="number" value="${d.price}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</li>
				</c:forEach>
			</ul>
			<button class="right plan-submit btn btn-primary" id="js-plan-submit">提交计划</button>
            <button class="right btn btn-defautl">取消</button>
            <div class="clear-fix"></div>
		</div>
	</div>
	<div class="toaster" style="display: none"></div>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-editable.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/create-plan.js"></script>
</body>
</html>