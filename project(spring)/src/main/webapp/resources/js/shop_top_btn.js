$(document).ready(function(){
	
	// 탑 버튼 숨김
	$("#shop_top_btn").hide();
	
	$(window).scroll(function () {
        if ($(this).scrollTop() > 150) { // 스크롤 내릴 표시
        	$("#shop_top_btn").fadeIn(200);
        } else {
        	$("#shop_top_btn").fadeOut(200);
        }
    });
	
	$("#shop_top_btn").on("click",function(){
		
		var scrollPosition = $("#search_header").offset().top;
		
		$("html, body").animate({
	        scrollTop: scrollPosition
		}, 800);
		
	});
	
});

