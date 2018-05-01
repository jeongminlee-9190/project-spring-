$(document).ready(function(){
	
	// 좋아요, 평가 맛집 background
	$(".myList_wrap").hover(function(){
		$(this).stop().animate({
			backgroundSize:"480px"
		}, 400);
	}, function(){
		$(this).stop().animate({
			backgroundSize:"536px"
		}, 400);
	});
	
	$("#searchList_wrapper").hide();
	
	$("#myList_like").click(function(){
		$("#searchList_wrapper").show();
		
		$("#myListResult_title").text("내가 좋아요한 맛집").css("margin-left","405px");
	});
	
	$("#myList_review").click(function(){
		$("#searchList_wrapper").show();
		
		$("#myListResult_title").text("내가 평가한 맛집").css("margin-left","415px");
	});
	
});
