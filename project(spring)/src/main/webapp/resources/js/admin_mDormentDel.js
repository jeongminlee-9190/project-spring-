$(document).ready(function(){
	$(".mDormantDel").click(function(){
		var mId =  $(this).attr("data-num");
		console.log(mid);
		$.ajax({
			url: "mDormantDel",
			type: "get",
			data:{
				mId:mId
			},
			success:function(responseData,status,xhr){
				alert(mId+' -휴면 계정이 삭제되었습니다.');
				location.reload();
			},
			error:function(){
			}
		}); 
	});
});