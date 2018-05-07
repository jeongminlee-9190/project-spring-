$(document).ready(function(){
	
	$(".mNoticeRetrieve").on("click",function(){
		var num =  $(this).attr("data-num");
		$.ajax({
			url:"mNoticeRetrieve",
			type:"get",
			data:{
				num:num
			},
			dataType:"text",
			success:function(responseData,status,xhr){
				$(".modal-body").html(responseData);
			},
			error:function(){}
		});
	});
});