$(document).ready(function(){
	var key = $('#js-search-input').val();
	var url = urlPrefix + "/dessert/search?key=" + encodeURIComponent(key);
    url = encodeURI(url);
    window.history.replaceState(null, document.title, url); 
    
	$('#js-search').on('click', function(){
		search();
	});
	
	$('#js-search-input').bind('keypress', function(event){
		if(event.keyCode == 13) {
			search();
        }
	});
	
	$('.js-type-filter').on('click', function(){
		if(!$(this).hasClass('active')){
			$('.js-type-filter').removeClass('active');
			$(this).addClass('active');
			type = $(this).attr('value');
			search();
		}
	});
    
})

var type = -1;

function search(){
	var key = $('.js-search-input').val();
	if(key.length == 0)
		return;
	$.ajax({
		type: "post",
		url: urlPrefix + "/dessert/search",
		data: {
			type: type,
			key: key
		},
		success: function(data){
			var result = data['result'];
			var html = getDessertHtml(result);
			$('#js-dessert-panel').html(html);
		}
	});
}