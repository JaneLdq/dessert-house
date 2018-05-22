$(document).ready(function(){
	
	$('.js-add-address').click(function(){
		$('#address-modal').modal();
	});

	$('#js-order-submit').click(function(){
		if($(this).attr("disabled") == "disabled"){
			return;
		}
		$('#confirm-modal').modal();
	});
	
	$('#js-address-selector').click(function(){
		$.ajax({
			type: "get",
			url: urlPrefix + "/address/getAll",
			success: function(data){
				var list = data['addrList'];
				var def = data['defaultAddress'];
				list.push(def);
				var current = $('#js-current-address').attr("address-id");
				var html = "";
				for(var i=0; i<list.length; i++){
					var addr = list[i];
					if(addr.id == current){
						html += '<li class="active js-address-selector-item" aid="'
							+ addr.id + '"><input type="radio" name="address" checked>';
					}else{
						html += '<li class="js-address-selector-item" aid="' 
							+ addr.id + '"><input type="radio" name="address">';
					}
					html += '<label>收货人：</label><span class="receiver">'
						+ addr.receiver + '</span><label>联系电话：</label><span class="tel">' + addr.tel 
						+ '</span><p><label>收货地址：</label><span class="address">' + addr.address + '</span></p></li>';
				}
				$('#js-address-selector-list').html(html);
				$('#select-address-modal').modal();
			}
		});
	});
	
	$('#js-address-selector-list').on('click', '.js-address-selector-item', function(){
		$('#js-address-selector-list').children('input[type="radio"]').prop("checked",false);
		$('#js-address-selector-list').children('.js-address-selector-item').removeClass("active");
		$(this).addClass('active').children('input[type="radio"]').prop("checked", true);
		var data = {
			address: $(this).children('.address').html(),
			tel: $(this).children('.tel').html(),
			receiver: $(this).children('.receiver').html(),
			id: $(this).attr('id')
		};
		refreshAddress(data);
	});

	$('#js-order-modal-submit').click(function(){
		$('#js-order-submit').attr("disabled", true);
		var remark = $('#js-remark').val();
		var type =  $('input[name="pick-type"]:checked').val();
		var addressId = $('#js-current-address').attr("address-id");
		$.ajax({
			type: "post",
			url: urlPrefix + "/cart/book",
			data: {
				type: type,
				remark: remark,
				addressId: addressId
			},
			success: function(data){
				if(data['result'] == 0){
					toaster("非常抱歉，下单失败了，请稍后再试");
				} else if(data['result'] == 2){
					$('#charge-msg-modal .modal-content').html("余额不足了哦，<a href='<" + urlPrefix + "/user/charge'>马上去充值~</a>");
					$('#charge-msg-modal').modal();
				} else {
					$('#charge-msg-modal .modal-content').html("成功提交订单！<a href='" + urlPrefix + "/user/orders'>查看订单</a>" +
							"<p class='count-down'><span class='count-down-num' id='js-count-down'>4</span>秒后跳转到首页</p>");
					$('#charge-msg-modal').modal();
					intervalid = setInterval("countDown()", 1000); 
				}
			},
			error: function(){
				console.log("book failed");
			}
		});
	});
	
	$('#js-take-out').click(function(){
		$('#js-current-address').show();
		$('.js-type-selector').hide();
	});
	
	$('#js-customer-pick-up').click(function(){
		$('#js-current-address').hide();
		$('.js-type-selector').show();
	});
	
	$('body').on('click', '.js-address-add-btn', function(){
		addAddress(refreshAddress);	
		$('.address-form')[0].reset();
		$.modal.close();
	});

});

var i = 3; 
var intervalid; 

function countDown() { 
	if (i == 0) { 
		clearInterval(intervalid); 
		var url = urlPrefix + "/";
		window.location.href = url;
	}
	$('#js-count-down').html(i); 
	i--; 
}

var refreshAddress = function refreshAddress(data){
	$('.js-current-receiver').html(data.receiver);
	$('.js-current-address').html(data.address);
	$('.js-current-tel').html(data.tel);
	$('#js-current-address').attr("address-id", data.id);
}
