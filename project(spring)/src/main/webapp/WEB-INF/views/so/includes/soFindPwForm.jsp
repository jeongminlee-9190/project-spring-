<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 	.row{
 		margin-top: 90px;
 		margin-bottom: 40px;
 	}
	hr{
		border: 2px solid orange;
	}
	.orange-bg{
		border: 1px solid orange;
		background-color: orange;
		width: 100px;
		margin-top: 10px;
	}
	.orange-border{
		border: 1px solid orange;
		background-color: white;
		color: orange;
		width: 220px;
		margin-top: 10px;
	}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h3>비밀번호 찾기</h3><hr><br>
			<form action="SoFind" id="SoFindForm" method="get">
				<input type="hidden" name="find" value="soPasswd">
				<table class="table">
			 		<tr>
			 			<th>아이디</th>
			 			<td><input type="text" name="soId" id="soId" size="25" maxlength="30" placeholder="이메일 형식"></td>
			 		</tr>
			 		<tr>
			 			<th>사업자 번호</th>
			 			<td><input type="text" name="soLicense" id="soLicense" size="11" maxlength="10" placeholder="-하이픈 입력X"></td>
			 		</tr>
			 		<tr>
			 			<th>사업주 이름</th>
			 			<td><input type="text" name="soName" id="soName" size="11" maxlength="10"></td>
			 		</tr>
			 		<tr>
			 			<th>사업주 전화번호</th>
			 			<td><input type="text" name="soPhone1" id="soPhone1" size="2" maxlength="3">-<input type="text" name="soPhone2" id="soPhone2" size="2" maxlength="4">-<input type="text" name="soPhone3" id="soPhone3" size="2" maxlength="4"></td>
			 		</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" class="btn btn-primary orange-bg" value="찾기">
						<a href="index_shopowner"><input type="button" class="btn btn-primary orange-border" value="로그인 페이지로 가기"></a></td>
					</tr>			
				</table>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>

