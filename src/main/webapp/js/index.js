$(document).ready(function () {
	var actSwiper = new Swiper ('.swiper-container.activity-swiper', {
		pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay: 5000,
        autoplayDisableOnInteraction: false,
        loop: true
	  }); 
	
	var newSwiper = new Swiper ('.swiper-container.new-swiper', {
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 10000,
        autoplayDisableOnInteraction: false
	  }); 
	
	$(".new-item-content p").each(function(i){
		var str = $(this).text();
		var len = str.length;
		console.log(len);
		if(len > 42){
			str = str.substring(0,41);
			$(this).html(str + "...");
		}
	});
	
});