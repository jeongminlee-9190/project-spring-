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
<link href="${pageContext.request.contextPath}/resources/css/so/so_qna.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
<style type="text/css">
	.row{
		margin-top: 90px;
		margin-bottom: 40px;
	}
	.red{
		color: red;
		font-size: 12px;
	}
	.orange-background{
		border: 1px solid orange;
		background-color: orange;
		width: 110px;
	}
	.orange-background2{
		border: 1px solid orange;
		background-color: orange;
		width: 70px;
	}
	
	.btn_qnaModify,.btn_qnaDelete {
		border: 1px solid orange;
		background-color: white;
		color: orange;
		margin-top: 10px;
		width: 70px;
	}

	.buttons{
		text-align: center;
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
							<td colspan="4" align="center">
								<form class="form-inline" action="soQna" method="GET">
									<div class="form-group">
										<a href="soQnaWriteForm"><input type="button" class="btn btn-primary orange-background" value="1:1 문의하기"></a>
									</div>
									&nbsp;&nbsp;&nbsp;
								    <div class="form-group">
								      <label for="focusedInput">답변</label>
								      <c:if test="${empty searchName}">
									  	<select class="form-control" name="searchName" id="searchName">
											<option selected="selected"></option>
											<option>확인중</option>
											<option>처리중</option>
											<option>처리완료</option>
										</select>
									  </c:if>
									  <c:if test="${searchName=='확인중'}">
										<select class="form-control" name="searchName" id="searchName">
											<option></option>
											<option selected="selected">확인중</option>
											<option>처리중</option>
											<option>처리완료</option>
										</select>
									  </c:if>
									  <c:if test="${searchName=='처리중'}">
										<select class="form-control" name="searchName" id="searchName">
											<option></option>
											<option>확인중</option>
											<option selected="selected">처리중</option>
											<option>처리완료</option>
										</select>
									  </c:if>
									  <c:if test="${searchName=='처리완료'}">
										<select class="form-control" name="searchName" id="searchName">
											<option></option>
											<option>확인중</option>
											<option>처리중</option>
											<option selected="selected">처리완료</option>
										</select>
									  </c:if>
								    </div>
								    &nbsp;&nbsp;&nbsp;
								    <div class="form-group">
								      <label for="inputPassword">기간</label>
								      <c:if test="${empty searchName2}">
										<select class="form-control" name="searchName2">
											<option selected="selected"></option>
											<option>1주일</option>
											<option>1개월</option>
										</select>
									  </c:if>
									  <c:if test="${searchName2=='1주일'}">
										<select class="form-control" name="searchName2">
											<option></option>
											<option selected="selected">1주일</option>
											<option>1개월</option>
										</select>
									  </c:if>
									  <c:if test="${searchName2=='1개월'}">
										<select class="form-control" name="searchName2">
											<option></option>
											<option>1주일</option>
											<option selected="selected">1개월</option>
										</select>
									</c:if>
								   </div>
								   &nbsp;&nbsp;&nbsp;
								   <div class="form-group">
								   	<input type="submit" class="btn btn-primary orange-background2" value="검색">
								   </div>
								</form>
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
								<td>	
									<a data-toggle="collapse" data-parent="#accordion" href="#soQnaRetrieve${dto.qnaNum}">${dto.qnaTitle}</a>
									<div id="soQnaRetrieve${dto.qnaNum}" class="panel-collapse collapse">
										<label for="qnaContent">내용:</label>
										<c:if test="${dto.qnaComplete=='확인중'}">
  											<textarea class="form-control" rows="5" id="qnaContent">${dto.qnaContent}</textarea>
											<div class="buttons">
												<input type="button" class="btn btn-primary btn_qnaModify" data-num="${dto.qnaNum}" value="수정">
												<input type="button" class="btn btn-primary btn_qnaDelete" data-num="${dto.qnaNum}" value="삭제">
											</div>
										</c:if>
										<c:if test="${dto.qnaComplete=='처리중' || dto.qnaComplete=='처리완료'}">
											${dto.qnaContent}<br><br>
											<label for="qnaContent">답변: </label> ${dto.qnaReplyContent}
											<br>
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
