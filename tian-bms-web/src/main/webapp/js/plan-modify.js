$(document).ready(function(){
	
	$('#js-plan-modify-submit').click(function(){
		var plan = getPlanUpdatorJson();
		$.ajax({
			type: "post",
			url: urlPrefix + "/plan/modify",
			datatype: "json",
			data: plan,
			contentType: "application/json; charset=utf-8",
			success: function(data){
				if(data['result']==1){
					toaster("成功修改产品计划，请等待经理审批！");
					setTimeout("toPlan()", 3000);
				}else{
					toaster("修改产品计划过程中出了点小问题，请重新提交！");
				}
			},
			error: function(){
				console.log("创建计划AJAX错误");
			}
		})
	});
	
});


function toPlan(){
	var pid = $('#js-id').html();
	var url = urlPrefix + "/plan/view/" + pid;
	window.history.pushState(null, "查看计划 - 恬", url);
	window.location.href = url;
}

function getPlanUpdatorJson(){
	var pid = $('#js-id').html();
	var rows = $('.js-plan-detail-table tbody').find('tr');
	var items = new Array();
	for(var j=0; j<rows.length; j++){
		var cols = $(rows[j]).find('td');
		var id = Number($(cols[0]).text());
		var dessertId = Number($(cols[1]).text());
		var quantity = Number($($(cols[3]).find('input')).val());
		var price = Number($($(cols[4]).find('input')).val());
		items.push(new planItem(id, dessertId, quantity,price));
	}
	var plan = new planUpdator(pid,items);
	return JSON.stringify(plan);
}

function planItem(id, dessertId,quantity,price) {
	this.id = id;
	this.dessertId = dessertId;
	this.quantity = quantity;
	this.price = price;
}

function planUpdator(id, items){
	this.pid = id;
	this.items = items;
}