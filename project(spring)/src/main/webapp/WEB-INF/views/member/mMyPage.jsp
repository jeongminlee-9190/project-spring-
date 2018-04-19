<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/m_myPage.js"></script>
<style>
	.row{
		margin-top: 70px;
	}
</style>
<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>

<c:set var="dto" value="${MemberMyPage}"></c:set>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3" ></div>
    <div class="col-sm-6">
    	<h3>마이페이지-기본정보</h3>
		<table class="table table-hover">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr>
				<th>아이디</th>
				<td>${dto.mId}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<a href="#" data-toggle="collapse" data-target="#demo">비밀번호 변경하기</a>
					  <div id="demo" class="collapse">
						<form class="form-horizontal" action="mPwUpdate" id="mPwUpdate" method="POST">
							<div class="form-group">
							    <label class="col-sm-5 control-label">현재 비밀번호</label>
							    <div class="col-sm-4">
							        <input class="form-control" type="password" id="old_mPasswd" class="old_mPasswd" maxlength="10" type="text">
							       	<span id="result1"></span>
							    </div>
				    		</div>
				    		<div class="form-group">
							    <label class="col-sm-5 control-label">새로운 비밀번호</label>
							    <div class="col-sm-4">
							        <input class="form-control" type="password" id="mPasswd" name="mPasswd" maxlength="10" type="text">
							        <span id="result2"></span>
							    </div>
				    		</div>
				    		<div class="form-group">
							    <label class="col-sm-5 control-label">새로운 비밀번호 재입력</label>
							    <div class="col-sm-4">
							        <input class="form-control" type="password" id="mPasswd2" name="mPasswd2" maxlength="10" type="text">
							        <span id="result3"></span>
							    </div>
				    		</div>
				    		<div class="form-group botton">
							   <input type="submit" class="btn btn-primary orange-background" value="변경하기">
				    		</div>
				    	</form>
			    	</div>
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><span id="mPhone">${dto.mPhone}</span>
					<form class='form-inline' action='mPhoneUpdate' id='mPhoneUpdateForm' method='POST'>
						<div class="phone_modify"><input type="button" name="mPhone" class="btn btn-primary btn-submit" id="btn_pw_submit" value="변경"></div>
					</form>
				</td>
			</tr>

			<tr>
				<th>닉네임</th>
				<td>${dto.mName}</td>
			</tr>
			<tr>
				<th>출생년도</th>
				<td>${dto.mBirth}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="main"><button type="button" class="btn btn-primary orange-border-main">메인으로</button></a>
				</td>
			</tr>
		</table>    
    </div>
    <div class="col-sm-4"></div>
  </div>
</div>
