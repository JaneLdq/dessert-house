$(document).ready(function(){
	$('table').on('click-row.bs.table', function (e,row) {
		var id = row.id;
	    getOrderDetail(id);
	});
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

function getOrderDetail(id){
	$.ajax({
    	type:"get",
    	url: urlPrefix + "/sale/orderDetail",
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

function detailFormatter(value, row, index) {
	return row.id;
}