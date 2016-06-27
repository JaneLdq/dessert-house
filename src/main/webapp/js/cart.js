$(document).ready(function(){
	numberPicker();
	deleteItem();
	updateSum();
	datePicker();
	
	$('#js-cart-modal-submit').click(function(){
		$.ajax({
			type: "post",
			url: urlPrefix + "/cart/book",
			success: function(data){
				console.log(data);
				if(data['result'] == 0){
					toaster("非常抱歉，下单失败了，请稍后再试");
				} else if(data['result'] == 2){
					$('#charge-msg-modal .modal-content').html("余额不足了哦，<a href='<" + urlPrefix + "/user/charge'>马上去充值~</a>");
					$('#charge-msg-modal').modal();
				} else {
					$('#charge-msg-modal .modal-content').html("成功扫荡购物车！<a href='" + urlPrefix + "/user/orders'>查看订单</a>");
					$('#charge-msg-modal').modal();
					$('.js-cart-msg').hide();
					$('.m-cart-panel').html('<div class="cart-list-empty"><p>肚子里空空的，伐开心，求投喂！</p>'
							+ '<a href="' + urlPrefix + '/dessert"/> 去觅食~Ψ(￣∀￣)Ψ</a></div>');
				}
			},
			error: function(){
				console.log("book failed");
			}
		});
	});
	
	$('#js-cart-submit').click(function(){
		$('#confirm-modal').modal();
	});
	
});


function datePicker(){
	$('.js-cell-dessert-date').on('change', function(){
		var datePicker = $(this);
		var cid = $(this).attr('cid');
		var quantityInput = $('.js-dessert-value[cid="'+cid+'"]');
		var date = $(this).val();
		var did = $(this).attr('did');
		var storeId = $(this).attr('sid');
		var quantity = Number(quantityInput.val());
		$.ajax({
			type: "POST",
			url: urlPrefix + "/dessert/getQuantityByStoreDate",
			data: {
				id: did,
				storeId: storeId,
				date: date
			},
			success: function(data){
				var result = data['result'];
				if(result == 0){
					datePicker.val(datePicker.attr('date'));
					toaster("抱歉，该店当日无库存！");
				} else if(Number(result) > quantity){
					quantityInput.attr('max', result);
					updateCartItemByDate(cid, did, quantity, storeId, date);
				} else {
					quantityInput.attr('max', result);
					quantityInput.val(result);
					updateCartItemByDate(cid, did, result, storeId, date);
				}
			},
			error: function(){
				console.log("获取库存数据失败！");
			}
		});
	});
}

function numberPicker(){
	$('.js-number-picker .minus').on('click', function(){
		var picker = $(this).parent();
		var cid = $(this).attr('cid');
		var value = $(picker).children('.js-dessert-value').get(0);
		var quantity = $(value).val();
		if(quantity > 1){
			$.ajax({
				type: "POST",
				url: urlPrefix + "/cart/remove",
				data: {
					id: cid,
					quantity: 1
				},
				success: function(data){
					--quantity;
					$(value).val(quantity).attr('value', quantity);
					$('.js-cart-item-total[cid="' + cid + '"]').html(data.total);
					if(quantity==1){
						$('.js-number-picker .minus[cid="' + cid + '"]').addClass('disabled');	
					}
					updateCartMsg();
					updateSum();
				}
			});
		} else {
			$(this).addClass('disabled');
		}
	});
	
	$('.js-number-picker .plus').on('click', function(){
		var picker = $(this).parent();
		var value = $(picker).children('.js-dessert-value').get(0);
		var quantity = Number($(value).val());
		var cid = $(this).attr('cid');
		var did = $(this).attr('did');
		var sid = $('.js-cell-dessert-store[cid="' + cid + '"]').attr("sid");
		var date = $('.js-cell-dessert-date[cid="' + cid + '"]').val();
		var max = $('.js-dessert-value[cid="' + cid + '"]').attr('max');
		if(Number(quantity)<Number(max)){
			updateCartItem(cid, did, quantity+1, sid, date);
		}
	});
	
	$('.js-dessert-value').on('propertychange input', function(){
		if($(this).val().length == 0){
			$(this).val(1);
		}
		var picker = $(this).parent();
		var quantity = $(this).val();
		var cid = $(this).attr('cid');
		var did = $(this).attr('did');
		var sid = $('.js-cell-dessert-store[cid="' + cid + '"]').attr("sid");
		var date = $('.js-cell-dessert-date[cid="' + cid + '"]').val();
		var max = $(this).attr('max');
		if(Number(quantity)>Number(max)){
			quantity = max;
			$(this).val(max);
		}
		updateCartItem(cid, did, quantity, sid, date);
	});
}

