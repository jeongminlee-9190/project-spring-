<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/css/so/so_payment.css" rel="stylesheet" >
<link href="resources/css/fonts.css" rel="stylesheet" >
<link href="resources/css/so/so_footer.css" rel="stylesheet" >
</head>
<body>
<c:if test="${!empty SoLogin}"> 
	<jsp:include page="includes/soTop.jsp" flush="true"/>
	<jsp:include page="includes/soPayMentForm.jsp" flush="true"/>
	<jsp:include page="includes/soFooter.jsp" flush="true"/>
</c:if>
</body>
