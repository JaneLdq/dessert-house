$(document).ready(function(){
	
	$('#js-submit').click(function(){
		var pass = true;
		var tel = $('input[name="tel"]').val();
		if(!checkPhone(tel)){
			$('input[name="tel"]').removeClass('success').addClass("error");
			$('#js-tel-msg').removeClass('success').addClass("error").html('手机号格式不正确！').show();
			pass = false;
		}else{
			$('input[name="tel"]').addClass("success");
			$('#js-tel-msg').removeClass('error').addClass('success').html('<i class="fa fa-check-circle"></i>').show();
		}
		var psw = $('input[name="password"]').val();
		if(!checkPsw(psw)){
			$('input[name="password"]').removeClass('success').addClass("error");
			$('#js-psw-msg').removeClass('success').addClass("error").html('密码格式不正确！').show();
			pass = false;
		}else{
			$('input[name="password"]').addClass("success");
			$('#js-psw-msg').removeClass('error').addClass('success').html('<i class="fa fa-check-circle"></i>').show();
		}
		var nickname = $('input[name="nickname"]').val();
		if(nickname.length == 0){
			$('input[name="nickname"]').removeClass('success').addClass("error");
			$('#js-nickname-msg').removeClass('success').addClass("error").html('昵称不能为空！').show();
			pass = false;
		}else{
			$('input[name="nickname"]').addClass("success");
			$('#js-nickname-msg').removeClass('error').addClass('success').html('<i class="fa fa-check-circle"></i>').show();
		}
		if(pass){
			$('#js-reg-form').submit();
			return false;
		}
	});

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