function updateCartItemByDate(cid, did, quantity, sid, date){
	quantity = Number(quantity);
	var value = $('.js-dessert-value[cid="'+cid+'"]');
	$.ajax({
		type: "POST",
		url: urlPrefix + "/cart/update",
		data: {
			id: cid,
			dessertId: did,
			quantity: quantity,
			storeId: sid,
			dateStr: date
		},
		success: function(data){
			if(data['result']==1){
				$(value).val(quantity).attr('value', quantity);
				$('.js-cell-dessert-date[cid="'+cid+'"]').attr('date',date);
				$('.js-cart-item-total[cid="' + cid + '"]').html(data['total']);
				$('.js-number-picker .minus[cid="' + cid + '"]').removeClass('disabled');
				updateCartMsg();
				updateSum();
				$('.js-dessert-remain[cid="'+cid+'"]').html(data['remain']);
			}else{
				toaster("该日已有购物车记录，同一商品同一天请添加在同一条记录哦~");
				$('.js-cell-dessert-date[cid="'+cid+'"]').val($('.js-cell-dessert-date[cid="'+cid+'"]').attr('date'));
			}
		},
		error: function(){
			console.log("add dessert ajax error");
		}
	});
}


function updateCartItem(cid, did, quantity, sid, date){
	quantity = Number(quantity);
	var value = $('.js-dessert-value[cid="'+cid+'"]');
	$.ajax({
		type: "POST",
		url: urlPrefix + "/cart/update",
		data: {
			id: cid,
			dessertId: did,
			quantity: quantity,
			storeId: sid,
			dateStr: date
		},
		success: function(data){
			if(data['result']==1){
				$(value).val(quantity).attr('value', quantity);
				$('.js-cart-item-total[cid="' + cid + '"]').html(data['total']);
				$('.js-number-picker .minus[cid="' + cid + '"]').removeClass('disabled');
				updateCartMsg();
				updateSum();
			}else{
				toaster("操作失败了0.0");
			}
		},
		error: function(){
			console.log("add dessert ajax error");
		}
	});
}

function updateSum(){
	$.ajax({
		type: "POST",
		url: urlPrefix + "/cart/sum",
		success: function(data){
			$('.js-sum').html('<i class="fa fa-rmb"></i>' + data.sum);
			$('#js-discount').html('<i class="fa fa-rmb"></i>' + data.discount);
		}
	})
}

function checkEmpty(){
	$.ajax({
		type: "POST",
		url: urlPrefix + "/cart/total",
		success: function(data){
			if(data != 0)
				$('.js-cart-msg').html(data).show();
			else{
				$('.js-cart-msg').hide();
				var html = '<div class="cart-list-empty">'
						+ '<img src="' + urlPrefix + '/img/cart.png">'
						+ '<p>购物车什么都没有，</p><a href="' + urlPrefix + '/dessert"> 马上去逛逛！Ψ(￣∀￣)Ψ</a>'
						+ '</div>';
				$('.m-cart-panel').html(html);
				$('.js-cart-op').hide();
			}
		}
	});
}

function deleteItem(){
	$('.js-delete-cart-item').click(function(){
		var id = $(this).attr('cid');
		$.ajax({
			type: "POST",
			url: urlPrefix + "/cart/delete",
			data: {
				id: id
			},
			success: function(data){
				$('.cart-list-item[cid="' + id + '"]').hide().remove();
				updateCartMsg();
				updateSum();
				checkEmpty();
			},
			error: function(){
				console.log("删除失败！");
			}
		});
	});
}