<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal common-modal address-modal" id="address-modal" style="display:none">
	<a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
	<div class="modal-title">新增收货地址</div>
	<div class="modal-content">
		<form class="address-form">
			<div class="form-group">
				<label class="label">收货人：</label>
				<input type="text" name="receiver" >
				<input type="hidden" name="id">
			</div>
			<div class="form-group">
				<label class="label">地址：</label>
				<input type="text" name="address">
			</div>
			<div class="form-group">
				<label class="label">联系电话：</label>
				<input type="text" name="tel">
			</div>
			<div class="form-group js-set-default-group">
				<input type="checkbox" id="set-default" name="default"><span class="checkbox-span">设为默认地址</span>
			</div>
			<button class="btn js-address-add-btn" type="button">保存地址</button>
		</form>
	</div>
</div>