<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- <a href="MJoinFormServlet">회원가입</a> -->
<c:if test="${empty loginInfo}">
<div id="login_wrap">
	<a id="login" class="clearfix" href="mLoginForm" title="login">
		<span id="login_txt">LOGIN</span>
		<span id="lgoin_icon"><img src="resources/images/login_icon.png"></span>
	</a>
</div>
</c:if>

<c:if test="${!empty loginInfo}">
<div id="login_wrap" class="memberUI">
	<a id="login" class="login_after clearfix" href="#" title="${loginInfo.mName}">
		<span id="login_txt">${loginInfo.mName}</span>
		<span id="lgoin_icon"><img src="resources/images/login_icon.png"></span>
	</a>
	<ul id="user_info_list" class="memberUI">
	  <li><a href="#">나의 맛집</a></li>
	  <li><a href="mMyPageForm">프로필 정보</a></li>
	  <li><a href="#">문의 사항</a></li>
	  <li><a href="logout">로그아웃</a></li>
	</ul>
</div>
</c:if>
