import {countInterest, countReview} from './util.js';

$(document).ready(function(){
	
	//좋아요 개수  import from util.js
	countInterest($('#shop_title_like > span:first-child').attr('data-sCode'));
	
	//리뷰 개수 import from util.js
	countReview();
	
	if($('#shop_review_my_write').length > 0){
		$('#reviewWriteForm').hide();
	}
	
	$("#shop_review_delete").on("click",function(){
		var data = {
				'rvNum':$(this).attr("data-rvNum"),
				'sCode':$(this).attr("data-sCode"),
				'mName':$(this).attr("data-mName")
			}
		$.ajax({
			url:'deleteReview',
			method:'post',
			contentType:'application/json',
			data:JSON.stringify(data)
		});
		$('#shop_review_my_write_wrap').empty();
		$('#reviewWriteForm').slideDown();
		countReview();
//		location.reload();
	});
	
	$('#shop_review_update').on('click',function(){
		$('#reviewWriteForm').slideToggle();
		$('#review_write_form').val($('#allReview_my_rvContent').text())
	});
	
	
	
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
	
	//카테고리 버튼 누르면 키워드 보여지기
	var keyword_good_user = "keyword_good_user";
	var keyword_bad_user = "keyword_bad_user";
	var num;
	
	$(document).on("click",".shop_cate_btn", function(){
		$(this).next("ul").slideToggle(300);
		$(this).find("span").fadeToggle(300);
	});
		
	//버튼 클릭시 좋아요/싫어요 보이기
	var choiceArr = [];
	var choiceKeyword;
	var choiceArrIndex;
	var n = 0;
	$(document).on("click",".shop_list li > button",function(e){
		e.stopPropagation();
		
		//버튼 보여지기
		$(this).nextAll("div").show();
		
	});
	
	//좋아요, 싫어요 누르면 하단에 텍스트 및 좋아요/싫어요 표시되기
	$(document).on("click",".shop_list li > div input:checkbox",function(e){
		//사용자가 선택한 키워드
		choiceKeyword = $(this).parent("div").siblings("button").text();
		choiceArrIndex = choiceArr.indexOf(choiceKeyword);
		console.log(choiceKeyword);
		
		//텍스트 하단에 표시 되기		
		if ( choiceArr.length < 6 && choiceArrIndex==-1){
			choiceArr.push(choiceKeyword);
			
			for (var i=0; i<1; i++){
				$("#shop_review_result_keyword")
				.append("<div><p>" + choiceArr[i+n] + "</p>" +
						"<img src=''>" +
						"<button type='button' data-keyword='" + choiceArr[i+n] + "'>" +
						"<img src='resources/images/shopInfo_review_keyword_del.png'>" +
						"</button></div>");
			}
			n++;
		}
	
	});
	
	//버튼 클릭 후 좋아요/싫어요 버튼 클릭 하기
	var GBchoice;
	var GBresult;
	//좋아요
	$(document).on("click",".shop_list li div:nth-child(2) input:checkbox",function(e){
		e.stopPropagation();

		GBchoice = $(this).parent("div").prev("button").text();
		
		GBresult = $("#shop_review_result_keyword > div button[data-keyword='" + GBchoice + "']")
					.prev("img").prev("p").text();
		
		if($(this).prop("checked",true) && GBresult.match(GBchoice)){
			$(this).next("label").css("opacity","1");
			$(this).parent("div").siblings("div").children("input")
			   .prop("checked",false).next("label").css("opacity","0.4");
			
			$("#shop_review_result_keyword > div button[data-keyword='" + GBchoice + "']").prev("img")
					.attr("src","resources/images/shopInfo_review_Rgood.png");

		} 

		
	});
	
	//싫어요
	$(document).on("click",".shop_list li div:last-child input:checkbox",function(e){
		e.stopPropagation();

		GBchoice = $(this).parent("div").prev("div").prev("button").text();
		
		GBresult = $("#shop_review_result_keyword > div button[data-keyword='" + GBchoice + "']")
					.prev("img").prev("p").text();

		if ($(this).prop("checked",true) && GBresult.match(GBchoice)){
			$(this).next("label").css("opacity","1");
			$(this).parent("div").siblings("div").children("input")
			   .prop("checked",false).next("label").css("opacity","0.4");
			
			$("#shop_review_result_keyword > div button[data-keyword='" + GBchoice + "']").prev("img")
			.attr("src","resources/images/shopInfo_review_Rbad.png");

		}

		
	});
	
	// x버튼 누르면 해당 키워드 버튼 안보여지기, 키워드 텍스트 하단에 표시 없애기
	$(document).on("click","#shop_review_result_keyword div button", function(){
		
		choiceKeyword = $(this).prev("img").prev("p").text();
		console.log(choiceKeyword);
		
		// x버튼 누르면 키워드 좋아요,싫어요 버튼 표시 없애기
		$(".shop_list li > button[data-keyword='" + choiceKeyword + "']" ).nextAll("div").fadeOut(300);
		$(".shop_list li > button[data-keyword='" + choiceKeyword + "']" )
			.nextAll("div").find("input").prop("checked",false).next("label").css("opacity","0.4");
		
		// x버튼 누르면 키워드 텍스트 하단에 표시 없애기
		choiceArrIndex = choiceArr.indexOf(choiceKeyword);
		console.log("choiceArrIndex:::" + choiceArrIndex);
		if(choiceArrIndex >=0){
			
			$("#shop_review_result_keyword button[data-keyword='" + choiceArr[choiceArrIndex] + "']")
				.parent("div").remove();
			
			choiceArr.splice(choiceArrIndex,1);
			
			n = choiceArrIndex;
		}

	});
	
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