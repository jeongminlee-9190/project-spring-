$(document).ready(function(){
	$(".soDormantDel").click(function(){
		var soId =  $(this).attr("data-num");
		$.ajax({
			url: "soDormantDel",
			type: "get",
			data:{
				soId:soId
			},
			success:function(responseData,status,xhr){
				alert(soId+' -휴면 계정이 삭제되었습니다.');
				location.reload();
			},
			error:function(){
			}
		});
	});
});