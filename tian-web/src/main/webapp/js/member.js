$(document).ready(function(){
	
	$('#js-submit').click(function(){
		var pass = true;
		var msg = "";
		var name = $('input[name="name"]').val();
		if(name.length == 0){
			$('input[name="name"]').removeClass('success').addClass("error");
			$('#js-name-msg').removeClass('success').addClass("error").html('真实姓名不能为空！').show();
			pass = false;
		}else{
			$('input[name="name"]').addClass("success");
			$('#js-name-msg').removeClass('error').addClass('success').html('<i class="fa fa-check-circle"></i>').show();
		}
		var address = $('input[name="address"]').val();
		if(address.length == 0){
			$('input[name="address"]').removeClass('success').addClass("error");
			$('#js-address-msg').removeClass('success').addClass("error").html('请填写一个默认地址！').show();
			pass = false;
		}else{
			$('input[name="address"]').addClass("success");
			$('#js-address-msg').removeClass('error').addClass('success').html('<i class="fa fa-check-circle"></i>').show();
		}
		var bankcard = $('input[name="bankcard"]').val();
		if(bankcard.length == 0){
			$('input[name="bankcard"]').removeClass('success').addClass("error");
			$('#js-bankcard-msg').removeClass('success').addClass("error").html('银行卡不能为空！').show();
			pass = false;
		}else{
			$('input[name="bancard"]').addClass("success");
			$('#js-bankcard-msg').removeClass('error').addClass('success').html('<i class="fa fa-check-circle"></i>').show();
		}
		var payword = $('input[name="paypassword"]').val();
		if(!checkPayword(payword)){
			$('input[name="paypassword"]').removeClass('success').addClass("error");
			$('#js-payword-msg').removeClass('success').addClass("error").html('支付密码格式不正确！').show();
			pass = false;
		}else{
			$('input[name="paypassword"]').addClass("success");
			$('#js-payword-msg').removeClass('error').addClass('success').html('<i class="fa fa-check-circle"></i>').show();
		}
		if(pass){
			$('#js-member-form').submit();
		}
	});
});


function checkPayword(psw){
	if(!(/^\d{6}$/).test(psw)){
		return false;
	}
	return true;
}
