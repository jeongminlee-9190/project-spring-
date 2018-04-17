<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container-fluid">
		<div class="row row1">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form action="aQnaList" method="get">
					<h3>1:1 문의</h3>
					<table class="table table-hover">
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="20%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						
						<thead class="thead-light">
							<tr>
								<td colspan="5" align="right">
									<span>답변 상태  </span>
									<c:if test="${empty searchName}">
										<select name="searchName" id="searchName">
											<option selected="selected"></option>
											<option>확인중</option>
											<option>처리중</option>
											<option>처리완료</option>
										</select><!-- 문의내용을 클릭하면 확인중에서 처리중으로 바뀌고, 답변을 하면 답변완료로 바뀐다. -->
									</c:if>
									<c:if test="${searchName=='확인중'}">
										<select name="searchName" id="searchName">
											<option></option>
											<option selected="selected">확인중</option>
											<option>처리중</option>
											<option>처리완료</option>
										</select>
									</c:if>
									<c:if test="${searchName=='처리중'}">
										<select name="searchName" id="searchName">
											<option></option>
											<option>확인중</option>
											<option selected="selected">처리중</option>
											<option>처리완료</option>
										</select>
									</c:if>
									<c:if test="${searchName=='처리완료'}">
										<select name="searchName" id="searchName">
											<option></option>
											<option>확인중</option>
											<option>처리중</option>
											<option selected="selected">처리완료</option>
										</select>
									</c:if>
									&nbsp;&nbsp;&nbsp;
									<span>조회 기간  </span>
									<c:if test="${empty searchName2}">
										<select name="searchName2">
											<option selected="selected"></option>
											<option>1주일</option>
											<option>1개월</option>
										</select>
									</c:if>
									<c:if test="${searchName2=='1주일'}">
										<select name="searchName2">
											<option></option>
											<option selected="selected">1주일</option>
											<option>1개월</option>
										</select>
									</c:if>
									<c:if test="${searchName2=='1개월'}">
										<select name="searchName2">
											<option></option>
											<option>1주일</option>
											<option selected="selected">1개월</option>
										</select>
									</c:if>
									<input type="submit" class="" id="search" value="검색">
								</td>
							</tr>
	
							<tr>
							  <th scope="col">문의유형</th>
							  <th scope="col">제목</th>
							  <th scope="col">작성자</th>
							  <th scope="col">문의날짜</th>
							  <th scope="col">답변상태</th>
				 			</tr>
						</thead>
						
						<tbody>
							<c:forEach var="dto" items="${AQnaPageDTO.list}" varStatus="status">
								<input type="hidden" name="soId" id="soId" value="${dto.soId}">
								<tr>
									<td>${dto.qnaCategory}</td>
									<td><c:set var="qnaTitle" value="${dto.qnaTitle}"/>	
										<a data-toggle="modal" data-target="#myModal" class="soQnaRetrieve" data-num="${dto.qnaNum}">${fn:substring(qnaTitle, 0, 16)}</a>
									</td>
									<!-- The Modal -->
									<div class="modal fade" id="myModal">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">  
												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">1:1 문의 답변하기</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>        
												<!-- Modal body -->
												<div class="modal-body">
						
												</div>
											</div>
										</div>
									</div>
									<td>${dto.soId}</td>
									<td>${dto.qnaWritedate}</td>
									<td>${dto.qnaComplete}<input type="hidden" class="qnaReplyStatement" value="${dto.qnaReplyStatement}"></td>
								</tr>
							</c:forEach>
							<!-- 페이지번호 -->
					  		<tr>
					   			<td colspan="5" align="center"><jsp:include page="aQnaListPaging.jsp" flush="true" /></td>
					  		</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div><!-- end of row -->
	</div>