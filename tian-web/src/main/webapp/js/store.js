$(document).ready(function(){
	
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
	
});

var page = 1;
var num = 6;
var more = true;
var loading = false;
storeId = $('#js-store-id').val();

function moreDesserts(){
	$.ajax({
		type: "post",
		url: urlPrefix + "/dessert/getDessert",
		data: {
			page: page,
			num: num,
			type: -1,
			order: 0,
			storeId: $('#js-store-id').val()
		},
		success: function(data){
			var result = data['result'];
			if(result == null || result.length < num){
				more = false;
			}
			page++;
			var html = getDessertHtml(result);
			$('.js-dessert-panel').append(html);
			loading = false;
		},
		error: function(){
			loading = false;
		}
	});
}