$(document).ready(function(){
	$('.create-plan-title').hide();
	
	$('#js-store-selector').on('change', function(){
		var store = $(this).val();
		console.log(store);
		$.ajax({
			type: "get",
			url: urlPrefix + "/plan/getLatestPlanDate",
			data:{
				sid: store
			},
			success: function(data){
				console.log(data);
				$('#js-date-selector').attr('min', data['date']).val(data['date']);
			}
		})
	});
	
	$('#js-create-plan-submit').click(function(){
		var store = $('#js-store-selector').val();
		var date = $('#js-date-selector').val();
		if(store == "" || date == ""){
			toaster("请选择店面和日期！");
			return;
		}
		var tabs = $('#js-plan-tabs li');
		for(var i=0; i<tabs.length; i++){
			$(tabs[i]).children('a').html(getDate(date, i));
		}
		$('#js-selected-store').attr('sid',store).html($('#js-store-selector option:selected').text());
		$('#js-selected-date').html(date);
		$('.js-plan-option').hide();
		$('.js-plan-title').show();
		$('.create-plan-panel').show();
	});
	
	$('#js-modify-option').click(function(){
		$('#js-create-plan-submit').html("确定修改");
		$('.js-plan-title').hide();
		$('.js-plan-option').show();
	});
	
	$('#js-plan-submit').click(function(){
		var plan = getPlanJson();
		$.ajax({
			type: "post",
			url: urlPrefix + "/plan/create",
			datatype: "json",
			data: plan,
			contentType: "application/json; charset=utf-8",
			success: function(data){
				if(data['result']==1){
					toaster("成功创建产品计划，请等待经理审批！");
					setTimeout("toPlanList()", 3000);
				}else{
					toaster("创建产品计划过程中出了点小问题，请重新提交！");
				}
			},
			error: function(){
				console.log("创建计划AJAX错误");
			}
		})
	});
});

function getPlanJson(){
	var store = $('#js-selected-store').attr("sid");
	var tabs = $('.js-plan-tab');
	var tables = $('.js-plan-detail-table tbody');
	var plans = new Array();
	for(var i=0; i<7; i++){
		var date = $(tabs[i]).html();
		console.log(date);
		var rows = $(tables[i]).find('tr');
		var items = new Array();
		for(var j=0; j<rows.length; j++){
			var cols = $(rows[j]).find('td');
			var id = Number($(cols[0]).text());
			var quantity = Number($($(cols[2]).find('input')).val());
			var price = Number($($(cols[3]).find('input')).val());
			items.push(new planItem(id, quantity,price));
		}
		plans.push(new plan(store,date,items));
	}
	console.log(JSON.stringify(plans));
	return JSON.stringify(plans);
}

function toPlanList(){
	window.location.href= urlPrefix + "/plan";
}

function getDate(date,days){
	var d = new Date(date);
	d.setDate(d.getDate()+days);
	return d.getFullYear() + "-" + (Number(d.getMonth())+1) + "-" + d.getDate();
}

function planItem(id,quantity,price) {
	this.dessertId = id;
	this.quantity = quantity;
	this.price = price;
}

function plan(sid, date, items) {
	this.sid = sid;
	this.date = date;
	this.items = items;
}