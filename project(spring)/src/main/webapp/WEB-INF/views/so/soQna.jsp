<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
<style type="text/css">
	.row{
		margin-top: 70px;
	}
	.red{
		color: red;
	}

</style>
<script>
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
	});


</script>
</head>
<body>
<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>
<c:remove var="success"/>

<jsp:include page="includes/soTop.jsp" flush="true"/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h3>1:1 문의</h3>
				<table class="table table-hover">
					<colgroup>
						<col width="15%">
						<col width="40%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<td>
								<a href="soQnaWriteForm"><input type="button" name="btn_submit" value="1:1 문의하기"></a>
							</td>
							<td colspan="3" align="right">
								<span>답변 상태  </span>
								<a href=""><input type="button" name="btn_submite" value="확인중"></a>
								<a href=""><input type="button" name="btn_submite" value="처리중"></a>
								<a href=""><input type="button" name="btn_submite" value="처리완료"></a>
								&nbsp;&nbsp;&nbsp;
								<span>조회 기간  </span>
								<a href=""><input type="button" name="btn_submite" value="1개월"></a>
								<a href=""><input type="button" name="btn_submite" value="3개월"></a>
								<a href=""><input type="button" name="btn_submite" value="6개월"></a>
							</td>
						</tr>

						<tr>
						  <th scope="col">문의유형</th>
						  <th scope="col">제목</th>
						  <th scope="col">문의날짜</th>
						  <th scope="col">답변상태</th>
			 			</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${soQna}" varStatus="status">
							<input type="hidden" name="soId" id="soId" value="${dto.soId}">
							<tr>
								<td>${dto.qnaCategory}</td>
								<%-- <td><a href="soQnaRetrieveServlet?qnaNum=${dto.qnaNum}">${dto.qnaTitle}</a></td> --%>
								<td>	
									<a data-toggle="collapse" data-parent="#accordion" href="#soQnaRetrieve${dto.qnaNum}">${dto.qnaTitle}</a>
									<div id="soQnaRetrieve${dto.qnaNum}" class="panel-collapse collapse">
										${dto.qnaContent}
										<br>
										<c:if test="${dto.qnaComplete=='확인중'}">
											<button class="btn_qnaModify">수정</button>&nbsp;
											<input type="button" class="btn_qnaDelete" data-num="${dto.qnaNum}" value="삭제">
										</c:if>
										<c:if test="${dto.qnaComplete=='처리중' || dto.qnaComplete=='답변완료'}">
											<span class="red">처리중이나 답변완료일 경우에는 수정, 삭제가 불가합니다.</span>
										</c:if>
									</div><!-- collapse -->
								</td>
								<td>${dto.qnaWritedate}</td>
								<td>${dto.qnaComplete}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
			<div class="col-md-3"></div>
		</div><!-- end of row -->
	</div>
<jsp:include page="includes/soFooter.jsp" flush="true"/>		
</body>
