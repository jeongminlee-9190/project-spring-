<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<<style>
	.logo{
		width:10%;
	}
</style>

<c:if test="${!empty SoLogin}"> 
	<div class="container-fluid"> 
  	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
      	<img src="${pageContext.request.contextPath}/images/main_bg01.jpg" alt="main_bg01.jpg" style="width:170%;">
        <div class="logo">
        	<img src="${pageContext.request.contextPath}/images/logo.png" alt="main_bg01.jpg" style="width:170%;">
        </div>
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/images/main_bg02.jpg" alt="main_bg02.jpg" style="width:170%;">
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/images/main_bg03.jpg" alt="main_bg03.jpg" style="width:170%;">
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
</c:if>


