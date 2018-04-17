$(document).ready(function(){
	
	$("#shop_menu_title").on("click",function(){
		$("#shop_menu_list_wrap").slideToggle("slow");
		$("#shop_menu_title").find("img").fadeToggle("slow");
		/*$("#shop_menu_title").css({"border-bottom-right-radius":"0px",
								   "border-bottom-left-radius":"0px"});
		
		var menuUp = 1;
		if(menuUp == 1){
			$("#shop_menu_title").css({"border-bottom-right-radius":"10px",
				   "border-bottom-left-radius":"10px"});
		}*/
	});
	
	$("#shop_menu_up").on("click",function(){
		$("#shop_menu_list_wrap").slideUp("slow");
		$("#shop_menu_title").find("img").fadeIn("slow");
	});
	
});