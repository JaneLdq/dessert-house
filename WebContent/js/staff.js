$(document).ready(function(){
	
	$('#js-add-staff-btn').click(function(){
		$('#add-modal').modal();
	});
	
	$('#js-add-staff-submit').click(function(){
		var name = $('#js-add-staff-name').val();
		var tel = $('#js-add-staff-tel').val();
		var password = $('#js-add-staff-password').val();
		if(name == ""|| tel == "" || password == ""  ){
			toaster("表格项不能为空！");
			return;
		}
		var store = $('#js-store-selector').val();
		var position = $('#js-position-selector').val();
		$.ajax({
			type:"post",
			url: "/DessertHouse/admin/addStaff",
			data: {
				name: name,
				tel: tel,
				password: password,
				store_id: store,
				position: position
			},
			success: function(data){
				if(data['result']==1){
					$('#add-modal').modal('hide');
					toaster("新增店员成功~");
					window.location.reload(true);
				}
			},
			error: function(){
				console.log("新增店员AJAX错误");
			}
		})
		
	});
	
	$('.js-staff-list-panel').on('click','.js-staff-delete', function(){
		var id = $(this).attr('sid');
		var name = $('.js-staff-name[sid="' + id + '"]').html();
		$('#js-delete-staff').attr('sid', id).html(name);
		$('#delete-modal').modal();
	});
	
	$('.js-staff-list-panel').on('click','.js-staff-edit',function(){
		var id = $(this).attr('sid');
		var name = $('.js-staff-name[sid="' + id + '"]').html();
		var tel = $('.js-staff-tel[sid="' + id + '"]').html();
		var password = $('.js-staff-password[sid="' + id + '"]').attr('value');
		var store = $('.js-staff-store[sid="' + id + '"]').attr('storeId');
		var position = $('.js-staff-position[sid="' + id + '"]').attr('value');
		$('#js-edit-position-selector').val(position);
		$('#js-edit-store-selector').val(store);
		$('#js-edit-staff-id').val(id);
		$('#js-edit-staff-name').val(name);
		$('#js-edit-staff-tel').val(tel);
		$('#js-edit-staff-password').val(password);
		if(position ==2 ){
			$('#js-edit-store-selector').hide();
		}else{
			$('#js-edit-store-selector').show();
		}
		$('#edit-modal').modal();
	});
	
	$('#js-delete-staff-submit').click(function(){
		var id = $('#js-delete-staff').attr('sid');
		$.ajax({
			type: "post",
			url: "/DessertHouse/admin/deleteStaff",
			data: {
				id: id
			},
			success: function(data){
				console.log(data);
				if(data['result']==1){
					$('#delete-modal').modal('hide');
					toaster("删除成功！");
					window.location.reload(true);
				}else{
					$('#delete-modal').modal('hide');
					toaster("删除失败！");
				}
			}
		})
	});
	
	$('#js-edit-staff-submit').click(function(){
		var id = $('#js-edit-staff-id').val();
		var name = $('#js-edit-staff-name').val();
		var tel = $('#js-edit-staff-tel').val();
		var password = $('#js-edit-staff-password').val();
		if(name.length == 0 || tel.length == 0 || password.length == 0){
			toaster("表格项都不能为空~");
			return;
		}
		var storeId = $('#js-edit-store-selector').val();
		var storeName = $('#js-edit-store-selector option:selected').html();
		var position = $('#js-edit-position-selector').val();
		var positionStr = $('#js-edit-position-selector option:selected').html();
		console.log(storeId);
		$.ajax({
			type: "post",
			url: "/DessertHouse/admin/modifyStaff",
			data: {
				id: id,
				name: name,
				tel: tel,
				password: password,
				store_id: storeId,
				position: position
			},
			success: function(data){
				console.log(data);
				if(data['result']==1){
					toaster("修改成功！");
					$('.js-staff-name[sid="' + id + '"]').html(name);
					$('.js-staff-tel[sid="' + id + '"]').html(tel);
					$('.js-staff-password[sid="' + id + '"]').html(password);
					$('.js-staff-store[sid="' + id + '"]').html(storeName);
					$('.js-staff-position[sid="' + id + '"]').html(positionStr);
					$('#edit-modal').modal('hide');
				}else{
					toaster("修改失败了，请重新尝试！");
				}
			}
		})
	});
});
