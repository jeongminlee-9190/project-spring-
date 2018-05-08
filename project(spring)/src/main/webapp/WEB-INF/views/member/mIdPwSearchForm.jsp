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
<link rel="stylesheet" type="text/css" href="resources/css/member/member_mIdPwSearch.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/footer.css">

<!-- jquery -->
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="resources/js/member_mIdPwSearch.js"></script>

<title>아이디/비밀번화 찾기</title>
</head>
<body>
<div id="AllContentWrap">
	<jsp:include page="includes/memberHeader.jsp" flush="true"/>
	<c:if test="${empty login}">
		<jsp:include page="includes/mIdPwSearchForm.jsp" flush="true"/>
	</c:if>
	<jsp:include page="../footer/footer.jsp" flush="true" />
</div>
</body>
</html>