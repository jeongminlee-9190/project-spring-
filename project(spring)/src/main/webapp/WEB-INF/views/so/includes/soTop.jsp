<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
.logo{
	width:100px;
}
</style>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
				    <span class="icon-bar"></span>
				    <span class="icon-bar"></span> 
				</button>
			        <a class="navbar-brand" href="main_shopowner">갬성갱단 상점 센터</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
				    <li class="active"><a href="#" >서비스 소개</a></li>
				    <li class="active"><a href="sManagement" >상점 관리</a></li>
				    <li class="active"><a href="payMentUI">서비스 결제</a></li>
					<li class="active"><a href="#">예약관리</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				    <li><a href="#">계정: ${SoLogin.soId}</a></li>
				    <li class="active"><a href="sologout">로그아웃</a></li>
				    <li class="dropdown active">
				        <a class="dropdown-toggle" data-toggle="dropdown" href="#" class="active">마이페이지<span class="caret"></span></a>
				 		<ul class="dropdown-menu">
					        <li><a href="soMyPage">기본정보</a></li>
					        <li><a href="soPasswdUpdate">비밀번호 변경</a></li>
					        <li><a href="#">서비스 결제 내역</a></li>
					    </ul>
					</li>
					<li class="dropdown active">
				        <a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터<span class="caret"></span></a>
				 		<ul class="dropdown-menu">
					        <li><a href="#">공지사항</a></li>
					        <li><a href="#">자주 묻는 질문</a></li>
					        <li><a href="soQna">1:1 문의</a></li>
					    </ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>


