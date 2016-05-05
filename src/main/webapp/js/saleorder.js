$(document).ready(function(){
	
})


function showOrderDetail(order){
	$('#js-order-id').html(order['id']);
	$('#js-order-date').html(order['date']);
	$('#js-order-store').html(order['storeId']);
	$('#js-order-mid').html(order['mid']);
	$('#js-order-member-name').html(order['memberName']);
	$('#js-order-total').html(order['total']);
	$('#js-order-discount').html(order['discount']);
	$('#js-order-detail-table').bootstrapTable('load',order['items']);
}

function detailFormatter(value, row, index) {
	return [
	        '<a class="detail" href="javascript:void(0)" title="Detail">',
			row.id,
			'</a>'
	].join('');  
}

window.detailEvents = {
	'click .detail': function (e, value, row, index) {
        var id = row.id;
        $.ajax({
        	type:"get",
        	url: "/DessertHouse/sale/orderDetail",
        	data: {
        		id: id
        	},
        	success:function(data){
        		console.log(data);
        		if(data['result']==1){
        			showOrderDetail(data['order']);
        		}else{
        			toaster("获取详细数据的过程出了点小问题，请稍后再尝试！");
        		}
        	}
        });
    }
}