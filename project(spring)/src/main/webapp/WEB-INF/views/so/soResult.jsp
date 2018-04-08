<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>결과</title>
<link href="${pageContext.request.contextPath}/resources/css/so_mypage" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so/so_footer.css" rel="stylesheet" >

</head>
<body>
<c:if test="${!empty login}">
	<div class="wrapper">
		<div class="mainwrapper">
			<div class="logo">
				<span>(갬성갱단)상점 관리 센터</span><br>
			</div>
			<div class="loginForm">
				<jsp:include page="soLoginForm.jsp" flush="true"/>
			</div>
			<div class="mainmenu">
				<jsp:include page="includes/soTop.jsp" flush="true"/>
			</div>
		</div>
		<div class="soMyPage">
			<jsp:include page="includes/soResult.jsp" flush="true"/>
		</div>
	<jsp:include page="includes/soFooter.jsp" flush="true"/>
	</div>
</c:if>
<c:if test="${!empty findSoIdResult}">
	<jsp:include page="includes/soTop2.jsp" flush="true"/>
	<jsp:include page="includes/soResult.jsp" flush="true"/>
	<jsp:include page="includes/soFooter.jsp" flush="true"/>
</c:if>	

<c:if test="${!empty findSoPasswdResult}">
	<jsp:include page="includes/soTop2.jsp" flush="true"/>
	<jsp:include page="includes/soResult.jsp" flush="true"/>
	<jsp:include page="includes/soFooter.jsp" flush="true"/>
</c:if>	
</body>
</html>