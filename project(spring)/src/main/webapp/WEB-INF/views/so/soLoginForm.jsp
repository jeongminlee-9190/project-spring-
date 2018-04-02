<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>
