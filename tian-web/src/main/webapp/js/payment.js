$(document).ready(function(){
	$('#js-payment-pre').click(function(){
		var current = Number($('#js-payment-current').attr("page"));
		if(current>1){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/payments/" + (current-1),
				success: function(data){
					console.log(data);
					var payments = data['payments'];
					var html = getPaymentHtml(payments);
					$('#js-payment-record').html(html);
					$('#js-payment-current').attr('page', (current-1)).html(current-1);
				},
				error: function(){
					console.log("获取上一页缴费记录失败!");
				}
			})
		}
	});
	
	$('#js-payment-next').click(function(){
		var current = Number($('#js-payment-current').attr('page'));
		if(current < Number($('#js-payment-current').attr('max'))){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/payments/" + (current+1),
				success: function(data){
					console.log(data);
					var payments = data['payments'];
					var html = getPaymentHtml(payments);
					$('#js-payment-record').html(html);
					$('#js-payment-current').attr('page', (current+1)).html(current+1);
				},
				error: function(){
					console.log("获取下一页缴费记录失败!");
				}
			})
		}
	});
});

function getPaymentHtml(payments){
	var html = '<tr class="table-head"><th class="date">日期</th>' 
		+ '<th class="value">金额（元）</th></tr>';
	for(x in payments){
		var p = payments[x];
		html += '<tr class="table-row"><td class="date">'+ p['created_at']
		+ '</td><td class="budget">' + p['value'] + '</td>';
	}
	return html;
}