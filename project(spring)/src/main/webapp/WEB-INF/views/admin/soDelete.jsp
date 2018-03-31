<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
	$("#btn_del_so").on("click",function(){
		location.href="mDeleteServlet?mId="+$("#soId").text();
	});
	
	$("#soAdd").on("click",function(){
		location.href="";
	});
	
	/* $("#btn_change_soLevel").on("click",function(){
		location.href="changeSoLevel?soId="+$("#soId").text()+"&soLevel="+$("#soLevel").val();
	}); */
});
</script>
<form action="changeSoLevel" method="get">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>회원레벨</th>
			<th>가입일자</th>
			<th>휴면기간</th>
		</tr>
		<c:forEach var="dto" items="${soList}" varStatus="status">
		 <tr>
		  <td>${dto.rownum}</td>
		  <td>${dto.soId}<input type="hidden" name="soId" value="${dto.soId}"></td>
		  <td>${dto.soLevel}
		  <td>${dto.soJoindate}</td>
		  <td><button id="btn_del_so">삭제</button></td>
		 </tr>
		</c:forEach>
	</table>
</form>
