<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginInfo" value="${loginInfo }" scope="session" />

<c:if test="${empty loginInfo }">
<div id="login_wrap" class="memberUI">
	<a href="loginForm" title="login">
		<span id="login">LOGIN</span>
		<span id="lgoin_icon"><img src="resources/images/login_icon.png"></span>
	</a>
</div>
</c:if>

<c:if test="${!empty loginInfo }">
<div id="login_wrap" class="memberUI">
	<a id="login" class="login_after clearfix" href="#" title="${loginInfo.mName}">
		<span id="login_txt">${loginInfo.mName}</span>
		<span id="lgoin_icon"><img src="resources/images/login_icon.png"></span>
	</a>
	<ul id="user_info_list" class="memberUI">
	  <li><a href="#">나의 맛집</a></li>
	  <li><a href="mMyPage">프로필 정보</a></li>
	  <li><a href="#">문의 사항</a></li>
	  <li><a href="logout">로그아웃</a></li>
	</ul>
</div>
</c:if>
