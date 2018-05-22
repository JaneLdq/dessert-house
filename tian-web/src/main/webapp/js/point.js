$(document).ready(function(){
	
	initExchangeModal();
	
	$('#js-point-pre').click(function(){
		var current = Number($('#js-point-current').attr("page"));
		if(current>1){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/points/" + (current-1),
				success: function(data){
					console.log(data);
					var points = data['points'];
					var html = getPointHtml(points);
					$('#js-point-record').html(html);
					$('#js-point-current').attr('page', (current-1)).html(current-1);
				},
				error: function(){
					console.log("获取上一页积分记录失败!");
				}
			})
		}
	});
	
	$('#js-point-next').click(function(){
		var current = Number($('#js-point-current').attr('page'));
		if(current < Number($('#js-point-current').attr('max'))){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/points/" + (current+1),
				success: function(data){
					console.log(data);
					var points = data['points'];
					var html = getPointHtml(points);
					$('#js-point-record').html(html);
					$('#js-point-current').attr('page', (current+1)).html(current+1);
				},
				error: function(){
					console.log("获取下一页积分记录失败!");
				}
			})
		}
	});
});

function initExchangeModal(){
	$('#js-point-input').on('propertychange input', function(){
		var value = Number($(this).val());
		var max = Number($(this).attr('max'));
		if(value <= max){
			$('#js-point-to-rmb').html(Number(value/10));
		}else{
			$(this).val(max);
			$('#js-point-to-rmb').html(Number(max/10));
		}
	});
	
	$('#js-exchange-submit').click(function(){
		var value = Number($('#js-point-input').val());
		if(value > 0){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/exchange",
				data: {
					point: value
				},
				success: function(data){
					console.log(data);
					if(data['result']==1){
						$('#js-point').html(data['point']);
						$('#js-modal-point').html(data['point']);
						$('#js-info-point').html(data['point']);
						$('#js-info-balance').html(data['balance']);
						var points = data['pointlist'];
						var html = getPointHtml(points);
						var page = data['page'];
						$('#js-point-record').html(html);
						$('#js-point-current').attr('page', page).html(page);
						$('#point-msg-modal .modal-content').html("(≧∇≦)ﾉ  兑换成功！");
						$('#point-msg-modal').modal();
					} else {
						$('#point-msg-modal .modal-content').html("兑换失败0.0 请稍后再试~");
						$('#point-msg-modal').modal();
					}
				},
				error: function(){
					console.log("积分兑换AJAX错误！");
				}
			});
		}
	});
}

function getPointHtml(points){
	var html = '<tr class="table-head"><th class="date">日期</th><th class="budget">收入/支出</th>' 
		+ '<th class="desc">详细说明</th></tr>';
	for(x in points){
		var p = points[x];
		html += '<tr class="table-row"><td class="date">'+ p['created_at']
		+ '</td><td class="budget';
		if(p['type']==0){
			html += ' plus">+' + p['value'] + '</td><td class="desc">购物获得积分</td>';
		} else {
			html += ' minus">-' + p['value'] + '</td><td class="desc">积分兑换</td>';
		}
	}
	return html;
}