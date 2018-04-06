$(document).ready(function(){
	$("#soDormantDel").click(function(){
		var soId =  $(this).attr("data-num");
		$.ajax({
			url: "soDormantDel",
			type: "get",
			data:{
				soId:soId
			},
			success:function(responseData,status,xhr){
				location.reload();
			},
			error:function(){
			}
		});
	});
});