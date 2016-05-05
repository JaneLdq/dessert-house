$(document).ready(function(){
	
});

function sexFormatter(value, row, index) {
	if(row.sex==1)
		return "男";
	else{
		return "女";
	}    
}

function detailFormatter(value, row, index) {
	return [
	        '<a class="payment" href="javascript:void(0)" title="Payment"><span class="glyphicon glyphicon-plus"></span></a>',
	        '<a class="order" href="javascript:void(0)" title="Order"><span class="glyphicon glyphicon-minus"></span></a>'
	].join(' ');   
}

window.detailEvents = {
	'click .payment': function (e, value, row, index) {
		var id = row.uid;
		$('#js-payment-modal-mid').html(row.mid);
		$('#js-payment-modal-name').html(row.name);
		var url = "/DessertHouse/sale/payment?id=" + id;
		$('#js-payment-table').bootstrapTable('refreshOptions', {
            url: url
        });
		$('#js-payment-table').bootstrapTable('refresh');
	    $('#js-payment-modal').modal();
	},
	'click .order': function (e, value, row, index) {
		var id = row.uid;
		$('#js-order-modal-mid').html(row.mid);
		$('#js-order-modal-name').html(row.name);
		var url = "/DessertHouse/sale/memberOrder?id=" + id;
		$('#js-order-table').bootstrapTable('refreshOptions', {
	        url: url
	    });
		$('#js-order-table').bootstrapTable('refresh');
	    $('#js-order-modal').modal();
	}
}
