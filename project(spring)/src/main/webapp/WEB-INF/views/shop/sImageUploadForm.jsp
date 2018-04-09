<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<title>이미지 업로드</title>
<style type="text/css">
	.upload{
		margin-top: 90px;
		margin-bottom: 40px;
	}
	.blue{
		color: blue;
		font-size: 12px;
	}
</style>
</head>
<body>
<c:if test="${!empty mesg}">
	<script type="text/javascript">
		alert('${mesg}');
	</script>
</c:if>
<c:remove var="mesg"/>
<c:if test="${!empty SoLogin}"> 
	<jsp:include page="../so/includes/soTop.jsp" flush="true"/>
	<div class="container-fluid upload">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h3>상점 이미지 등록</h3>
				<span class="blue">상점 이미지는 최대 5개까지 등록 가능하며, PNG 파일만 가능합니다.</span>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<br><br>
		<div class="row">
		  <div class="col-sm-1"></div>
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
				<input type="hidden" name="num" value="1">
				<img src="resources/images/default.png" width="250px" height="250px">
				이미지1<input type="file" name="theFile">
				<input type="submit" value="업로드">
			</form>
		  </div>
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
				<input type="hidden" name="num" value="2">
				<img src="resources/images/default.png" width="250px" height="250px">
				이미지2<input type="file" name="theFile">
				<input type="submit" value="업로드">
			</form>
		  </div>
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
				<input type="hidden" name="num" value="3">
				<img src="resources/images/default.png" width="250px" height="250px">
				이미지3<input type="file" name="theFile">
				<input type="submit" value="업로드">
			</form>
		  </div>
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
				<input type="hidden" name="num" value="4">
				<img src="resources/images/default.png" width="250px" height="250px">
				이미지4<input type="file" name="theFile">
				<input type="submit" value="업로드">
			</form>
		  </div>
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
				<input type="hidden" name="num" value="5">
				<img src="resources/images/default.png" width="250px" height="250px">
				이미지5<input type="file" name="theFile">
				<input type="submit" value="업로드">
			</form>
		  </div>
		  <div class="col-sm-1"></div>
		</div>
	</div>
	<jsp:include page="../so/includes/soFooter.jsp" flush="true"/>
</c:if> 
</body>
</html>