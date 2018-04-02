<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <style>
 	#subway {text-align:center;}
 </style>   
    
<div id='subway'>
  <select id="line" name="line">
    <option value="">호선</option>
    <option value="line1">1호선</option>
    <option value="line2">2호선</option>
  </select>
  <select id="station" class="" name="station" >
  <option>역</option>
  </select>
</div>
  
  
<script type="text/javascript" >
console.log("hong");
$("#line").on("change",function(){
	  var line = $("#line").val();
	  var station;
	  console.log("change")
	  $.ajax({
	    type : "get",
	    url : "/station/line.jsp",
	    dataType : "json",
	    success : function(data,status,xhr){
	  	  //var x = JSON.parse(data);
	  	 //var x = eval("("+data+")");
	    var stationInfo = data[line];
	    $("#station").empty();
	    if(line != ""){
	  	  $("#station").append("<option>역</option>");
	       for(var i=0;i<stationInfo.length;i++){
	    	   $("#station").append("<option>"+stationInfo[i]+"</option>");
	         }
	       }
	    },
	    error: function(e){
	  	 console.log(e);
	    }
	  });
	});
	$("#station").on("change",function(){
	  station = $("#station").val();
	  $("#stationInfo").val(station);
	  console.log(station);
	});

</script>
  