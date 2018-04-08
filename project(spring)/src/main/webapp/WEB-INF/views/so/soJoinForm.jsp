<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script src="resources/js/soJoinForm.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so/so_footer.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so/so_join.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="includes/soTop_join.jsp" flush="true"/>
<jsp:include page="includes/soJoinForm.jsp" flush="true"/>
<jsp:include page="includes/soFooter.jsp" flush="true"/>
</body>
</html>