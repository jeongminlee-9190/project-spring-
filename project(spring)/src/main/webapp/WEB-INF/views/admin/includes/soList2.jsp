<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<form action="soApprove" method="get">
				<h4>가입 승인</h4>
				<table class="table table-hover">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
			    	<thead class="thead-light">
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>가입일자</th>
							<th>회원레벨</th>
						</tr>
					</thead>
					<c:forEach var="dto" items="${soList2}" varStatus="status">
					<tbody>
						  <tr>
							  <td>${dto.rownum}</td>
							  <td>${dto.soId}<input type="hidden" name="soId" value="${dto.soId}"></td>
							  <td>${dto.soJoindate}</td>
							  <td>${dto.soLevel}
							  	  <!-- <select id="soLevel" name="soLevel">
							  	  	<option selected="selected" value="0">0: 미승인</option>
							  	  	<option value="1">1: 승인, 체험회원</option>
							  	  	<option value="2">2: 승인, 유료회원</option>
							  	  </select> -->
							  	  <input type="submit" class="btn btn-primary sm-black-background" value="가입승인">
							  </td>
						  </tr>
					</tbody>
					</c:forEach>
				</table>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>