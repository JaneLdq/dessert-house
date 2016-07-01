$(document).ready(function(){
	$('#js-cancel').click(function(){
		$.ajax({
			type:"post",
			url: urlPrefix + "/user/cancel",
			success: function(data){
				console.log(data);
				if(data['result']==1){
					window.location.reload();
				}else{
					toaster("操作失败");
				}
			}
		});
	});
	var bankId = $("#js-bank-id").html();
	bankId = bankId.replace(/(\d{4})/g,'$1 ').replace(/\s*$/,'');
	$("#js-bank-id").html(bankId);
})