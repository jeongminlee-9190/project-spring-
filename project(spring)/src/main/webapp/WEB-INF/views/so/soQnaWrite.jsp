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
<link href="${pageContext.request.contextPath}/resources/css/fonts.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so/so_qna.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so/so_footer.css" rel="stylesheet" >
<style type="text/css">
	.row{
		margin-top: 90px;
		margin-bottom: 40px;
	}
</style>
</head>
<body>
<jsp:include page="includes/soTop.jsp" flush="true"/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h3>1:1 문의 접수</h3>
				<form action="soQnaWrite">
					<input type="hidden" name="soQnaWrite" value="soQnaWriteForm">
					<table class="table">
						<tr>
							<td>
								<label for="qnaCategory">접수 유형:</label>
								<select name="qnaCategory">
									<option>서비스이용</option>			
									<option>서비스결제</option>
									<option>이용불만</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
								  	<label for="qnaTitle">제목:</label>
								  	<input type="text" class="form-control" id="qnaTitle" name="qnaTitle">
								</div>
								
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
								  	<label for="qnaContent">내용:</label>
								  	<textarea class="form-control" rows="13" id="qnaContent" name="qnaContent"></textarea>
								</div>
							</td>
						</tr>
						<tr>
					 		<td colspan="2" align="center">
					 		<input type="submit" class="btn btn-primary orange-background" value="접수">&nbsp;
					 		<a href="soQna"><input type="button" class="btn btn-primary orange-border" value="취소"></a></td>
					 	</tr>
					</table>
				</form>						
			</div>			 	 
			<div class="col-md-3"></div>
		</div>
	</div>
<jsp:include page="includes/soFooter.jsp" flush="true"/>	
</body>