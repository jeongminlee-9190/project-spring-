$(document).ready(function(){
	$(".soNoticeRetrieve").on("click",function(){
		var num =  $(this).attr("data-num");
		$.ajax({
			url:"soNoticeRetrieve2",
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