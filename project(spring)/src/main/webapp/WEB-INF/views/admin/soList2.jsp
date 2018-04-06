<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_footer.css" rel="stylesheet" >
<script type="text/javascript">
$(document).ready(function(){
		
	$("#btn_del_so").on("click",function(){
		location.href="mDeleteServlet?mId="+$("#soId").text();
	});
	
	$("#soAdd").on("click",function(){
		location.href="";
	});
});
</script>
<style>
	.container{
		margin-top: 100px;
	}
</style>

<jsp:include page="includes/admin_top.jsp" flush="true"/>

<div class="container">
	<form action="changeSoLevel" method="get">
		<table class="table table-hover">
			<h3>가입 승인</h3>
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
					  	  <input type="submit" id="btn_change_soLevel" value="가입승인">
					  </td>
				  </tr>
			</tbody>
			</c:forEach>
		</table>
	</form>
</div>
<jsp:include page="includes/admin_footer.jsp" flush="true"/>