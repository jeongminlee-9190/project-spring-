$(document).ready(function(){
		$(".btn_qnaDelete").click(function(){
			var qnaNum =  $(this).attr("data-num");
			var soId = $("#soId").val();
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
				error:function(){}
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
				error:function(){}
			});
		});
		
		$(".qnaReplyContentCheck").click(function(){
			var qnaNum = $(this).attr("data-num");
			var qnaReplyContent= $("#qnaReplyContent"+qnaNum).text();
			var qnaReplyStatement= $("#qnaReplyStatement"+qnaNum).val();
			if(qnaReplyContent.length>0 && qnaReplyStatement=="미확인"){
				$.ajax({
					url: "soQnaRead",
					type:"get",
					data:{
						qnaNum:qnaNum,
					},
					dataType:"text",
					success:function(responseData,status,xhr){
					},
					error:function(){
					}
				});
			}
		});
	});
