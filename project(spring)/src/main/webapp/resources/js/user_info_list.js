
$(document).ready(function(){
	
	$(".login_after").on("click",function(e){
		$("#user_info_list").slideToggle("fast");
		e.preventDefault();
	});
	
	$("#user_info_list li").mouseover(function(){
		$(this).css("color","#ffffff");
	});
	
	$("#user_info_list li").mouseout(function(){
		$(this).css("color","#b2b2b2");
	});
	
	$("#user_info_list li").on("click",function(){
		$("#user_info_list").slideUp("fast");
	});
	
});
