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
			'<li class="time">' + order.date + ' </li>' +
			'<li class="order-number"><label>订单号：</label>' + order.id + '</li>' +
			'<li class="store"><label>店铺：</label>' +
			'<a class="name" href="' + urlPrefix + '/store/' + order.id + '">' + order.store.name + '</a></li>';
		if (order.type == 1) {
			html += '<li class="btn btn-sm js-btn-one-more" >再来一单</li>';
		}
		if (order.type ==1 && order.state != '已完成' && order.state != '已退订') {
			html += '<li class="btn btn-sm js-btn-cancel" >退订</li>';
		}
		html += '</ul>' +
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

function showCancelModal(element){
	var oid = $(element).attr('oid');
	$('#js-order-cancel-submit').attr('oid', oid);
	$('#cancel-modal').modal();
}

function showOneMoreModal(element){
	var oid = $(element).attr('oid');
	$('#one-more-modal').modal();
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