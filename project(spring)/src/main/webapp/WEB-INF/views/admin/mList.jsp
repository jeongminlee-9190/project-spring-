<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 회원 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_footer.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/admin/admin_mList.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="includes/admin_top.jsp" flush="true"/>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h4>개인회원 목록</h4>
			<span class="info">검색값을 입력하지 않고 검색을 클릭하면 전체 조회</span>
			<form action="mList" method="get">
				<table class="table">
		  			<tr align="center">
		   				<td colspan="5">
		   					<c:if test="${empty searchName || searchName=='memberId'}">
    							<select class="form-control" name="searchName">
        							<option value="memberId" selected="selected">아이디</option>
		        					<option value="memberName">이름</option>
		        					<option value="memberPhone">핸드폰</option>
     							</select> 
     							<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="${searchValue}"></td>    					
							</c:if>
							<c:if test="${searchName=='memberName'}">
    							<select class="form-control" name="searchName">
        							<option value="memberId">아이디</option>
		        					<option value="memberName">이름</option>
		        					<option value="memberPhone selected="selected">핸드폰</option>
     							</select>
     							<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="${searchValue}"></td>  					
							</c:if>
							<c:if test="${searchName=='memberPhone'}">
    							<select class="form-control" name="searchName">
        							<option value="memberId">아이디</option>
		        					<option value="memberName">이름</option>
		        					<option value="memberPhone" selected="selected">핸드폰</option>
     							</select>
     							<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="${searchValue}"></td>     					
							</c:if>
     					<td><input type="submit" class="btn btn-primary sm-black-background" value="검색"></td>
		 			</tr>
		  		</table>
				<table class="table table-hover">
			    	<thead class="thead-light">
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>핸드폰</th>
						</tr>
					</thead>
					<c:forEach var="dto" items="${mListpageDTO.list}" varStatus="status">
					<tbody>
						<tr>
							<td>${dto.rownum}</td>
				  			<td id="mid">${dto.mId}</td>
				  			<td>${dto.mName}</td>
				  			<td>${dto.mPhone}</td>
						</tr>
					</tbody>
					</c:forEach>
					<!-- 페이지번호 -->
				  	<tr>
				   		<td colspan="5" align="center">&nbsp;<jsp:include page="includes/mListPaging.jsp" flush="true" /></td>
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