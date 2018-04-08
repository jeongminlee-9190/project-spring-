<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="login_title">
	<p>LOGIN</p>
</div>

<c:if test="${empty mLogin}">	
	<div id="login_content_wrapper">
	
		<form action="mLogin" method="post" id="mLoginForm">
		
			<input type="text" name="mId" id="mId" placeholder="아이디 또는 이메일">
			<input type="text" name="mPasswd" id="mPasswd" placeholder="비밀번호">
			<input type="submit" value="LOGIN" id="mLogin">
			<a href="mJoinForm" title="회원가입">
				<input type="button" value="회원가입">
			</a>
			
			<div id="mLine"></div>
			<a href="" title="아이디 및 비밀번호 찾기">
				<input type="button" value="아이디 및 비밀번호 찾기">
			</a>
			
		</form>
	
	</div>
</c:if>

<c:if test="${!empty mLogin}">
	<%-- <span class="state_login">${SoLogin.soId}&nbsp;</span>
	<a href="sologout"><span class="state_login">로그아웃</span></a>
	<a href="SoPwCheckUIServlet"><span class="state_login">MyPage</span></a> --%>
</c:if>

