$(document).ready(function(){
	$(".soQnaRetrieve").on("click",function(){
		var qnaNum =  $(this).attr("data-num");
		$.ajax({
			url:"soQnaRetrieve",
			type:"get",
			data:{
				qnaNum:qnaNum
			},
			dataType:"text",
			success:function(responseData,status,xhr){
				$(".modal-body").html(responseData);
			},
			error:function(){}
		});
	});
		
	$(".close").on("click",function(){
		$(location).attr('href', "aQnaList");
	});
});


$(document).ready(function(){
	$(".btn_qnaDelete").click(function(){
		var qnaNum =  $(this).attr("data-num");
		var soId = $("#soId").val();
		console.log(qnaNum+"\t"+soId);
		$.ajax({
			url: "soQnaDelete",
			type:"get",
			data:{
				qnaNum:qnaNum,
				soId:soId
			},
			dataType:"text",
			success:function(responseData,status,xhr){
				alert('1:1 문의가 삭제되었습니다.');
				location.reload(); // 페이지 새로고침
			},
			error:function(){
			}
		});
	});
	
	$(".btn_qnaModify").click(function(){
		var qnaNum =  $(this).attr("data-num");
		var soId = $("#soId").val();
		var qnaContent = $("#qnaContent").val();
		$.ajax({
			url: "soQnaModify",
			type:"get",
			data:{
				qnaNum:qnaNum,
				soId:soId,
				qnaContent:qnaContent
			},
			dataType:"text",
			success:function(responseData,status,xhr){
				alert('1:1 문의가 수정되었습니다.');
				location.reload(); // 페이지 새로고침
			},
			error:function(){
			}
		}); 
	});
});