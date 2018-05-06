<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<!-- reset -->
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<!-- font -->
<link rel="stylesheet" type="text/css" href="resources/css/fonts.css">

<link rel="stylesheet" type="text/css" href="resources/css/member/member_header.css">
<link href="${pageContext.request.contextPath}/resources/css/member_notice.css" rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="resources/css/member/footer.css">

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script src="resources/js/member_notice.js"></script>

</head>

<body>
<div id="AllContentWrap">
	<jsp:include page="includes/memberHeader.jsp" flush="true"/>
	<c:if test="${empty login}">
		<jsp:include page="includes/mNoticeForm.jsp" flush="true"/>
	</c:if>
	<jsp:include page="../footer/footer.jsp" flush="true" />
</div>
</body>
</html>
  