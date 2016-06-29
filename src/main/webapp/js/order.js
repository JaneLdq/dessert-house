$(document).ready(function(){
	
	$('.js-add-address').click(function(){
		$('#address-modal').modal();
	});

	$('#js-order-submit').click(function(){
		$('#charge-msg-modal').modal();
	})

	$('.js-btn-one-more').click(function(){
		$('#one-more-modal').modal();
	})
});

