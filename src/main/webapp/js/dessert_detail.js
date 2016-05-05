$(document).ready(function(){
	
	initNumberPicker();
	
	$('#js-date').change(function(){
		getQuantity();
	});
	
	$('#js-store-selector').change(function(){
		getQuantity();
	});
	
	$('#js-add-dessert').click(function(){
		var result = checkLogin();
		var id = $('#js-dessert-id').val();
		var storeId = $('#js-store-selector').val();
		var date = $('#js-date').val();
		var num = $('#js-dessert-value').val();
		if(result==1){
			if(num > 0){
				$.ajax({
					type: "POST",
					url: urlPrefix + "/cart/add",
					data: {
						dessertId: id,
						quantity: num,
						storeId: storeId,
						dateStr: date
					},
					success: function(data){
						console.log("加入购物车" + data.result);
						updateCartMsg();
						$('#add-modal').modal();
					}
				});
			}
		} else {
			window.location.href=urlPrefix + "/auth?backurl=" + urlPrefix +"/dessert/d/"+id;
		}
	});
	
});

function getQuantity(){
	var did = $('#js-dessert-id').val();
	var storeId = $('#js-store-selector').val();
	var date = $('#js-date').val();
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
			$('#js-dessert-value').attr('max', result);
			$('#js-quantity').html(result);
			if(result == 0){
				$('#js-dessert-value').val(0);
			} else {
				$('#js-dessert-value').val(1);
			}
		},
		error: function(){
			console.log("获取库存数据失败！");
		}
	});
}

function initNumberPicker(){
	$('.js-number-picker .minus').on('click', function(){
		var picker = $(this).parent();
		var value = $(picker).children('#js-dessert-value').get(0);
		var num = $(value).val();
		if(num > 1){
			--num;
			$(value).val(num).attr('value', num);
		}
	});
	
	$('.js-number-picker .plus').on('click', function(){
		var picker = $(this).parent();
		var value = $(picker).children('#js-dessert-value').get(0);
		var max = Number($(value).attr('max'));
		var num = Number($(value).val());
		if(num < max){
			++num;
			$(value).val(num).attr('value', num);
		}
	});
}