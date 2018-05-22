$(document).ready(function () {
	var actSwiper = new Swiper ('.swiper-container.m-dessert-swiper', {
		pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay: 15000,
        autoplayDisableOnInteraction: false,
        loop: true
	  }); 
	
	$(window).scroll(function(){
        var scrollTop = $(this).scrollTop();
        var scrollHeight = $(document).height();
        var windowHeight = $(this).height();
        if(scrollTop + windowHeight - scrollHeight > -50){
        	if(more && (!loading)){
        		loading = true;
        		moreDesserts();
        	}
        }
    });
	
	$('.js-type-filter').on('click', function(){
		if(!$(this).hasClass('active')){
			$('.js-type-filter').removeClass('active');
			type = $(this).attr('value');
			if(type != -1){
				$('.js-type-filter[value="' + type + '"]').addClass('active');
			}else{
				$(this).addClass('active');
			}
			order = $('.js-order-filter.active').attr('value');
			page = 0;
			more = true;
			loading = true;
			getDesserts(type, order);
		}
	});
	
	$('.js-order-filter').on('click', function(){
		if(!$(this).hasClass('active')){
			$('.js-order-filter').removeClass('active');
			$(this).addClass('active');
			order = $(this).attr('value');
			type = $('.js-type-filter.active').attr('value');
			page = 0;
			more = true;
			loading = true;
			getDesserts(type, order);
		}
	});
	
	$('#js-search').on('click', function(){
		doSearch();
	});
	
	$('.js-search-input').bind('keypress', function(event){
		if(event.keyCode == 13) {
			doSearch();
        }
	});
	
});

var page = 1;
var num = 6;
var order = 0;
var type = -1;
var more = true;
var loading = false;


function getDesserts(type, order){
	$.ajax({
		type: "post",
		url: urlPrefix + "/dessert/getDessert",
		data: {
			page: page,
			num: num,
			type: type,
			order: order,
			storeId: globalStoreId
		},
		success: function(data){
			var result = data['result'];
			if(result == null || result.length < num){
				more = false;
			}
			page++;
			var html = getDessertHtml(result);
			$('#js-dessert-panel').html(html);
			loading = false;
		},
		error: function(){
			loading = false;
		}
	});
}


function moreDesserts(){
	$.ajax({
		type: "post",
		url: urlPrefix + "/dessert/getDessert",
		data: {
			page: page,
			num: num,
			type: type,
			order: order,
			storeId: globalStoreId
		},
		success: function(data){
			console.log(data);
			var result = data['result'];
			if(result == null || result.length < num){
				more = false;
			}
			page++;
			var html = getDessertHtml(result);
			$('#js-dessert-panel').append(html);
			loading = false;
		},
		error: function(){
			loading = false;
		}
	});
}

function doSearch(){
	var key = $('.js-search-input').val();
	if(key.length == 0)
		return;
	key = encodeURIComponent(key);
	window.location.href = "http://" + window.location.host + urlPrefix + "/dessert/search?key=" + key;
	return false;
}

