$(document).ready(function(){
	$(".soNoticeRetrieve").on("click",function(){
		var num =  $(this).attr("data-num");
		$.ajax({
			url:"soNoticeRetrieve",
			type:"get",
			data:{
				num:num
			},
			dataType:"text",
			success:function(responseData,status,xhr){
				$(".modal-body").html(responseData);
				$()
			},
			error:function(){}
		});
	});
	
	/*$("#search").submit(function(){
		var searchName = $("#searchName").val();
		var searchValue = $("#searchValue").val();
		
		$.ajax({
			url:"soNotice",
			type:"get",
			data:{
				searchName=searchName,
				searchValue=searchValue
			},
			dataType:"text",
			success:function(responseData,status,xhr){
				console.log("searchName: "+searchName+"searchValue: "+searchValue);
				$(".modal-body").html(responseData);
				$()
			},
			error:function(){}
		});
		var searchName=$("#searchName").val();
		var searchValue=$("#searchValue").val();
		console.log(searchName+searchValue);
		 if(searchName=="content"){
			$(".searchName2").html("<option selected='selected'>내용</option>");
		} 
		
	});*/
});