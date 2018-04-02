<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/so_mypage.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >

<script type="text/javascript">
	$(document).ready(function(){
		$(".btn_pw_submit").click(function(){
			$(".phone_modify").html("<form action='soPhoneUpdateServlet' method='get'><input type='text' name='soPhone1' id='soPhone1' size='3'>-<input type='text' name='soPhone2' id='soPhone2' size='3'>-<input type='text' name='soPhone3' id='soPhone2' size='3'><input type='submit' value='변경완료'></form>")
		});
	});
</script>
<jsp:include page="includes/soTop.jsp" flush="true"/>
<c:set var="dto" value="${SoMyPage}"></c:set>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3" ></div>
    <div class="col-sm-6">
    	<h3>마이페이지-기본정보</h3>
		<table class="table table-hover">
			<tr>
				<th>아이디</th>
				<td>${dto.soId}</td>
			</tr>
			<!-- <tr>
				<th>비밀번호</th>
				<td><a href="SoPwUpdateFormServlet"><input type="button" name="pw_modify" class="btn_pw_submit" value="변경"></a></td>
			</tr> -->
			<tr>
				<th>사업주 전화번호</th>
				<td>${dto.soPhone} 
				<div class="phone_modify"><input type="button" name="soPhone" class="btn_pw_submit" value="변경"></div></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="alert alert-warning">
	  					사업주 이름, 사업자 번호, 주소를 변경하고자 할 때에는 <br>
	  					해당 내용이 반영된 사업자등록증을 보내주셔야 가능합니다.
					</div>
				</td>
			</tr>
			<tr>
				<th>사업주 이름</th>
				<td>${dto.soName}</td>
			</tr>
			<tr>
				<th>사업자 번호</th>
				<td>${dto.soLicense}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${dto.soPost}&nbsp;&nbsp;${fn:split(dto.soAddr,'/')[0]}&nbsp;&nbsp;${fn:split(dto.soAddr,'/')[1]}</td>
			</tr>
			<tr>
				<th>회원 레벨</th>
				<td><c:if test="${dto.soLevel eq 0}">미승인</c:if><c:if test="${dto.soLevel eq 1}">체험</c:if><c:if test="${dto.soLevel eq 2}">유료</c:if></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${dto.soJoindate}</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<a href="main_shopowner"><button type="button" class="btn btn-primary orange-border-main">메인으로</button></a>
				<a href="soLeave"><button type="button" class="btn btn-primary orange-border-leave">회원탈퇴</button></a></td>
			</tr>
		</table>    
    </div>
    <div class="col-sm-3"></div>
  </div>
</div>
<jsp:include page="soFooter.jsp" flush="true"/>
