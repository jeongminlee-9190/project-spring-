
$(document).ready(function(){
	
	//검색창 클릭 했을 때 배경 어둡게  / body 스크롤 불가능
	$("#search").on("click", function(){
		$(".emphasized").show();
		$("#search_new_wrap").show("fast");
		$("body").css("overflow","hidden")
				 .bind('touchmove', function(e){
					 e.preventDefault()
				 });
		/*$("::-webkit-scrollbar").css({
					"width":"0px; remove scrollbar space",
					"background":"transparent","optional":"just make scrollbar invisible"
		});*/
	
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
		$("#station_1").slideUp("fast");
		
	});
	
	//역
	$("#station_btn").on("click", function(){
		$("#station_1").slideToggle("fast");
		$("#line").slideUp("fast");
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
	$(document).on("mouseover",'.station_list', function(){

		var line_btn_color = $("#line_btn").css("background-color");
		$(this).css({"background-color":line_btn_color,"color":"#ffffff"});

	});
	
	$(document).on("mouseout",'.station_list', function(){

		var line_btn_color = $("#line_btn").css("background-color");
		$(this).css({"background-color":"#ffffff","color":line_btn_color});

	});	
	
	//지하펄 리스트중 하나 클릭 후 상단(button)으로 선택되기
	//호선
	$("#line_wrap ul li").on("click", function(idx){

		//라인 클릭했을 때 라인 카운트 0으로 만들기
		line_count=0;

		$('#station_btn').html('<span>역을 선택하세요<span>');

		var color_change = $(this).css("background-color");

		var li = $(this);
		$("#line_btn").html(function(){
		    return "<span>" + li.find("span").text() + "</span>";
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


		//호선 클릭하면 역 button, 역 list의 border, font 컬러 변경되기
		var line_btn_color = $("#line_btn").css("background-color");
		$("#station_btn").css({"background-color":line_btn_color,"color":"#fff"});
		
		var line = $(this).attr('value');
		$.ajax({
		  type: "get",
		  url: "line",
		  dataType: "json",
		  success: function(data, status, xhr) {
		    var stationInfo = data[line];
		    $("#station_1").empty();
		    if (line != "") {
		      for (var station of stationInfo) {
		        $("#station_1").append('<li class="station_list"><span>' + station + '</span></li>');
		      }
		    }
		    $(".station_list").css({"border-color":line_btn_color,"color":line_btn_color});
		  },
		});

		//지하철 호선 버튼 눌렀을때 배경 어둡게 - 숨기기
		$("#line").slideUp("fast");

	});
	
	
	//역
	$(document).on("click",'.station_list', function(idx){
		
		//지하철 클릭했을때 카운트 0으로 만들기
		station_count = 0;

		var line_btn_color = $("#line_btn").css("background-color");

		var li = $(this);
		$("#station_btn").html(function(){
		    return "<span>" + li.find("span").text() + "</span>";
		}) ;

		$("#station_btn").find("span").css({"font-size":"18px","font-weight":"900",
										 "padding-top":"15px","font-family":"'Open Sans', sans-serif"});

		$("#station_wrap ul").slideUp("fast");
		
		//search.jsp 안에 input(#station_info) value에 값 넣기 
		var station = $('#station_btn').find('span').text();
		$('#station_info').val(station);
	
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

});
	
});
