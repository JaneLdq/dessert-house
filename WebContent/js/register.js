$(document).ready(function(){
	
	var msg = $('#js-error-msg').html();
	if(msg.length > 0){
		$('#js-error-msg').show();
	}
	
	$('#js-submit').click(function(){
		var pass = true;
		var msg = "";
		var tel = $('input[name="tel"]').val();
		if(!checkPhone(tel)){
			msg += "· 手机号无效<br>";
			pass = false;
		}
		var psw = $('input[name="password"]').val();
		if(!checkPsw(psw)){
			msg += "· 密码格式错误<br>";
			pass = false;
		}
		var nickname = $('input[name="nickname"]').val();
		if(nickname.length == 0){
			msg += "· 昵称不能为空哦~";
			pass = false;
		}
		if(!pass){
			$('#js-error-msg').html(msg).show();
		}else{
			$('#js-error-msg').hide();
			$('#js-reg-form').submit();
			return false;
		}
	});
	
	console.log(checkPayword("123456"));
});

function checkPayword(psw){
	if(!(/^\d{6}$/).test(psw)){
		return false;
	}
	return true;
}

function checkPsw(psw){
	if(!(/^[0-9A-Za-z]{6,16}$/).test(psw)){
		return false;
	}
	return true;
}

function checkPhone(phone){ 
    if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){ 
        return false; 
    } 
    return true;
}