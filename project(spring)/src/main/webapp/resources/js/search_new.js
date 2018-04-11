
$(document).ready(function(){
	
	//검색창 클릭 했을 때 배경 어둡게  / body 스크롤 불가능
	$("#search").on("click", function(){
		$(".emphasized").show();
		$("#search_new_wrap").show("fast");
		$("body").css("overflow","hidden")
				 .bind('touchmove', function(e){
					 e.preventDefault()
				 });
	});
	
	//검색창 클릭 했을 때 배경 어둡게 - 숨기기  / body 스크롤 가능
	$(".emphasized").on("click",function(){
		$(".emphasized").hide();
		$("#search_new_wrap").hide("fast");
		$("body").css("overflow-y","scroll").unbind('touchmove');
	});
	
	//지하펄 button 클릭후 메뉴 보이기
	//호선
	$("#line_btn").on("click", function(){
		$("#line").slideToggle("fast");
		//$(".cate_wrap").toggleClass("cate_wrap_change", 700);
		$("#cate_wrap").animate({"top":"342px"}, "fast");
	});
	
	//역
	$("#station_btn").on("click", function(){
		$("#station_1").slideToggle("fast");
		$("#cate_wrap").animate({"top":"342px"}, "fast");
	});
	
	//지하철 리스트 hover시 background-color 변경
	//호선
	$("#line_wrap ul li").mouseover(function(){
		
		var color_change = $(this).find("span").css("background-color");
	
		$(this).css({"background-color":color_change,"color":color_change});
		$(this).find("span").css("background-color","#ffffff");

	});
	
	$("#line_wrap ul li").mouseout(function(){
		
		var color = $(this).css("background-color");
	
		$(this).css({"background-color":"#ffffff","color":"#ffffff"});
		$(this).find("span").css("background-color",color);

	});
	
	//역
	$("#station_wrap ul li").mouseover(function(){
		
		var line_btn_color = $("#line_btn").css("background-color");
	
		$(this).css({"background-color":line_btn_color,"color":"#ffffff"});

	});
	
	$("#station_wrap ul li").mouseout(function(){
	
		var line_btn_color = $("#line_btn").css("background-color");
	
		$(this).css({"background-color":"#ffffff","color":line_btn_color});

	});
	
	
	//지하펄 리스트중 하나 클릭 후 상단(button)으로 선택되기
	//호선
	$("#line_wrap ul li").on("click", function(idx){

		var color_change = $(this).css("background-color");
		
		var li = $(this);
		$("#line_btn").html(function(){
		    return "<span>" + $(li).find("span").text() + "</span>";
		}) ;
		
		$("#line_btn").css({"background-color":color_change,"color":color_change});
		$("#line_btn").find("span").css({"background-color":"#fff","display":"inline-block",
										 "padding":"5px 10px","border-radius":"100px",
										 "font-family":"gotham_Bold", 
										 "font-style":"normal","font-weight":"normal","font-size":"21px"})
		
		//1호선 css 따로 수정
		if( $(li).find("span").text() == 1 ){
			$("#line_btn").find("span").css({"padding":"5px 13px"})
		}
		
		//역 한글부분 수정
		if( $(li).index() >= 9 ){
			$("#line_btn").find("span").css({"padding":"4px 11px","border-radius":"25px",
											 "font-size":"18px","font-weight":"900",
											 "font-family":"'Open Sans', sans-serif"})
		}

		$("#line").slideUp("fast");
		
		//호선 클릭하면 역 button, 역 list의 border, font 컬러 변경되기 
		var line_btn_color = $("#line_btn").css("background-color");
		$("#station_btn").css({"background-color":line_btn_color,"color":"#fff"});
		$("#station_wrap ul li").css({"border-color":line_btn_color,"color":line_btn_color});
		
		$("#cate_wrap").animate({"top":"90px"}, 700);
		
	});
	
	
	//역
	$("#station_wrap ul li").on("click", function(idx){
		
		var line_btn_color = $("#line_btn").css("background-color");
		
		var li = $(this);
		$("#station_btn").html(function(){
		    return "<span>" + $(li).find("span").text() + "</span>";
		}) ;
		
		$("#station_btn").find("span").css({"font-size":"18px","font-weight":"900",
										 "padding-top":"15px","font-family":"'Open Sans', sans-serif"});
		
		$("#station_wrap ul").slideUp("fast");
		
		$("#cate_wrap").animate({"top":"90px"}, 700);
		
	});
	
	//호선 클릭시 역 클릭 가능
	$('#station_btn').on("click", function(){ 
		
		var line_btn = $("#line_btn").text().length;
		
		if ( 10 > line_btn >= 1){
			$("#station_wrap ul").show();
		} else if ( line_btn == 10) { 
			alert("호선을 선택해 주세요."); 
			$("#line_wrap ul").slideDown("fast");
			$("#station_wrap ul").hide();
		}
		
	});
	
	//키워드 검색창으로 올리기
	var keywords = [];
	var keyword;
	var keywordsIndex;
	$(".category ul li button").on("click",function(){
		
		keyword = $(this).text();
		keywordsIndex = keywords.indexOf(keyword);
		console.log(keywordsIndex);
		
		if(keywords.length < 4 && keywordsIndex==-1){
			keywords.push(keyword);
			$("#search").val(keywords);
			//카테고리 리트스 버튼 클릭 하면 컬러 바뀌기
			$(this).css({"background-color":"#ffa827", "color":"#fff"});
		}else if(keywordsIndex>=0){
			keywords.splice(keywordsIndex,1);
			$("#search").val(keywords);
			//카테고리 리트스 버튼 클릭 하면 원래 컬러로 돌아오기
			$(this).css({"background-color":"#fff", "color":"#ffa827"});
		}
	
	});
	  
	//카테고리 리스트 감추기
	$(".list").hide();
	
	//카테고리 버튼 누르면 보여지기
	$("#cate_btn01").on("click", function(){
		$("#category01 ul").slideToggle("slow");
		$(this).find("span").fadeToggle("slow");
	});
	$("#cate_btn02").on("click", function(){
		$("#category02 ul").slideToggle("slow");
		$(this).find("span").fadeToggle("slow");
	});
	$("#cate_btn03").on("click", function(){
		$("#category03 ul").slideToggle("slow");
		$(this).find("span").fadeToggle("slow");
	});
	
	//카테고리 리스트 버튼 color 변경
	$(".list li button").on("click", function(){
		//$(".list").slideUp("slow");
		//$(this).css({"background-color":"#ffa827", "color":"#fff"});
	});


});
