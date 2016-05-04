$(document).ready(function(){
	updateCartMsg();
	
	$('#js-user').click(function(){
		if($('#js-user-popup').is(":hidden")){
			$('#js-user-popup').show();
		}else{
			$('#js-user-popup').hide();
		}
	});
	
	$('#js-user-popup').mouseleave(function(){
		$(this).hide();
	});
	
});

function updateCartMsg(){
	var result = checkLogin();
	console.log(window.location.href);
	if(result == 1){
		console.log("getTotal" + window.location.href);
		$.ajax({
			type: "POST",
			url: "/DessertHouse/cart/total",
			success: function(data){
				if(data != 0)
					$('.js-cart-msg').html(data).show();
				else{
					$('.js-cart-msg').hide();
				}
			}
		});
	}
}

function checkLogin(){
	var result = 0;
	$.ajax({
		type: "GET",
		url: "/DessertHouse/auth/check",
		async: false,
		success: function(data){
			result = data;
		}
	})
	return result;
}

function toaster(msg){
	$('.toaster').html(msg);
	$('.toaster').fadeIn();
	setTimeout("$('.toaster').fadeOut()", 2000);
}