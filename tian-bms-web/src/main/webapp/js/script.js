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
	
	$('.js-to-top').click(function() {
        $('body,html').animate({ scrollTop: 0 }, 500);
    });
	
	initNavStore();
	
});

var urlPrefix = "/Tian";
var globalStoreId = 1;

function initNavStore(){
	var sid = $('.js-nav-current-store').attr('sid');
	if( sid == null ){
		globalStoreId = window.localStorage.getItem("storeId");
		var storeName = window.localStorage.getItem("storeName");
		if(globalStoreId == null || storeName == null){
			globalStoreId = 1;
			storeName = $($('.js-nav-store-option').get(0)).html();
		}
		$('.js-nav-current-store').attr("sid", globalStoreId).html(storeName+'<i class="fa fa-caret-down"></i>').show();
	}else{
		globalStoreId = sid;
	}
}

/**
 * 更新导航购物车数量
 */
function updateCartMsg(){
	var result = checkLogin();
	if(result == 1){
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
	var sid = globalStoreId;
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

function jumpToDessertDetail(element){
	var did = $(element).attr('did');
	var url = urlPrefix + "/dessert/d/" + did + "/s/" + globalStoreId;
	window.location.href = url;
	return false;
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
		});
		globalStoreId = sid;
		window.localStorage.setItem("storeId", sid);
		window.localStorage.setItem("storeName", sname);
	});
	
	$(document).mouseup(function (e) {
        var _con = $(".js-nav-store-popup");   // 设置目标区域
        if (!_con.is(e.target) && _con.has(e.target).length === 0) {
            _con.hide();
        }
    });	
}

function addAddress(func){
	var address = $('.address-form input[name="address"]').val();
	var receiver = $('.address-form input[name="receiver"]').val();
	var tel = $('.address-form input[name="tel"]').val();
	var addrData =  {
			receiver: receiver,
			address: address,
			tel: tel
		};
	if(tel.length == 0 || receiver.length == 0 || tel.length == 0){
		return;
	}
	var def = $('#set-default').prop('checked');
	if(def){
		def = 1;
	}else{
		def = 0;
	}
	addrData.setDefault = def;
	$.ajax({
		type: "post",
		url: urlPrefix + "/address/add",
		data: addrData,
		success: function(data){
			addrData.id = data['result'];
			if(func != null){
				func(addrData);
			}
		}
	});
}




function toaster(msg){
	$('.toaster').html(msg);
	$('.toaster').fadeIn();
	setTimeout("$('.toaster').fadeOut()", 2000);
}