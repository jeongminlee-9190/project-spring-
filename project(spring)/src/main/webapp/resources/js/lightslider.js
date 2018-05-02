$(document).ready(function() {
	
    var slider = $('#slider').lightSlider({
        item:5,
        auto:true,
        loop:true,
        slideMove:1,
		slideMargin:0,
        easing: 'cubic-bezier(0.25, 0, 0.25, 1)',
        speed:600,
		pager: false, 
        responsive : [
			{
                breakpoint:420,
                settings: {
                    item:1,
                    slideMove:1
                  }
            }
        ]
    });
	
	$('#slide_rightArrow_btn').click(function(){
        slider.goToNextSlide(); 
    });
	$('#slide_leftArrow_btn').click(function(){
        slider.goToPrevSlide(); 
    });
    
	
	
});