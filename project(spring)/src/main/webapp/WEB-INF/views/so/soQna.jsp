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

</style>
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
							<tr>
								<td>${dto.qnaCategory}</td>
								<td><a href="soQnaRetrieveServlet?qnaNum=${dto.qnaNum}">${dto.qnaTitle}</a></td>
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
