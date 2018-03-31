<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
	$("#delBtn").on("click",function(){
		location.href="mDeleteServlet?mId="+$("#mid").text();
	});
	
	$("#memberAdd").on("click",function(){
		location.href="";
	});
});
</script>
<style>
	.container{
		margin-top: 100px;
	}
	.table{
		width: 500px;
	}

</style>

<jsp:include page="admin_top.jsp" flush="true"/>
<div class="container">
	<h4>개인회원 - 휴면계정 삭제</h4>
	<form action="memberList" method="get">
		<table class="noticesearch_tbl">
  			<tr align="center">
   				<td colspan="5">
    				<select name="searchName">
        				<option value="memberId">아이디</option>
        				<option value="memberName">이름</option>
        				<option value="memberPhone">핸드폰</option>
     				</select>
     				<input type="text" name="searchValue" size="40">
     				<input type="submit" value="검색">
   				</td>
 			</tr>
  		</table>
		<table class="table table-hover">
	    	<thead class="thead-light">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>핸드폰</th>
					<th>휴면기간</th>
				</tr>
			</thead>
			<c:forEach var="dto" items="${memberList2}" varStatus="status">
			<tbody>
				<tr>
					<td>${dto.rownum}</td>
	  				<td id="mid">${dto.mId}</td>
	  				<td>${dto.mName}</td>
	  				<td>${dto.mPhone}</td>
	  				<td>${dto.mLastLogin}<button id="delBtn">삭제(휴면계정)</button></td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</form>
</div>