<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#soQnaReplyModify").click(function(){
			var qnaReplyNum =  $(this).attr("data-num");
			var qnaReplyContent = $("#qnaReplyContent").val();
			$.ajax({
				url:"soQnaReplyModify",
				type:"get",
				data:{
					qnaReplyNum:qnaReplyNum,
					qnaReplyContent:qnaReplyContent
				},
				dataType:"text",
				success:function(responseData,status,xhr){
					location.reload(); // 페이지 새로고침
				},
				error:function(){}
			});
		});
	});
</script>


<div class="wrapper">
	<form action="soQnaReply" method="get">
	<input type="hidden" name="qnaNum" value="${soQnaRetrieve.qnaNum}">
	<div class="soQnaRetrieve">
		<div class="row">
			<div class="col-sm-6">
				<table class="table">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
			 			<tr>
			  				<th scope="col">글번호</th>
			  				<td scope="col">${soQnaRetrieve.qnaNum}</td>
			 			</tr>
		 			<tbody>
				</table>
			</div>
			<div class="col-sm-6">
				<table class="table">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
			 			<tr>
			  				<th scope="col">제목</th>
	  						<td scope="col">${soQnaRetrieve.qnaTitle}</td>
			 			</tr>
		 			<tbody>
				</table>
			</div>
		</div><!--end of row  -->
		
		<div class="row">
			<div class="col-sm-6">
				<table class="table">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
		 			<tbody>
			 			<tr>
			 				<th scope="col">작성자</th>
			 				<td scope="col">${soQnaRetrieve.soId}</td>
			 			</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-6">
				<table class="table">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
			 			<tr>
			  				<th scope="col">작성일</th>
	 						<td scope="col">${soQnaRetrieve.qnaWritedate}</td>
			 			</tr>
		 			<tbody>
				</table>
			</div>
		</div><!--end of row  -->
		
		
		<div class="row">
			<div class="col-sm-12">
				<table class="table">
		 			<tbody>
			 			<tr>
			 				<td align="left" class="qnaContent">${soQnaRetrieve.qnaContent}
			 			</tr>
					</tbody>
				</table>
			</div>
		</div><!--end of row  -->
		
		<c:if test="${soQnaRetrieve.qnaComplete=='확인중' || soQnaRetrieve.qnaComplete=='처리중'}">
		<div class="row">
			<div class="col-sm-12">
				<table class="table">
			 		<tbody>
				 		<tr>
				 			<td>
						 		<div class="form-group">
									<label for="comment">답변:</label>
									<textarea class="form-control" rows="7" id="qnaReplyContent " name="qnaReplyContent"></textarea>
								</div> 
							</td>
				 		</tr>
				 		<tr>
				 			<td align="center">
				 				<input type="submit" class="btn btn-primary black-background" value="답변하기">
				 			</td>	
				 		</tr>
					</tbody>
				</table>
			</div>
		</div><!--end of row  -->
		</c:if>
		
		<c:if test="${soQnaRetrieve.qnaComplete=='처리완료'}">
		<div class="row">
			<div class="col-sm-12">
				<table class="table">
			 		<tbody>
				 		<tr>
				 			<td>
						 		<div class="form-group">
									<label for="comment">답변:</label>
									<textarea class="form-control" rows="7" id="qnaReplyContent">${soQnaReplyRetrieve.qnaReplyContent}</textarea>
								</div> 
							</td>
				 		</tr>
				 		<c:if test="${soQnaReplyRetrieve.qnaReplyStatement=='미확인'}">
					 		<tr>
					 			<td align="center">
					 				<input type="button" class="btn btn-primary black-background" id="soQnaReplyModify" data-num="${soQnaReplyRetrieve.qnaReplyNum}" value="수정하기">
					 			</td>	
					 		</tr>
				 		</c:if>
				 		<c:if test="${soQnaReplyRetrieve.qnaReplyStatement=='확인'}">
					 		<tr>
					 			<td align="center">
					 				<span class="red">1:1문의자가 답변을 확인하여 수정이 불가합니다.</span>
					 			</td>	
					 		</tr>
				 		</c:if>
					</tbody>
				</table>
			</div>
		</div><!--end of row  -->
		</c:if>
	</div>
	</form>
</div>
