<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="subway_wrap">
	<div id="line_wrap">
		<button id="line_btn">호선을 선택하세요.</button>
		<ul id="line">
			<li class='line' value='line1'><span>1</span></li>
			<li class='line' value='line2'><span>2</span></li>
			<li class='line' value='line3'><span>3</span></li>
			<li class='line' value='line4'><span>4</span></li>
			<li class='line' value='line5'><span>5</span></li>
			<li class='line' value='line6'><span>6</span></li>
			<li class='line' value='line7'><span>7</span></li>
			<li class='line' value='line8'><span>8</span></li>
			<li class='line' value='line9'><span>9</span></li>
			<li class='line' value='lineSB' class="line_korean"><span>신분당선</span></li>
		</ul>
	</div>
	<div id="station_wrap">
		<button id="station_btn">역을 선택하세요.</button>
		<ul id="station_1"></ul>
	</div>
</div>

<script type="text/javascript" >

// $(".line").on("click",function(){
//   var line = $(this).attr('value');
//   $.ajax({
//     type : "get",
//     url : "line",
//     dataType : "json",
//     success : function(data,status,xhr){
// 	    var stationInfo = data[line];
// 	    $("#station_1").empty();
// 	    if(line != ""){
//         for(var station of stationInfo){
//     	   $("#station_1").append('<li><span>' + station + '</span></li>');
//         }
// 	    }
//     },
//   });
// });
$("#station").on("change",function(){
  station = $("#station").val();
  $("#stationInfo").val(station);
  console.log(station);
});

</script>
