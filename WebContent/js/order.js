$(document).ready(function(){
	
	$(".panel").children(".tab-panel").hide();
	$($(".panel").children(".tab-panel").eq(0)).show();
	$(".tab-list").children("li").bind("click", function() {
		if($(this).hasClass("active") == false) {
			$(".tab-list").children("li").eq(currentIndex).removeClass("active");
	        $(this).addClass("active");
	        var newIndex = $(this).index();
	        var panels = $(".order-panel").children(".tab-panel");
	        panels.eq(currentIndex).hide();
	        currentIndex = newIndex;
	        var panel = panels.eq(newIndex);
	        panel.children(0).css("opacity", 0);
	        panel.children(0).animate({opacity: "1"}, 100);
	        panel.show();
	    }
	});
	
});

