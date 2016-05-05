<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>店面管理 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>
	<div class="wrapper js-store-list-panel">
		<h4 class="left">店面列表</h4>
		<button class="right btn btn-primary" id="js-add-store-btn"><span class="glyphicon glyphicon-plus"></span>新增店面</button>
		<div class="clear-fix"></div>
		<div class="table-panel" >
		<table
			data-toggle="table" data-sort-name="id" data-sort-order="asc">
			<thead>
				<tr>
					<th class="id" data-field="id" data-sortable="true">编号</th>
					<th class="name" data-field="name">店名</th>
					<th class="tel" data-field="tel">电话</th>
					<th class="address" data-field="address">地址</th>
					<th class="desc" data-field="description">介绍</th>
					<th class="modify" data-field="modify"></th>
					<th class="delete" data-field="delete"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${stores}" var="s">
				<tr class="js-store" sid="${s.id}">
					<td class="id" data-field="id">${s.id}</td>
					<td class="name" data-field="name">
						<span class="js-store-name" sid="${s.id}">${s.name}</span></td>
					<td class="tel" data-field="tel">
						<span class="js-store-tel" sid="${s.id}">${s.tel}</span></td>
					<td class="address" data-field="address">
						<span class="js-store-address" sid="${s.id}">${s.address}</span></td>
					<td class="desc" data-field="description">
						<span class="js-store-desc" sid="${s.id}">${s.description}</span></td>
					<td class="op" data-field="modify" ><span class="op-icon glyphicon glyphicon-pencil js-store-edit" sid="${s.id}" aria-hidden="true"></span></td>
					<td class="op" data-field="delete"><span class="op-icon glyphicon glyphicon-remove js-store-delete" sid="${s.id}" aria-hidden="true"></span></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	
	<div class="modal fade store-add-modal" id="add-modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新增店面</h4>
	      </div>
	      <div class="modal-body">
	        <form class="edit-form" id="js-store-add-form" enctype="multipart/form-data">
	        	<div class="form-group">
	        		<label>店名</label>
	        		<input type="text" class="form-control" name="name" id="js-add-store-name" required>
	        	</div>
	        	<div class="form-group">
	        		<label>电话</label>
	        		<input type="text" class="form-control" name="tel" id="js-add-store-tel" required>
	        	</div>
	        	<div class="form-group">
	        		<label>地址</label>
	        		<input type="text" class="form-control" name="address" id="js-add-store-address" required>
	        	</div>
	        	<div class="form-group">
	        		<label>介绍</label>
	        		<input type="text" class="form-control" name="desc" id="js-add-store-desc" required>
	        	</div>
	        </form>	      
	        </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="js-add-store-submit">确认</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="delete-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        		<h4 class="modal-title">删除店面</h4>
				</div>
				<div class="modal-body">
				 	确认删除<span class="highlight" id="js-delete-store"></span>这家店面吗？
				</div>
				<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        		<button type="button" class="btn btn-primary" id="js-delete-store-submit">确定</button>
	      		</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade store-edit-modal" id="edit-modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">店面信息修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="edit-form" id="js-store-edit-form">
	        	<input type="hidden" id="js-edit-store-id" name="id">
	        	<div class="form-group">
	        		<label>店名</label>
	        		<input type="text" class="form-control" name="name" id="js-edit-store-name" required>
	        	</div>
	        	<div class="form-group">
	        		<label>电话</label>
	        		<input type="text" class="form-control" name="tel" id="js-edit-store-tel" required>
	        	</div>
	        	<div class="form-group">
	        		<label>地址</label>
	        		<input type="text" class="form-control" name="address" id="js-edit-store-address" required>
	        	</div>
	        	<div class="form-group">
	        		<label>介绍</label>
	        		<input type="text" class="form-control" name="desc" id="js-edit-store-desc" required>
	        	</div>
	        </form>	      
	        </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="js-edit-store-submit">保存修改</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="toaster" style="display:none"></div>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
	<script src="<%=request.getContextPath()%>/js/store-edit.js"></script>
</body>
</html>