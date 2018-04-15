<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<!-- reset -->
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<!-- font -->
<link rel="stylesheet" type="text/css" href="resources/css/fonts.css">

<link rel="stylesheet" type="text/css" href="resources/css/member/member_header.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/member_login.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/footer.css">

<!-- jquery -->
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script src="resources/js/jquery-3.3.1.js"></script>
<script src="resources/js/member_login.js"></script>

<title>로그인</title>
</head>
<body>
<div id="AllContentWrap">
	<jsp:include page="includes/memberHeader.jsp" flush="true"/>
	<c:if test="${empty login}">
		<jsp:include page="includes/mLoginForm.jsp" flush="true"/>
	</c:if>
	
	<jsp:include page="../footer/footer.jsp" flush="true" />
</div>
</body>
</html>