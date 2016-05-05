$(document).ready(function(){
	
	$('#js-add-store-btn').click(function(){
		$('#add-modal').modal();
	});
	
	$('#js-add-store-submit').click(function(){
		var name = $('#js-add-store-name').val();
		var tel = $('#js-add-store-tel').val();
		var address = $('#js-add-store-address').val();
		var desc = $('#js-add-store-desc').val();
		if(name == ""|| tel == "" || address == "" || desc == "" ){
			toaster("表格项不能为空！");
			return;
		}
		$.ajax({
			type:"post",
			url: urlPrefix + "/admin/addStore",
			data: $('#js-store-add-form').serialize(),
			success: function(data){
				if(data['result']==1){
					$('#add-modal').modal('hide');
					toaster("新增店面成功~");
					window.location.reload(true);
				}
			},
			error: function(){
				console.log("新增店面AJAX错误");
			}
		})
		
	});
	
	$('.js-store-list-panel').on('click','.js-store-delete', function(){
		var id = $(this).attr('sid');
		var name = $('.js-store-name[sid="' + id + '"]').html();
		$('#js-delete-store').attr('sid', id).html(name);
		$('#delete-modal').modal();
	});
	
	$('.js-store-list-panel').on('click','.js-store-edit',function(){
		var id = $(this).attr('sid');
		var name = $('.js-store-name[sid="' + id + '"]').html();
		var tel = $('.js-store-tel[sid="' + id + '"]').html();
		var address = $('.js-store-address[sid="' + id + '"]').html();
		var desc = $('.js-store-desc[sid="' + id + '"]').html();
		$('#js-edit-store-id').val(id);
		$('#js-edit-store-name').val(name);
		$('#js-edit-store-tel').val(tel);
		$('#js-edit-store-address').val(address);
		$('#js-edit-store-desc').val(desc);
		$('#edit-modal').modal();
	});
	
	$('#js-delete-store-submit').click(function(){
		var id = $('#js-delete-store').attr('sid');
		$.ajax({
			type: "post",
			url: urlPrefix + "/admin/deleteStore",
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
	
	$('#js-edit-store-submit').click(function(){
		var id = $('#js-edit-store-id').val();
		var name = $('#js-edit-store-name').val();
		var tel = $('#js-edit-store-tel').val();
		var address = $('#js-edit-store-address').val();
		var desc = $('#js-edit-store-desc').val();
		if(name.length == 0 || tel.length == 0 || address.length == 0||desc.length==0){
			toaster("表格项都不能为空~");
			return;
		}
		$.ajax({
			type: "post",
			url: urlPrefix + "/admin/modifyStore",
			data: $('#js-store-edit-form').serialize(),
			success: function(data){
				console.log(data);
				if(data['result']==1){
					toaster("修改成功！");
					$('.js-store-name[sid="' + id + '"]').html(name);
					$('.js-store-tel[sid="' + id + '"]').html(tel);
					$('.js-store-address[sid="' + id + '"]').html(address);
					$('.js-store-desc[sid="' + id + '"]').html(desc);
					$('#edit-modal').modal('hide');
				}else{
					toaster("修改失败了，请重新尝试！");
				}
			},
			error: function(){
				console.log("修改店面信息AJAX错误");
			}
		})
	});
});