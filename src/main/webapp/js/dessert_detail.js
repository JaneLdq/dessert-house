$(document).ready(function(){
	
	if($('#js-quantity').html() == 0){
		$('#js-add-dessert').attr('disabled', true);
	}else{
		$('#js-dessert-value').val(1);
	}
	
	initNumberPicker();
	
	$('.js-addition-option').click(function(){
		var parent = $(this).parent();
		$(parent).children().removeClass("active");
		$(this).addClass("active");
		var cartItem = getCartItem();
		$.ajax({
			type: "post",
			url: urlPrefix + "/dessert/price",
			contentType: "application/json",
			data: JSON.stringify(cartItem),
			success: function(data){
				var price = data['price'];
				$('.js-dessert-price').html('<i class="fa fa-rmb"></i>' + price);
			}
		});
	});
	
	$('#js-date').change(function(){
		getQuantity();
	});
	
	$('#js-store-selector').change(function(){
		getQuantity();
		globalStoreId = $(this).val();
		window.localStorage.setItem("storeId", $(this).val());
		window.localStorage.setItem("storeName", $(this).children("option:selected").html());
	});
	
	$('#js-add-dessert').click(function(){
		if($(this).attr("disabled") == "disabled"){
			return;
		}
		var result = checkLogin();
		var cartItem = getCartItem();
		var id = $('#js-dessert-id').val();
		var num = $('#js-dessert-value').val();
		if(result==1){
			if(num > 0){
				$.ajax({
					type: "POST",
					url: urlPrefix + "/cart/add",
					contentType: "application/json",
					data: JSON.stringify(cartItem),
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

function getCartItem(){
	var id = $('#js-dessert-id').val();
	var storeId = $('#js-store-selector').val();
	var date = $('#js-date').val();
	var num = $('#js-dessert-value').val();
	var additions = [];
	if($('.js-cake-size-selector').length > 0){
		var value = $('.js-cake-size-selector').children('.size-item.active').html();
		additions.push({key: "规格", value: value});
	}
	if($('.js-cup-selector').length > 0){
		var value = $('.js-cup-selector').children('.size-item.active').html();
		additions.push({key: "规格", value: value});
	}
	if($('.js-temp-selector').length > 0){
		var value = $('.js-temp-selector').children('.size-item.active').html();
		additions.push({key: "温度", value: value});
	}
	if($('.js-sweet-selector').length > 0){
		var value = $('.js-sweet-selector').children('.size-item.active').html();
		additions.push({key: "甜度", value: value});
	}
	var cartItem = {
			dessertId: id,
			quantity: num,
			storeId: storeId,
			dateStr: date,
			additions: additions
	};
	return cartItem;
}

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
				$('#js-add-dessert').attr('disabled', true);
			} else {
				$('#js-dessert-value').val(1);
				$('#js-add-dessert').attr('disabled', false);
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
	
	$('.js-dessert-value').on('propertychange input', function(){
		var val = $('.js-dessert-value').val();
		var max = $('#js-quantity').html();
		if( Number(val) > Number(max) ){
			$('.js-dessert-value').val(max);
		}
	});
}

function jumpToNext(element){
	var did = Number($(element).attr('did'));
	var total = Number($('#js-total-dessert-num').val());
	if(did < total){
		var url = urlPrefix + "/dessert/d/" + (did+1) + "/s/" + globalStoreId;
		window.location.href = url;
		return false;
	}
}

function jumpToPre(element){
	var did = Number($(element).attr('did'));
	if(did > 1){
		var url = urlPrefix + "/dessert/d/" + (did-1) + "/s/" + globalStoreId;
		window.location.href = url;
		return false;
	}
}
