<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h4>상점회원 - 휴면계정 삭제(90일이상 휴면)</h4>
			<table class="table table-hover">
				<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
			    <thead class="thead-light">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>핸드폰</th>
						<th>휴면기간</th>
					</tr>
				</thead>
				   <c:forEach var="dto" items="${sopageDTO.list}" varStatus="status">
				<tbody>
					<tr>
						<td>${dto.rownum}</td>
			  			<td id="mid">${dto.soId}</td>
			  			<td>${dto.soName}</td>
			  			<td>${dto.soPhone}</td>
			  			<td>${dto.sLastLogin2}일<input type="button" id="soDormantDel" data-num="${dto.soId}" class="btn btn-primary sm-black-background" value="삭제"></td>
					</tr>
				</tbody>
				</c:forEach>
				<!-- 페이지번호 -->
				<tr>
				   	<td colspan="5" align="center">&nbsp;<jsp:include page="soPaging.jsp" flush="true" /></td>
				</tr>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>	