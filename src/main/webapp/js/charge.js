$(document).ready(function(){

	var bankId = $("#js-bank-id").html();
	bankId = bankId.replace(/(\d{4})/g,'$1 ').replace(/\s*$/,'');
	$("#js-bank-id").html(bankId);
	
	$('#js-submit').click(function(){
		var password = $('input[name="password"]').val();
		var value = $('input[name="value"]').val();
		var min = Number($('input[name="value"]').attr('min'));
		var method = $(this).attr("method");
		if((password.length > 0 )&& (value.length > 0)){
			console.log(min+" "+value);
			if(Number(value) < min){
				$('#charge-msg-modal .modal-content').html("最少充值金额不得低于<span class='highlight'>" +
						"<i class='fa fa-rmb'></i> "+min+"</span>");
				$('#charge-msg-modal').modal();
			}else{
				$.ajax({
					type: "post",
					url: urlPrefix + "/user/" + method ,
					data: $('#js-charge-form').serialize(),
					success: function(data){
						if(data['result']==1) {
							if(data['state']==1){
								$('#js-lock').hide();
							}
							$('#js-info-balance').html(data['balance']);
							$('#js-info-level').html(data['level']);
							if(data['validity']){
								$('#js-info-validity').html(data['validity']);
							}
							$('#charge-msg-modal .modal-content').html("(≧∇≦)ﾉ  操作成功！" +
									"<a href='" + urlPrefix + "/user/payments'>查看缴费记录</a>");
							$('#charge-msg-modal').modal();
						} else {
							$('#charge-msg-modal .modal-content').html("操作失败，请确认密码正确并检查网络状态");
							$('#charge-msg-modal').modal();
						}
					},
					error: function(){
						console.log("充值Ajax错误！");
					}
				});
				$('#js-reset').click();
			}
		} else {
			$('#charge-msg-modal .modal-content').html("请输入密码和金额！");
			$('#charge-msg-modal').modal();
		}
	});
	
});