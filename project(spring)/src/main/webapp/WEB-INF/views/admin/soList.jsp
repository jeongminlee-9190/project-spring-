<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점 회원 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_footer.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_soList.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="includes/admin_top.jsp" flush="true"/>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form action="soList" method="get">
				<h4>상점 회원 목록</h4>
				<span class="info">검색값을 입력하지 않고 검색을 클릭하면 전체 조회</span>
				<table class="table">
				  	<tr align="center">
				   		<td colspan="5">
				   			<c:if test="${empty searchName || searchName=='soId'}">
		    					<select class="form-control" name="searchName">
		        					<option value="soId" selected="selected">아이디</option>
				        			<option value="soName">이름</option>
				        			<option value="soLicense">사업자번호</option>
		     					</select> 
		     					<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="${searchValue}"></td>    					
							</c:if>
							<c:if test="${searchName=='soName'}">
		    					<select class="form-control" name="searchName">
		        					<option value="soId">아이디</option>
				        			<option value="soName" selected="selected">이름</option>
				        			<option value="soLicense">사업자번호</option>
		     					</select>
		     					<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="${searchValue}"></td>  					
							</c:if>
							<c:if test="${searchName=='soLicense'}">
		    					<select class="form-control" name="searchName">
		        					<option value="soId">아이디</option>
				        			<option value="soName">이름</option>
				        			<option value="soLicense" selected="selected">사업자번호</option>
		     					</select>
		     					<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="${searchValue}"></td>     					
							</c:if>		
		     			<td><input type="submit" class="btn btn-primary sm-black-background" value="검색"></td>
				 	</tr>
				  </table>
				<table class="table table-hover">
					<colgroup>
						<col width="6%">
						<col width="20%">
						<col width="8%">
						<col width="12%">
						<col width="10%">
						<col width="36%">
						<col width="8%">
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
						</tr>
					</thead>
					<c:forEach var="dto" items="${soListpageDTO.list}" varStatus="status">
					<tbody>
						<tr>
							<td>${dto.rownum}</td>
						    <td>${dto.soId}<input type="hidden" name="soId" value="${dto.soId}"></td>
						    <td>${dto.soName}</td>
						    <td>${dto.soPhone}</td>
						    <td>${dto.soLicense}</td>
						    <td>${dto.soAddr}</td>
						    <td>${dto.soLevel}</td>
						</tr>
					</tbody>
					</c:forEach>
					<!-- 페이지번호 -->
					<tr>
						<td colspan="7" align="center">&nbsp;<jsp:include page="includes/soListPaging.jsp" flush="true" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	
</div>
<jsp:include page="includes/admin_footer.jsp" flush="true"/>
</body>
</html>