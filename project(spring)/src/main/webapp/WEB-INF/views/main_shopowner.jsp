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
<link href="${pageContext.request.contextPath}/resources/css/fonts.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so/main_shopowner.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
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
		<div class="container-fluid"> 
		  	<div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner">
			      <div class="item active">
			      	
			        <div class="logo">
			        	<img src="resources/images/logo.png" alt="main_bg01.jpg" style="width:170%;">
			        </div>
			        <img src="resources/images/main_bg01.jpg" alt="main_bg01.jpg" style="width:170%;">
			      </div>
			
			      <div class="item">
			        <img src="resources/images/main_bg02.jpg" alt="main_bg02.jpg" style="width:170%;">
			      </div>
			    
			      <div class="item">
			        <img src="resources/images/main_bg03.jpg" alt="main_bg03.jpg" style="width:170%;">
			      </div>
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
			    
			     <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>
			  </div>
		</div>
		<jsp:include page="so/includes/soAlert.jsp" flush="true"/>
		<jsp:include page="so/includes/soRanking.jsp" flush="true"/>
		<jsp:include page="so/includes/soFooter.jsp" flush="true"/>
	</c:if>
</div>
</body>
</html>