$(document).ready(function(){
	
	$("#shop_menu_title").on("click",function(){
		$("#shop_menu_list_wrap").slideToggle(800);
		$("#shop_menu_title").find("img").fadeToggle(200);
		$("#shop_menu_up").css("margin-left","492px").fadeToggle(200);
	});
	
	$("#shop_menu_up").on("click",function(){
		$("#shop_menu_title").find("img").fadeIn(200);
		$("#shop_menu_list_wrap").slideUp(800);
		$(this).fadeToggle(200);
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
	
	$("#shop_review_cate_wrap input:checkbox").on("click",function(){
		//console.log($(this).index("input:checked"));
		var check = $(this).index("input:checked");
		//var userChecked = check.is(":checked");
		var labelbg = $($(this) + "label");
		if(check==0){
			$(labelbg).css("opacity","1");
			console.log("check");
		} else if (check==-1) {
			$(labelbg).css("opacity","0.5");
			console.log("Uncheck");
		}
	});
	
});