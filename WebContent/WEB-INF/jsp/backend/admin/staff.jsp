<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.css">
<jsp:include page="/WEB-INF/jsp/backend/common/header.jsp"></jsp:include>
<title>店员管理 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/backend/common/nav.jsp"></jsp:include>
	<div class="wrapper js-staff-list-panel">
		<h4 class="left">店员列表</h4>
		<button class="right btn btn-primary" id="js-add-staff-btn"><span class="glyphicon glyphicon-plus"></span>新增人员</button>
		<div class="clear-fix"></div>
		<div class="table-panel" >
		<table data-toggle="table"
               data-sort-name="id"
               data-sort-order="asc">
            <thead>
            <tr>
                <th class="id" data-field="id" data-sortable="true">编号</th>
                <th class="name" data-field="name">姓名</th>
                <th class="tel" data-field="tel">电话</th>
                <th class="address" data-field="store">所属店面</th>
				<th data-field="password">密码</th>
				<th class="positon" data-field="position">职位</th>
				<th class="modify" data-field="modify"></th>
				<th class="delete" data-field="delete"></th>
            </tr>
            </thead>
            <tbody>
				<c:forEach items="${staffs}" var="s">
				<tr class="js-staff" sid="${s.id}">
					<td class="id" data-field="id">${s.sid}</td>
					<td class="name" data-field="name">
						<span class="js-staff-name" sid="${s.id}">${s.name}</span></td>
					<td class="tel" data-field="tel">
						<span class="js-staff-tel" sid="${s.id}">${s.tel}</span></td>
					<td class="store" data-field="store">
						<span  class="js-staff-store" sid="${s.id}" storeId="${s.store_id}">${s.storeName}</span></td>
					<td data-field="password"><span class="js-staff-password" value="${s.password}" sid="${s.id}">******</span></td>
					<td class="position" data-field="position">
						<span class="js-staff-position" sid="${s.id}" value="${s.position}">
						<c:choose>
							<c:when test="${s.position==0 }">
								系统管理员
							</c:when>
							<c:when test="${s.position==1 }">
								经理
							</c:when>
							<c:when test="${s.position==2 }">
								总店服务员
							</c:when>
							<c:when test="${s.position==3 }">
								分店服务员
							</c:when>
						</c:choose>
						</span></td>						
						<td class="op" data-field="modify"><span class="op-icon glyphicon glyphicon-pencil js-staff-edit" sid="${s.id}" aria-hidden="true"></span></td>
						<td class="op" data-field="delete"><span class="op-icon glyphicon glyphicon-remove js-staff-delete" sid="${s.id}" aria-hidden="true"></span></td>
					</tr>
				</c:forEach>
            </tbody>
        </table>
        </div>
	</div>
	
	<div class="modal fade staff-add-modal" id="add-modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新增店员</h4>
	      </div>
	      <div class="modal-body">
	        <form class="edit-form" id="js-staff-add-form">
	        	<div class="form-group">
	        		<label>姓名</label>
	        		<input type="text" class="form-control" name="name" id="js-add-staff-name" required>
	        	</div>
	        	<div class="form-group">
	        		<label>电话</label>
	        		<input type="text" style="display:none" name="tel">
	        		<input type="text" class="form-control" name="tel" id="js-add-staff-tel" required autocomplete="off">
	        	</div>
	        	<div class="form-group">
	        		<label>密码</label>
	        		<input type="password" style="display:none" name="password">
	        		<input type="password" class="form-control" name="password" id="js-add-staff-password" required autocomplete="off">
	        	</div>
	        	<div class="form-group">
	        		<label>所属店面</label>
	        		<select id="js-store-selector">
						<c:forEach items="${stores}" var="store">
							<option value="${store.id}">${store.name}</option>
						</c:forEach>
					</select>
	        	</div>
	        	<div class="form-group">
	        		<label>职位</label>
	        		<select id="js-position-selector">
	        			<option value="2">总店服务员</option>
	        			<option value="3">服务员</option>
	        		</select>
	        	</div>
	        </form>	      
	        </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="js-add-staff-submit">确认</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="delete-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        		<h4 class="modal-title">删除店员</h4>
				</div>
				<div class="modal-body">
				 	确认删除店员<span class="highlight" id="js-delete-staff"></span>吗？
				</div>
				<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        		<button type="button" class="btn btn-primary" id="js-delete-staff-submit">确定</button>
	      		</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade staff-edit-modal" id="edit-modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">店员信息修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="edit-form" id="js-staff-edit-form">
	        	<input type="hidden" id="js-edit-staff-id" name="id">
	        	<div class="form-group">
	        		<label>姓名</label>
	        		<input type="text" class="form-control" name="name" id="js-edit-staff-name" required>
	        	</div>
	        	<div class="form-group">
	        		<label>电话</label>
	        		<input type="text" class="form-control" name="tel" id="js-edit-staff-tel" required autocomplete="off">
	        	</div>
	        	<div class="form-group">
	        		<label>密码</label>
	        		<input type="hidden">
	        		<input type="password" class="form-control" name="password" id="js-edit-staff-password" required autocomplete="off">
	        	</div>
	        	<div class="form-group"  id="js-store-edit">
	        		<label>所属店面</label>
	        		<select id="js-edit-store-selector">
						<c:forEach items="${stores}" var="store">
							<option value="${store.id}">${store.name}</option>
						</c:forEach>
					</select>
	        	</div>
	        	<div class="form-group" id="js-position-edit" style="display:none">
	        		<label>职位</label>
	        		<select id="js-edit-position-selector">
	        			<option value="2">总店服务员</option>
	        			<option value="3">服务员</option>
	        		</select>
	        	</div>
	        </form>	      
	        </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="js-edit-staff-submit">保存修改</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="toaster" style="display:none"></div>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table.js"></script>
	<script src="<%=request.getContextPath() %>/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
	<script src="<%=request.getContextPath() %>/js/staff.js"></script>
</body>
</html>