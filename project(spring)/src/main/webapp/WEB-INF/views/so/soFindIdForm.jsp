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
<link href="resources/css/fonts.css" rel="stylesheet" >
<link href="resources/css/so/so_find.css" rel="stylesheet" >
<link href="resources/css/so/so_footer.css" rel="stylesheet" >
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script> 
<script src="resources/js/so_FindIdForm.js"></script> 
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<c:if test="${!empty findfail}">
	<script>
		alert("${findfail}");
	</script>
	<c:remove var="findfail" scope="session" />
</c:if>

<jsp:include page="includes/soTop2.jsp" flush="true"/>
<jsp:include page="includes/soFindIdForm.jsp" flush="true"/>
<jsp:include page="includes/soFooter.jsp" flush="true"/>
</body>
</html>