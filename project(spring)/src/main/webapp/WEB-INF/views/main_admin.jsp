<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin 메인화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script> 
<script type="text/javascript" src="resources/js/Chart.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/fonts.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_footer.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_main.css" rel="stylesheet">
</head>
<body>
<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>
<c:remove var="success" scope="session"/>
<c:if test="${!empty adminLogin}"> 
	<jsp:include page="admin/includes/admin_top.jsp" flush="true"/>
	<jsp:include page="admin/includes/admin_mainAlert.jsp" flush="true"/>
	<jsp:include page="admin/includes/admin_chart.jsp" flush="true"/>
	<jsp:include page="admin/includes/admin_footer.jsp" flush="true"/>
</c:if>
</body>
</html>