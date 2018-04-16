<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
$(document).ready(function(){
	$(".btn-soApprove").on("click",function(){
	var soId =  $(this).attr("data-num");
		$.ajax({
			url:"soApprove",
			type:"get",
			data:{
				soId:soId
			},
			dataType:"text",
			success:function(responseData,status,xhr){
				alert(soId+' -가입 승인 완료');
				location.reload();
			},
			error:function(){}
		});
	});
});
</script>	
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
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
								<input type="button" class="btn btn-primary sm-black-background btn-soApprove" data-num="${dto.soId}" value="가입승인">
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>