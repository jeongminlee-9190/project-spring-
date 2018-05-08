<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<div id="myPage_title">
	<p>MY PAGE</p>
</div>
<div id="myPage_content_wrapper">

	<div id="myPage_content_wrap">
	
		<c:set var="dto" value="${MemberMyPage}"></c:set>
		
		<div id="myPage_id" class="myPage_list clearfix">
			<p>아이디</p>	
			<p>${dto.mId}</p>
		</div>
		
		<form class="form-horizontal" action="mPwUpdate" id="mPwUpdate" method="POST">
			<div id="myPage_passwd" class="myPage_list clearfix">
				<p>비밀번호</p>	
				<input type="password" id="old_mPasswd" class="old_mPasswd myPagePwText" maxlength="16" type="text"
					placeholder="현재 비밀번호">
				<span id="result1"></span>
			</div>
			
			<div id="myPage_passwdUpdate" class="myPage_list clearfix">
				<p>비밀번호 변경</p>	
				<input type="password" id="mPasswd" name="mPasswd" maxlength="16" type="text"
					placeholder="새 비밀번호" class=myPagePwText>
				<span id="result2"></span>
			</div>
			<div id="myPage_passwdUpdate2" class="myPage_list clearfix">
				<input type="password" id="mPasswd2" name="mPasswd" maxlength="16" type="text"
					placeholder="새 비밀번호 확인" class="myPagePwText">
				<input type="submit" value="변경하기">
			</div>
		</form>
		
		<div id="myPage_phone" class="myPage_list clearfix">
			<p>전화번호</p>	
			<p id="mPhone" >${dto.mPhone}</p>
		</div>
		
		<form action="mPhoneUpdate" id="mPhoneUpdateForm" method="POST">
			<div id="myPage_phoneUpdate" class="myPage_list clearfix">
				<p>전화번호 변경</p>	
				<select id="mPhone1" name="mPhone1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>-
				<input type="text" name="mPhone2" id="mPhone2" maxlength="4">-
				<input type="text" name="mPhone3" id="mPhone3" maxlength="4">
				<input type="submit" class="btn_pw_submit" value="변경하기">
			</div>
		</form>
		
		<div id="myPage_name" class="myPage_list clearfix">
			<p>닉네임</p>	
			<p>${dto.mName}</p>
		</div>
		
		<div id="myPage_birth" class="myPage_list clearfix">
			<p>출생년도</p>	
			<p>${dto.mBirth}</p>
		</div>
		
		<div id="myPage_home" class="myPage_list clearfix">
			<a href="main">
				<button type="button" >메인으로</button>
			</a>
		</div>
	
	</div>
		
</div>
