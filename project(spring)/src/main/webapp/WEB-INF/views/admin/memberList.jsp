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
<jsp:include page="admin_top.jsp" flush="true"/>
<table border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>핸드폰</th>
	</tr>
	
	<c:forEach var="dto" items="${memberList}" varStatus="status">
	 <tr>
	  <td>${dto.rownum}</td>
	  <td id="mid">${dto.mId}</td>
	  <td>${dto.mName}</td>
	  <td>${dto.mPhone}</td>
	  <td><button id="delBtn">삭제(휴면계정)</button></td>
	 </tr>
	</c:forEach>
</table>
