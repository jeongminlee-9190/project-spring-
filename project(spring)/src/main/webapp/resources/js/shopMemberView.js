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
	
	//카테고리 리스트 감추기
	$(".shop_list").hide();
	
	//카테고리 버튼 누르면 보여지기
	$(".shop_cate_btn").on("click", function(){
		$(this).next("ul").slideToggle(300);
		$(this).find("span").fadeToggle(300);
	});
	
	//버튼 클릭시 좋아요/싫어요 보이기
	$(".shop_list li > button").on("click",function(){
		$(this).nextAll("div").fadeToggle(300);
	});
	
	//버튼 클릭 후 좋아요/싫어요 버튼 클릭 하기
	$("#shop_review_cate_wrap input:checkbox").on("click",function(){
		var check = $(this).index(":checked");
		//console.log($(this).index("input:checked"));
		
		var labelKey = $(this).prop("checked",true).next("label");
		console.log(labelKey);
		
		if(check==0 && $(this).prop("checked",true)){
			
			$(labelKey).css("opacity","1");
			console.log(check);
			
			$(this).parent("div").siblings("div").children("input")
				   .prop("checked",false).next("label").css("opacity","0.4");
			$(this).prop("checked",true);
			
		} else if (check==-1 && $(this).prop("checked",false)){
			
			$(labelKey).css("opacity","0.4");
			console.log(check);
			
			$(this).parent("div").siblings("div").children("input")
				   .prop("checked",true).next("label").css("opacity","1");
			$(this).prop("checked",false);
			
		}
	});
	
});