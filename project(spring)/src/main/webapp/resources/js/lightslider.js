$(document).ready(function() {
	
    var slider = $('#slider').lightSlider({
        item:3,
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
	
	$('#ev_arrow2').click(function(){
        slider.goToNextSlide(); 
    });
	$('#ev_arrow1').click(function(){
        slider.goToPrevSlide(); 
    });
    
	
	
});