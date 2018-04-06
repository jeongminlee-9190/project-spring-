<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.logo{
		width:100px;
	}
</style>
	
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <a class="navbar-brand" href="main_admin">관리자 센터</a>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
       <ul class="navbar-nav">
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">개인 회원 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a class="dropdown-item" href="mList">회원 목록</a></li>
	           <li><a class="dropdown-item" href="mDormantList">휴면 계정 삭제</a></li>
	        </ul>
	    </li>
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">상점 회원 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a class="dropdown-item" href="soList">회원 목록</a></li>
 			   <li><a class="dropdown-item" href="soList2">가입 승인</a></li>
	           <li><a class="dropdown-item" href=SoDormantList>휴면 계정 삭제</a></li>
	           <li><a class="dropdown-item" href="aQna">1:1 문의 접수 현황</a></li>
	        </ul>
	    </li>
	    <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">상점 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a class="dropdown-item" href="sList">상점 목록</a></li>
	        </ul>
	    </li>
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">공지사항<span class="caret"></span></a>
 			<ul class="dropdown-menu">
	           <li><a class="dropdown-item" href="mNotice">개인 회원 공지사항</a></li>
	           <li><a class="dropdown-item" href="soNotice">상점 회원 공지사항</a></li>
	        </ul>
	    </li>
     </ul>
     
     <ul class="navbar-nav ml-auto">
       <li><a href="adminLogout">로그아웃</a></li>
     </ul>
     </div>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	   <span class="navbar-toggler-icon"></span>                       
	</button>
</nav>