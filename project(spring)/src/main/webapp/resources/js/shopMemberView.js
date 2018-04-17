$(document).ready(function(){
	
	$("#shop_menu_title").on("click",function(){
		$("#shop_menu_list_wrap").slideToggle("slow");
		$("#shop_menu_title").find("img").fadeToggle("slow");
		$("#shop_menu_up").find("img").fadeIn("slow");
	});
	
	$("#shop_menu_up").on("click",function(){
		$("#shop_menu_list_wrap").slideUp("slow");
		$("#shop_menu_title").find("img").fadeIn("slow");
	});
	
	//사용자가 키워드 good, bad 클릭
	/*$("#reviewContentSubmit").on("submit",function(evt){
		if(${empty login}){
	    alert("로그인을 하세요");
			evt.preventDefault();
		}
	});*/
	$(".meal").on("click", function(){
	  if($(this).prop('checked')){
	    $(".meal").prop('checked',false);
	    $(this).prop('checked',true);
	  }
	});
	$(".together").on("click", function(){
	  if($(this).prop('checked')){
	    $(".together").prop('checked',false);
	    $(this).prop('checked',true);
	  }
	});
	$(".date").on("click", function(){
	  if($(this).prop('checked')){
	    $(".date").prop('checked',false);
	    $(this).prop('checked',true);
	  }
	});
	$(".party").on("click", function(){
	  if($(this).prop('checked')){
	    $(".party").prop('checked',false);
	    $(this).prop('checked',true);
	  }
	});
	
});