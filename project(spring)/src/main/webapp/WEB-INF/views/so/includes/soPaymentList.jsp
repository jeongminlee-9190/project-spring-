<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.row1{
		margin-top: 90px;
		margin-bottom: 40px;
	}
	
	#soPaymentList{
		text-align: right;
	}
	.orange-background{
		background-color: orange;
		border: 1px solid orange;
		color: white;
	}
</style>

<div class="container-fluid">
	<div class="row row1">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h3>마이페이지-서비스 결제 내역</h3>
			<span class="info">검색값을 입력하지 않고 검색을 클릭하면 전체 조회</span>
			<form class="form-inline" action="soPaymentList" method="GET" id="soPaymentList">
				<table>
					<colgroup>
						<col width="10%">
						<col width="65%">
						<col width="25%">
						<col width="10%">
					</colgroup>
					<tr>
						<td></td>
						<td></td>
						<td align="right">
							<div class="form-group">
								<c:if test="${empty searchName}">
									<select class="form-control" name="searchName">
										<option selected="selected"></option>
										<option>1주일</option>
										<option>1개월</option>
									</select>
								</c:if>
								<c:if test="${searchName=='1주일'}">
									<select class="form-control" name="searchName">
										<option></option>
										<option selected="selected">1주일</option>
										<option>1개월</option>
									</select>
								</c:if>
								<c:if test="${searchName=='1개월'}">
									<select class="form-control" name="searchName">
										<option></option>
										<option>1주일</option>
										<option selected="selected">1개월</option>
									</select>
								</c:if>
							</div>
						</td>
						<td>
							<div class="form-group">
								<input type="submit" class="btn btn-primary orange-background" value="검색">
							</div>
						</td>
					</tr>
				</table>
			</form>
			<table class="table table-hover">
				<colgroup>
					<col width="15%">
					<col width="40%">
					<col width="30%">
					<col width="15%">
				</colgroup>
				<thead class="thead-light">
				
					<tr>
						<th scope="col">번호</th>
						<th scope="col">서비스</th>
						<th scope="col">결제날짜</th>
						<th scope="col">결제상태</th>
			 		</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${soPaymentList.list}" varStatus="status">
							<input type="hidden" name="soId" id="soId" value="${dto.soId}">
							<tr>
								<td>${dto.payNum}</td>
								<td>${dto.period}일 이용</td>
								<td>${dto.payDate}</td>
								<td>완료</td>
							</tr>
						</c:forEach>
						<!-- 페이지번호 -->
					  	<tr>
					   		<td colspan="4" align="center">&nbsp;<jsp:include page="soPaymentListPaging.jsp" flush="true" /></td>
					  	</tr>
					</tbody>
				</table>
				
			</div>
			<div class="col-md-3"></div>
		</div><!-- end of row -->
	</div>
