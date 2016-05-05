$(document).ready(function(){
	
	$('#js-submit').click(function(){
		var pass = true;
		var msg = "";
		var name = $('input[name="name"]').val();
		if(name.length == 0){
			msg += "· 真实姓名不能为空~";
			pass = false;
		}
		var address = $('input[name="address"]').val();
		if(address.length == 0){
			msg += "· 地址不能为空~";
			pass = false;
		}
		var bankcard = $('input[name="bankcard"]').val();
		if(bankcard.length == 0){
			msg += "· 银行卡账号不能为空~";
			pass = false;
		}
		var payword = $('input[name="paypassword"]').val();
		if(!checkPayword(payword)){
			msg += "· 支付密码格式不对哦~";
			pass = false;
		}
		if(!pass){
			$('#js-error-msg').html(msg).show();
		}else{
			$('#js-error-msg').hide();
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
