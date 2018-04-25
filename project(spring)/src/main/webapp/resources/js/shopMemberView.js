$(document).ready(function(){
	
	//메뉴 버튼 누르면 메뉴 보이기 sildeToggle
	$("#shop_menu_title").on("click",function(){
		$("#shop_menu_list_wrap").slideToggle(800);
		$("#shop_menu_title").find("img").fadeToggle(200);
		$("#shop_menu_up").css("margin-left","492px").fadeToggle(200);
	});
	
	//메뉴 펼쳐졌을때 하단 닫기 버튼 누르면 메뉴 안보이기
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
	
	//카테고리 리스트 감추기
	$(".shop_list").hide();
	
	//카테고리 버튼 누르면 키워드 보여지기
	$(".shop_cate_btn").on("click", function(){
		$(this).next("ul").slideToggle(300);
		$(this).find("span").fadeToggle(300);
	});
	
	//버튼 클릭시 좋아요/싫어요 보이기
	var choiceArr = [];
	var choiceKeyword;
	var choiceArrIndex;
	
	$(".shop_list li > button").on("click",function(e){
		e.stopPropagation();
		
		//사용자가 선택한 키워드
		choiceKeyword = $(this).text();
		console.log( "choiceKeyword " + choiceKeyword);
		
		choiceArrIndex = choiceArr.indexOf(choiceKeyword);
		
		//버튼 보여지기
		$(this).nextAll("div").show();
		
		//키워드 누르면 키워드 텍스트 하단에 표시 되기		
		if ( choiceArr.length < 6 && choiceArrIndex==-1){
			choiceArr.push(choiceKeyword);
			$("#shop_review_result_keyword").empty();
			for (var i=0; i<choiceArr.length; i++){
				$("#shop_review_result_keyword").append("<div>" + choiceArr[i] + "</div>");
			}
		} else {
			$(this).nextAll("div").hide();
		}
		
	});
	
	// 버튼 안보여지기
	$(".shop_list li > button").nextAll("div").on("click",function(e){
		e.stopPropagation();
		
		choiceKeyword = $(this).siblings("button").attr("data-keyword");
		
		console.log(choiceKeyword);

		$(this).hide();
		$(this).siblings("div").hide();
		$(this).find("input").prop("checked",false).next("label").css("opacity","0.4");
		$(this).siblings("div").find("input").prop("checked",false).next("label").css("opacity","0.4");
		
		//키워드 누르면 키워드 텍스트 하단에 표시 없애기
		
		choiceArrIndex = choiceArr.indexOf(choiceKeyword);
	
		if(choiceArrIndex >=0){
			choiceArr.splice(choiceArrIndex,1);
			$("#shop_review_result_keyword").empty();
			for (var i=0; i<choiceArr.length; i++){
				$("#shop_review_result_keyword").append("<div>" + choiceArr[i] + "</div>");
			}
		}

	});
	
	//버튼 클릭 후 좋아요/싫어요 버튼 클릭 하기
	$("#shop_review_cate_wrap input:checkbox").on("click",function(e){
		e.stopPropagation();
		
		if($(this).prop("checked")){
			
			var labelKey = $(this).next("label");
			$(labelKey).css("opacity","1");
			
			$(this).parent("div").siblings("div").children("input")
				   .prop("checked",false).next("label").css("opacity","0.4");
			$(this).prop("checked",true);
			
		}
		
		$(this).parent("div").show();
		$(this).parent("div").siblings("div").show();
		
		var userChoiceK = $(this).parent("div").siblings("button").text();
		$("#shop_review_result_keyword div > p").text(userChoiceK);
		
	});
	
	//키워드 배경 누르면 키워드 checked풀기
	/*$(this).unbind("click");
	$(".shop_list > li").find("button").nextAll("div").on("click",function(){
		$(this).fadeOut(300);
	});*/
	
	//댓글 더보기
	$(window).on('load', function () {
	    load('#shop_user_allReview_wrap', '3');
	    $("#js-btn-wrap button").on("click", function () {
	        load('#shop_user_allReview_wrap', '3', '#js-btn-wrap');
	    })
	});
	 
	function load(id, cnt, btn) {
	    var girls_list = id + " .js-load:not(.active)"; //active없는애들
	    var girls_list2 = id + " .js-load";
	    var girls_length = $(girls_list).length; //active없는애들 댓글 수
	    var girls_total_cnt;
	    
	    if (cnt < girls_length) {
	        girls_total_cnt = cnt;
	    } else {
	        girls_total_cnt = girls_length;
	        $("#js-btn-wrap button img").attr("src","resources/images/shopInfo_review_close.png");
	    }
	    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	    
	    if (girls_length==0) {
	        girls_total_cnt = cnt;
	        $("#js-btn-wrap button img").attr("src","resources/images/shopInfo_review_more.png");
	        $(girls_list2 + ":gt(" + (girls_total_cnt-1) + ")").removeClass("active");
	    } 
 
	}

	
});