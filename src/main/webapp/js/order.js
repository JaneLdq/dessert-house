$(document).ready(function(){
	
	$('.js-add-address').click(function(){
		$('#address-modal').modal();
	});

	$('#js-order-submit').click(function(){
		$('#confirm-modal').modal();
	});
	
	$('#js-order-modal-submit').click(function(){
		var remark = $('#js-remark').val();
		var type =  $('input[name="pick-type"]:checked').val();
		var addressId = $('#js-address-list').attr("address-id");
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

	$('.js-btn-one-more').click(function(){
		$.ajax({
			method: "post",
			url: "/Tian/order/again",
			data: {
				id: 6,
				date: "2016-07-02",
				type: 0
			},
			success: function (data) {

			}
		});
	});
	
	$('#js-take-out').click(function(){
		$('#js-address-list').show();
		$('.js-type-selector').hide();
	});
	
	$('#js-customer-pick-up').click(function(){
		$('#js-address-list').hide();
		$('.js-type-selector').show();
	});
	
	$('body').on('click', '.js-address-add-btn', function(){
		addAddress(refreshAddress);
	});

	$('#js-order-pre').click(function(){
		var current = Number($('#js-order-current').attr("page"));
		if(current>1){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/orders/" + (current-1),
				success: function(data){
					console.log(data);
					var orders = data['orders'];
					var html = getOrderHtml(orders);
					$('#js-order-list').html(html);
					$('#js-order-current').attr('page', (current-1)).html(current-1);
				},
				error: function(){
					console.log("获取上一页订单记录失败!");
				}
			})
		}
	});

	$('#js-order-next').click(function(){
		var current = Number($('#js-order-current').attr('page'));
		if(current < Number($('#js-order-current').attr('max'))){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/orders/" + (current+1),
				success: function(data){
					console.log(data);
					var orders = data['orders'];
					var html = getOrderHtml(orders);
					$('#js-order-list').html(html);
					$('#js-order-current').attr('page', (current+1)).html(current+1);
				},
				error: function(){
					console.log("获取下一页订单记录失败!");
				}
			})
		}
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
	$('#js-address-list').attr("address-id", data.id);
	$('.address-form')[0].reset();
	$.modal.close();
}

function getOrderHtml(orders){
	var html = "";
	for (var i = 0; i < orders.length; i++) {
		var order = orders[i];
		html += '<div class="order-item">' +
			'<ul class="order-basic">' +
			'<li class="time">' + order.date + ' </li>' +
			'<li class="order-number"><label>订单号：</label>' + order.id + '</li>' +
			'<li class="store"><label>店铺：</label>' +
			'<a class="name" href="' + urlPrefix + '/store/' + order.id + '">' + order.store.name + '</a></li>' +
			'<li class="btn btn-sm js-btn-one-more" >再来一单</li>' +
			'</ul>' +
			'<div class="order-detail">' +
			'<div class="cell o-detail">';
		for (var j = 0; j < order.items.length; j++) {
			var item = order.items[j];
			html += '<ul class="order-dessert-list">' +
				'<li class="cell l-name"><a class="name" ' +
				'href="' + urlPrefix + '/dessert/d/' + item.dessertId + '">' + item.name + '</a></li>' +
				'<li class="cell l-quantity">x'+ item.quantity + '</li>' +
				'<li class="cell l-price">' + item.price + '</li>' +
				'<li class="clear-fix"></li>' +
				'</ul>';
		}
		html += '</div>' +
			'<div class="cell o-sum"><i class="fa fa-rmb"></i>' + order.total + '</div>' +
			'<div class="cell o-date">' + order.sendDate + '</div>' +
			'<div class="cell o-state">' + order.state + '</div>' +
			'<div class="clear-fix"></div>' +
			'</div></div>';
	}
	return html;
}