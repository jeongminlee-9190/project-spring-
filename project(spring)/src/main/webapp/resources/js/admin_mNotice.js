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
	
	$("#mNoticeWrite").submit(function(e){
		var noticeTitle = $("#noticeTitle").val();
		var noticeContent = $("#noticeContent").val();
		if(noticeTitle.length<10){
			alert('제목을 입력해주세요.(10자 이상)');
			$("#noticeTitle").focus();
			e.preventDefault();
		}else if(noticeContent.length<30){
			alert('내용을 입력해주세요.(30자 이상)');
			$("#noticeContent").focus();
			e.preventDefault();
		}
	});
});