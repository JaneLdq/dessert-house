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
			$(this).addClass('active');
			type = $(this).attr('value');
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
	
});

var page = 1;
var num = 6;
var order = 0;
var type = -1;
var more = true;
var loading = false;


function getDesserts(type, order){
	$.ajax({
		type: "get",
		url: urlPrefix + "/dessert/getDessert",
		data: {
			page: page,
			num: num,
			type: type,
			order: order
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
		type: "get",
		url: urlPrefix + "/dessert/getDessert",
		data: {
			page: page,
			num: num,
			type: type,
			order: order
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

function getDessertHtml(data){
	var html = "";
	if(data == null){
		return html;
	}
	for(var i=0; i<data.length; i++){
		var d = data[i];
		html += '<div class="dessert">' + 
				'<a href="<' + urlPrefix + '/dessert/d/' + d.id + '">' +
				'<img class="dessert-img" src="' + urlPrefix + '/img/dessert/' + d.id + '.jpg" alt="' + d.name + '"></a>' + 
				'<div class="dessert-desc">' +
					'<a href="' + urlPrefix + '/dessert/d/' + d.id + '" class="dessert-name">' + d.name + '</a>' +
					'<span class="dessert-price"><i class="fa fa-rmb"></i>' + d.price + '</span></div></div>';
	}
	return html;
}

