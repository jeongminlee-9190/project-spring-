$(document).ready(function(){
	$("#mDormantDel").click(function(){
		var mId =  $(this).attr("data-num");
		$.ajax({
			url: "mDormantDel",
			type: "get",
			data:{
				mId:mId
			},
			success:function(responseData,status,xhr){
				location.reload();
			},
			error:function(){
			}
		});
	});
});