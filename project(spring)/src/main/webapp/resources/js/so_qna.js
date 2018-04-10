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
					console.log("tlfvo");
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
					console.log("tlfvo");
				}
			});
		});
		
		$(".qnaReplyContentCheck").click(function(){
			var qnaNum = $(this).attr("data-num");
			console.log(qnaNum);
			var qnaReplyContent= $("#qnaReplyContent"+qnaNum).text();
			var qnaReplyStatement= $("#qnaReplyStatement"+qnaNum).val();
			console.log(qnaReplyContent.length);
			console.log(qnaReplyStatement);
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
