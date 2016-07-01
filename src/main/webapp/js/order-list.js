$(document).ready(function(){
	
	$('.js-btn-one-more').click(function(){
//		$.ajax({
//			method: "post",
//			url: "/Tian/order/again",
//			data: {
//				id: 6,
//				date: "2016-07-02",
//				type: 0
//			},
//			success: function (data) {
//
//			}
//		});
	});
	
	$('#js-take-out').click(function(){
		$('#js-address-list').show();
		$('.js-type-selector').hide();
	});
	
	$('#js-customer-pick-up').click(function(){
		$('#js-address-list').hide();
		$('.js-type-selector').show();
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

function getOrderHtml(orders){
	var html = "";
	for (var i = 0; i < orders.length; i++) {
		var order = orders[i];
		html += '<div class="order-item">' +
			'<ul class="order-basic">' +
			'<li class="time">' + order.date + '</li>' +
			'<li class="order-number"><label>订单号：</label>' + order.id + '</li>' +
			'<li class="store"><label>店铺：</label>' +
			'<a class="name" href="' + urlPrefix + '/store/' + order.id + '">' + order.store.name + '</a></li>' +
			'</ul>' +
			'<div class="order-detail">' +
			'<div class="cell o-detail">';
		for (var j = 0; j < order.items.length; j++) {
			var item = order.items[j];
			html += '<ul class="order-dessert-list">' +
				'<li class="cell l-name"><a class="name" ' +
				'href="' + urlPrefix + '/dessert/d/' + item.dessertId + '">' + item.name + '</a></li>' +
				'<li class="cell l-quantity">x'+ item.quantity + '</li>' +
				'<li class="cell l-price">' + item.price.toFixed(1) + '</li>' +
				'<li class="clear-fix"></li>' +
				'</ul>';
		}
		html += '</div>' +
			'<div class="cell o-sum"><i class="fa fa-rmb"></i>' + order.total.toFixed(1) + '</div>' +
			'<div class="cell o-date">' + order.sendDate + '</div>' +
			'<div class="cell o-state">' + order.state + '</div>' +
			'<div class="clear-fix"></div>' +
			'</div>';

		if (order.type == 1) {
			html += '<div class="order-bottom">' +
				'<div class="address left">';
			if (order.sendType == 0) {
				html += '<span><label>收货人：</label>' + order.address.receiver + '</span>' +
					'<span><label>联系电话：</label>' + order.address.tel + '</span>' +
					'<span class="addr"><label>收货地址：</label>' + order.address.address + '</span>';
			} else {
				html += '<span><label>自提</label></span><br/><br/>';
			}
			html += '</div><div class="ops right">';
			if (order.state != '已完成' && order.state != '已退订') {
				html += '<button class="btn btn-sm btn-cancel right" onclick="showCancelModal(this)" oid="' + order.id + '">退订</button>';
			}
			html += '<button class="btn btn-sm right js-btn-one-more" ' +
				'onclick="showOneMoreModal(this)" oid="' + order.id + '">再来一单</button></div>' +
				'<div class="clear-fix"></div></div>';
		}

		html += '</div>';
	}
	return html;
}

function showCancelModal(element){
	var oid = $(element).attr('oid');
	$('#js-order-cancel-submit').attr('oid', oid);
	$('#cancel-modal').modal();
}

function showOneMoreModal(element){
	var min = new Date();
	min.setDate(min.getDate()+1);
	var max = new Date();
	max.setDate(max.getDate()+7);
	var minD = formatNum(min.getDate());
	var minM = formatNum(min.getMonth()+1);
	var maxD = formatNum(max.getDate());
	var maxM = formatNum(max.getMonth()+1);
	$('#js-date').attr("min", min.getFullYear()+"-"+minM+"-"+minD).attr("max", 
			max.getFullYear()+"-"+maxM+"-"+maxD).attr("value", min.getFullYear()+"-"+minM+"-"+minD);
	var oid = $(element).attr('oid');
	$('#js-order-one-more-submit').attr("oid", oid);
	$('#js-one-more-price').html('<i class="fa fa-rmb"></i>'+ $(element).attr("price"));
	$('#one-more-modal').modal();
}

function formatNum(num){
	if(num<10)
		return "0" + num;
	return num;
}

function cancelOrder(element){
	var oid = $(element).attr("oid");
	$.ajax({
		type: "get",
		url: urlPrefix + "/order/cancel",
		data: {
			id: oid
		},
		success: function(data){
			if(data['result'] == 1){
				toaster("订单取消成功！");
				location.reload();
			}else{
				toaster("订单取消失败！");
			}
			$.modal.close();
		}
	});
}

function oneMoreOrder(element){
	var oid = $(element).attr("oid");
	var type = $('.one-more-modal input[name="pick-type"]:checked').val();
	var date = $('#js-date').val();
	$.ajax({
		type: "post",
		url: urlPrefix + "/order/again",
		data:{
			id: oid,
			type: type,
			date: date
		},
		success: function(data){
			if(data['result']==1){
				toaster("订单已提交！");
			}else{
				toaster("再来一单操作失败");
			}
			location.reload();
			$.modal.close();
		}
	});
}