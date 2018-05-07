<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<div id="login_title">
	<p>LOGIN</p>
</div>

<c:if test="${empty mLogin}">	
	<div id="login_content_wrapper">
	
		<form action="login" method="post" id="mLoginForm">
		
			<input type="text" name="mId" id="mId" placeholder="아이디 또는 이메일">
			<input type="password" name="mPasswd" id="mPasswd" placeholder="비밀번호">
			<input type="submit" value="LOGIN" id="mLogin">
			<a href="mJoinForm" title="회원가입">
				<input type="button" value="회원가입">
			</a>
			
			<div id="mLine"></div>
			<a href="mIdPwSearchForm" title="아이디 및 비밀번호 찾기">
				<input type="button" value="아이디 및 비밀번호 찾기">
			</a>
			
		</form>
	
	</div>
</c:if>

