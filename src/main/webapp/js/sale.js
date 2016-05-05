$(document).ready(function(){
	
	setInterval("showRealTime()",1000)
	
	$('#js-add-dessert-btn').click(function(){
		var quantity = $('input[name="quantity"]').val();
		var dessertId = $('input[name="dessert"]').val();
		var storeId = $('#js-store-id').attr('store-id');
		if(Number(quantity) >= 1 && (dessertId != "")){
			$.ajax({
				type: "get",
				url: urlPrefix + "/dessert/check",
				data: {
					id: dessertId,
					storeId: storeId
				},
				success: function(data){
					if(data['result']==1){
						addRow(data['dessert'], Number(quantity));
					} else {
						$('#js-add-error-msg').html("查找不到该编号商品信息，请检查编号是否正确");
					}
				}
			})
		}
	});
	
	$('#js-member-id').on("propertychange input change", function(){
		var id = $(this).val();
		var reg=/^[0-9]{6}$/;
		if(reg.test(id)){
			$.ajax({
				type: "get",
				url: urlPrefix + "/user/getMember",
				data: {
					id: "V"+id
				},
				success: function(data){
					if(data['result']==1){
						$('#js-member-id').attr('mid', data['member'].mid);
						$('#js-add-member-msg').html("<span class='correct glyphicon glyphicon-ok'></span>").show();
						updateSum();
					}else{
						$('#js-add-member-msg').html("未找到会员信息").show();
					}
				}
			})
		}else{
			$('#js-discount').html(0);
			$('#js-final-total').html($('#js-total').html());
			$('#js-add-member-msg').hide();
		}
	});
	
	$('#js-sale-submit').click(function(){
		var order = getOrderJson();
		console.log(order);
		$.ajax({
			type: "post",
			url: urlPrefix + "/sale/create",
			datatype: "json",
			data: order,
			contentType: "application/json; charset=utf-8",
			success: function(data){
				if(data['result']==1){
					toaster("销售完成！");
					setTimeout("window.location.reload()",2000);
				}else{
					toaster("销售提交过程中出了点小问题，请重新提交！");
				}
			}
		})
	});
})

function addRow(dessert,quantity){
	var table = $('#js-sale-item-table');
	var row = table.bootstrapTable('getRowByUniqueId', dessert.id);
	var total = Number($('#js-total').html());
	if(row != null){
		var sum = row.quantity + quantity;
		table.bootstrapTable('updateByUniqueId', {
            id: row.id,
            row: {
                quantity: sum
            }
        });
		total += quantity*row.price;
	} else {
		row = {
			id: dessert.id,
			name: dessert.name,
			quantity: quantity,
			price: dessert.price
		}
		table.bootstrapTable('append', row);
		total += quantity * dessert.price;
	}
	$('#js-total').html(total);
	updateSum();
	table.bootstrapTable('refresh');
}

function removeFormatter(value, row) {
    return '<a class="remove" href="javascript:void(0)" title="Remove"><i class="glyphicon glyphicon-remove"></i></a> ';
}

function getOrderJson(){
	var mid = $('#js-member-id').attr('mid');
	if(typeof(mid) == "undefined"){
		mid = null;
	}
	var rows = $('#js-sale-item-table tbody').find('tr');
	var items = new Array();
	for(var j=0; j<rows.length; j++){
		var cols = $(rows[j]).find('td');
		var dessertId = Number($(cols[0]).text());
		var quantity = Number($(cols[2]).text());
		items.push(new orderItem(dessertId, quantity));
	}
	var order = new orderCreator(mid,items);
	return JSON.stringify(order);
}

function orderCreator(mid,items){
	this.mid = mid;
	this.items = items;
}

function orderItem(dessertId, quantity){
	this.dessertId = dessertId;
	this.quantity = quantity;
}

function updateSum(){
	var total = Number($('#js-total').html());
	var id = $('#js-member-id').attr('mid');
	if(typeof(id) == "undefined"){
		$('#js-final-total').html(total);
		return;
	}
	$.ajax({
		type: "POST",
		url: urlPrefix + "/sale/sum",
		data: {
			total: total,
			mid: id
		},
		success: function(data){
			if(data['result']==1){
				$('#js-discount').html(data['discount']);
				$('#js-final-total').html(total-data['discount']);
			} else {
				$('#js-discount').html(0);
				$('#js-final-total').html(total);
			}
		}
	})
}

window.removeEvents = {
	    'click .remove': function (e, value, row, index) {
	    	var sum = row.quantity * row.price;
	    	var total = Number($('#js-total').html());
	    	$('#js-total').html(total-sum);
	    	updateSum();
	    	$('#js-sale-item-table').bootstrapTable('removeByUniqueId', row.id);
	    }
};
