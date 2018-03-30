<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>     

<nav class="navbar navbar-inverse">
   <div class="container-fluid">
     <div class="navbar-header">
	    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	       <span class="icon-bar"></span>
	       <span class="icon-bar"></span>
	       <span class="icon-bar"></span>                        
	    </button>
        <a class="navbar-brand" href="main_admin">갬성갱단</a>
     </div>
     
     <div class="navbar-collapse collapse" id="myNavbar">
     <ul class="nav navbar-nav">
        <li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown" href="#">개인 회원 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a href="memberList">회원 목록</a></li>
 			   <li><a href="memberList">회원 등록</a></li>
	           <li><a href="memberDelete">휴면 계정 삭제</a></li>
	        </ul>
	    </li>
        <li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown" href="#">상점 회원 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a href="soList">회원 목록</a></li>
 			   <li><a href="soList2">가입 승인</a></li>
 			   <li><a href="soList">회원 등록</a></li>
	           <li><a href="soList2">회원 레벨 변경</a></li>
	           <li><a href="soDelete">휴면 계정 삭제</a></li>
	           <li><a href="#">1:1 문의 접수 현황</a></li>
	        </ul>
	    </li>
        <li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown" href="#">공지사항<span class="caret"></span></a>
 			<ul class="dropdown-menu">
	           <li><a href="#">개인 회원 공지사항</a></li>
	           <li><a href="#">상점 회원 공지사항</a></li>
	        </ul>
	    </li>
     </ul>
     
     <ul class="nav navbar-nav navbar-right">
       <li><a href="adminLogout">로그아웃</a></li>
     </ul>
     </div>
  </div>
</nav>

