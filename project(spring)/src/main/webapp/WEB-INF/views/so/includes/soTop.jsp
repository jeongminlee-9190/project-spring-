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
<c:if test="${!empty SoLogin}"> 
	<nav class="navbar navbar-inverse">
	   <div class="container-fluid">
	     <div class="navbar-header">
	        <a class="navbar-brand" href="main_admin">갬성갱단</a>
	     </div>
	     
	     <ul class="nav navbar-nav">
	     	<li><a href="#">서비스 소개</a></li>
	     	<li><a href="#">상점 관리</a></li>
	     	<li><a href="#">서비스 결제</a></li>
	        <li class="dropdown">
	        	<a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터<span class="caret"></span></a>
	 			<ul class="dropdown-menu">
		           <li><a href="#">공지사항</a></li>
		           <li><a href="#">자주 묻는 질문</a></li>
		           <li><a href="#">1:1 문의</a></li>
		        </ul>
		    </li>
		    <li><a href="#">예약관리</a></li>
	     </ul>
	     
	     <ul class="nav navbar-nav navbar-right">
	       <li><a href="#">계정: ${SoLogin.soId}</a></li>
	       <li><a href="sologout">로그아웃</a></li>
	       <li><a href="adminLogout">마이페이지</a></li>
	     </ul>
	  </div>
	</nav>
</c:if>


