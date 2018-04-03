<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
</script>
<style>
	.container{
		margin-top: 100px;
	}
	.table-hover{
		font-size: 13px;
	}

</style>
<jsp:include page="includes/admin_top.jsp" flush="true"/>
<div class="container">
	<form action="memberList" method="get">
		<table class="table table-hover">
			<colgroup>
				<col width="5%">
				<col width="17%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="25%">
				<col width="8%">
				<col width="15%">
			</colgroup>
	    	<thead class="thead-light">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>핸드폰</th>
					<th>사업자번호</th>
					<th>주소</th>
					<th>회원레벨</th>
					<th>가입일자</th>
				</tr>
			</thead>
			<c:forEach var="dto" items="${soList}" varStatus="status">
			<tbody>
				<tr>
					<td>${dto.rownum}</td>
				    <td>${dto.soId}<input type="hidden" name="soId" value="${dto.soId}"></td>
				    <td>${dto.soName}</td>
				    <td>${dto.soPhone}</td>
				    <td>${dto.soLicense}</td>
				    <td>${dto.soAddr}</td>
				    <td>${dto.soLevel}</td>
				    <td>${dto.soJoindate}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</form>
</div>