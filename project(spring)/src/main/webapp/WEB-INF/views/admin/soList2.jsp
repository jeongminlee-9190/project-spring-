<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>


  

<script type="text/javascript">
$(document).ready(function(){
		
	$("#btn_del_so").on("click",function(){
		location.href="mDeleteServlet?mId="+$("#soId").text();
	});
	
	$("#soAdd").on("click",function(){
		location.href="";
	});
});
</script>
<style>
	.container{
		margin-top: 100px;
	}
</style>



<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	
       <a class="navbar-brand" href="views/main_admin">갬성갱단</a>
     
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
       <ul class="navbar-nav">
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">개인 회원 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a class="dropdown-item" href="memberList">회원 목록</a></li>
 			   <li><a class="dropdown-item" href="memberList">회원 등록</a></li>
	           <li><a class="dropdown-item" href="memberDelete">휴면 계정 삭제</a></li>
	        </ul>
	    </li>
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">상점 회원 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a class="dropdown-item" href="soList">회원 목록</a></li>
 			   <li><a class="dropdown-item" href="soList2">가입 승인</a></li>
 			   <li><a class="dropdown-item" href="soList">회원 등록</a></li>
	           <li><a class="dropdown-item" href="soList2">회원 레벨 변경</a></li>
	           <li><a class="dropdown-item" href="soDelete">휴면 계정 삭제</a></li>
	           <li><a class="dropdown-item" href="#">1:1 문의 접수 현황</a></li>
	        </ul>
	    </li>
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">공지사항<span class="caret"></span></a>
 			<ul class="dropdown-menu">
	           <li><a class="dropdown-item" href="#">개인 회원 공지사항</a></li>
	           <li><a class="dropdown-item" href="#">상점 회원 공지사항</a></li>
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

<div class="container">
	<form action="changeSoLevel" method="get">
		<table class="table table-hover">
			<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="30%">
			</colgroup>
	    	<thead class="thead-light">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>가입일자</th>
					<th>회원레벨</th>
				</tr>
			</thead>
			<c:forEach var="dto" items="${soList2}" varStatus="status">
			<tbody>
				  <tr>
					  <td>${dto.rownum}</td>
					  <td>${dto.soId}<input type="hidden" name="soId" value="${dto.soId}"></td>
					  <td>${dto.soJoindate}</td>
					  <td>${dto.soLevel}
					  	  <select id="soLevel" name="soLevel">
					  	  	<option selected="selected" value="0">0: 미승인</option>
					  	  	<option value="1">1: 승인, 체험회원</option>
					  	  	<option value="2">2: 승인, 유료회원</option>
					  	  </select>
					  	  <input type="submit" id="btn_change_soLevel" value="수정">
					  </td>
				  </tr>
			</tbody>
			</c:forEach>
		</table>
	</form>
</div>