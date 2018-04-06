<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_footer.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_mDormantList.css" rel="stylesheet" >
<script src="resources/js/admin_mDormentDel.js"></script>
</head>
<body>
<jsp:include page="includes/admin_top.jsp" flush="true"/>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h4>개인회원 - 휴면계정 삭제(90일이상 휴면)</h4>
			<form action="memberList" method="get">
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
				    <c:forEach var="dto" items="${mpageDTO.list}" varStatus="status">
					<tbody>
						<tr>
							<td>${dto.rownum}</td>
			  				<td id="mid">${dto.mId}</td>
			  				<td>${dto.mName}</td>
			  				<td>${dto.mPhone}</td>
			  				<td>${dto.mLastLogin2}일<input type="button" id="mDormantDel" data-num="${dto.mId}" class="btn btn-primary sm-black-background" value="삭제"></td>
						</tr>
					</tbody>
					</c:forEach>
					<!-- 페이지번호 -->
				  	<tr>
				   		<td colspan="5" align="center">&nbsp;<jsp:include page="includes/mDormantPaging.jsp" flush="true" /></td>
				  	</tr>
				</table>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>	
<jsp:include page="includes/admin_footer.jsp" flush="true"/>
</body>
</html>