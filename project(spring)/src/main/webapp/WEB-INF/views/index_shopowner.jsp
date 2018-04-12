<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>갬성갱단 상점 관리 센터</title>
<link href="resources/css/fonts.css" rel="stylesheet" >
<link href="resources/css/index_so.css" rel="stylesheet" >
<style>
	body { 
		background-color: black;
	}
	.loginForm{
		padding-top: 2%;
		margin-left: 38%;
		text-align:center;
		background-color: black;
		height: 450px;
		width: 340px;
	}
</style>
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

<c:if test="${!empty mesg}">
	<script type="text/javascript">
    	alert('${mesg}');
    </script>
</c:if>

<c:if test="${! empty fail}">
   <script type="text/javascript">
    alert('${fail}');
   </script>
</c:if>
<c:remove var="fail"/>
<div class="container-fluid">
	<c:if test="${empty SoLogin}">
		<form action="sologin" method="get" class="loginForm">
			<img src="resources/images/logo.png" class="logo"><br>
			<h3>상점 관리 센터</h3>
			<input type="text" name="soId" class="input_soId" placeholder="아이디(이메일 형식)" maxlength="30"><br>
			<input type="password" name="soPasswd" class="input_soPasswd" placeholder="비밀번호" maxlength="10"><br>
			<input type="submit" class="btn btn-primary orange-background" value="로그인"><br>

			<a href="soJoinForm"><input type="button" class="btn btn-primary orange-border" value="회원가입"></a><br>
			<a href="soFindIdForm"><input type="button" class="btn btn-primary orange-border2" value="아이디 찾기"></a>
			<a href="soFindPwForm"><input type="button" class="btn btn-primary orange-border2" value="비밀번호 찾기"></a>
		</form>
	</c:if>

	<c:if test="${!empty SoLogin}">
		<span class="state_login">${SoLogin.soId}&nbsp;</span>
		<a href="sologout"><span class="state_login">로그아웃</span></a>
		<a href="SoPwCheckUIServlet"><span class="state_login">MyPage</span></a>
	</c:if>
</div>
</body>
</html>
