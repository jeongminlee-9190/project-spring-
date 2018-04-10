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