<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/css/fonts.css" rel="stylesheet" >
<link href="resources/css/so/main_shopowner.css" rel="stylesheet" >
<link href="resources/css/so_footer.css" rel="stylesheet" >
</head>
<body>
<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>
<c:remove var="success" scope="session"/>

<c:if test="${!empty SoLogout}">
	<script type="text/javascript">
    	alert('${SoLogout}');
    </script>
</c:if>

<div class="main">
	<c:if test="${!empty SoLogin}"> 
		<jsp:include page="so/includes/soTop.jsp" flush="true"/>
		<jsp:include page="so/includes/soMainCarousel.jsp" flush="true"/>
		<jsp:include page="so/includes/soAlert.jsp" flush="true"/>
		<jsp:include page="so/includes/soRanking.jsp" flush="true"/>
		<jsp:include page="so/includes/soFooter.jsp" flush="true"/>
	</c:if>
</div>
</body>
</html>