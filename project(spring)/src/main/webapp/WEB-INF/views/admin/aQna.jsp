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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_footer.css" rel="stylesheet" >
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script> 
<style type="text/css">
	.row1{
		margin-top: 90px;
		margin-bottom: 40px;
		font-size: 12px;
	}
	.red{
		color: red;
	}
	
	.black-background{
		border: 1px solid #858585;
		background-color: #858585;
		color: white;
	}

</style>
<script>
	/* $(document).ready(function(){
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
 */
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
			$(location).attr('href', "aQna");
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

<jsp:include page="includes/admin_top.jsp" flush="true"/>
	<div class="container-fluid">
		<div class="row row1">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h3>1:1 문의</h3>
				<table class="table table-hover">
					<colgroup>
						<col width="15%">
						<col width="40%">
						<col width="15%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<td colspan="5" align="right">
								<span>답변 상태  </span>
								<select>
									<option>확인중</option>
									<option>처리중</option>
									<!-- 문의내용을 클릭하면 확인중에서 처리중으로 바뀌고, 답변을 하면 답변완료로 바뀐다. -->
									<option>답변완료</option>
									<option>전체</option>
								</select>
								&nbsp;&nbsp;&nbsp;
								<!-- 조회기간은 답변상태를 선택하면 보여지게 제이쿼리로 처리한다. -->
								<span>조회 기간  </span>
								<select>
									<option>1개월</option>
									<option>3개월</option>
									<option>6개월</option>
									<option>전체</option>
								</select>
							</td>
						</tr>

						<tr>
						  <th scope="col">문의유형</th>
						  <th scope="col">제목</th>
						  <th scope="col">작성자</th>
						  <th scope="col">문의날짜</th>
						  <th scope="col">답변상태</th>
			 			</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${aQna}" varStatus="status">
							<input type="hidden" name="soId" id="soId" value="${dto.soId}">
							<tr>
								<td>${dto.qnaCategory}</td>
								<td><c:set var="qnaTitle" value="${dto.qnaTitle}"/>	
									<a data-toggle="modal" data-target="#myModal" class="soQnaRetrieve" data-num="${dto.qnaNum}">${fn:substring(qnaTitle, 0, 16)}</a>
								</td>
								<!-- The Modal -->
								<div class="modal fade" id="myModal">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
												      
											<!-- Modal Header -->
											<div class="modal-header">
												<h4 class="modal-title">1:1 문의 답변하기</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
													        
											<!-- Modal body -->
											<div class="modal-body">
											</div>
										</div>
									</div>
								</div>
								
								<td>${dto.soId}</td>
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
<jsp:include page="includes/admin_footer.jsp" flush="true"/>		
</body>
