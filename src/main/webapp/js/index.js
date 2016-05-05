$(document).ready(function () {
	var actSwiper = new Swiper ('.swiper-container.activity-swiper', {
		pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay: 15000,
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
	
});