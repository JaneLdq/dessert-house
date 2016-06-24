$(document).ready(function(){
	
	updateCartMsg();
	
	navStore();
	
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
	
	$(document).mouseup(function (e) {
        var _con = $("#js-user-popup");   // 设置目标区域
        if (!_con.is(e.target) && _con.has(e.target).length === 0) {
            _con.hide();
        }
    });
	
});

var urlPrefix = "/Tian";


/**
 * 更新导航购物车数量
 */
function updateCartMsg(){
	var result = checkLogin();
	console.log(window.location.href);
	if(result == 1){
		console.log("getTotal" + window.location.href);
		$.ajax({
			type: "POST",
			url: urlPrefix + "/cart/total",
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
		url: urlPrefix + "/auth/check",
		async: false,
		success: function(data){
			result = data;
		}
	})
	return result;
}


/**
 * 将获取的甜品列表转为HTML
 * @param data
 * @returns {String}
 */
function getDessertHtml(data){
	var html = "";
	if(data == null){
		return html;
	}
	var sid = $('.js-nav-current-store').attr('sid');
	for(var i=0; i<data.length; i++){
		var d = data[i];
		html += '<div class="dessert">' + 
				'<a href="' + urlPrefix + '/dessert/d/' + d.id + '/s/' + sid + '">' +
				'<img class="dessert-img" src="' + urlPrefix + '/img/dessert/' + d.id + '.jpg" alt="' + d.name + '"></a>' + 
				'<div class="dessert-desc">' +
					'<a href="' + urlPrefix + '/dessert/d/' + d.id + '/s/' + sid + '" class="dessert-name">' + d.name + '</a>' +
					'<span class="dessert-price"><i class="fa fa-rmb"></i>' + d.price + '</span></div></div>';
	}
	return html;
}


/**
 * 导航门店下拉框
 */
function navStore(){
	$('.js-nav-current-store').on('click', function(){
		$('.js-nav-store-popup').show();
	});
	
	$('.js-nav-store-option').on('click', function(){
		var sname = $(this).html();
		var sid = $(this).attr('sid');
		$('.js-nav-current-store').html(sname + '<i class="fa fa-caret-down"></i>').attr('sid', sid);
		$('.js-nav-store-popup').hide();
		$.ajax({
			type: "post",
			url: urlPrefix + "/user/setDefaultStore",
			data: {
				storeId: sid
			}
		})
	});
	
	$(document).mouseup(function (e) {
        var _con = $(".js-nav-store-popup");   // 设置目标区域
        if (!_con.is(e.target) && _con.has(e.target).length === 0) {
            _con.hide();
        }
    });
	
	
}


function toaster(msg){
	$('.toaster').html(msg);
	$('.toaster').fadeIn();
	setTimeout("$('.toaster').fadeOut()", 2000);
}