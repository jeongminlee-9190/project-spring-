<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="wrapper">
	<form action="mNoticeDelete" method="get">
	<input type="hidden" name="num" value="${mNoticeRetrieve.noticeNum}">
	<div class="NoticeRetrieve">
		<table class="table">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="25%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead class="thead-light">
	 			<tr>
	  				<th scope="col">글번호</th>
	  				<td>${mNoticeRetrieve.noticeNum}</td>
	  				<th scope="col">제목</th>
	  				<td colspan="3">${mNoticeRetrieve.noticeTitle}</td>
	 			</tr>
 			</thead>
 			<tbody>
	 			<tr>
	 				<th>작성자</th>
	 				<td>${mNoticeRetrieve.noticeWriter}</td>
	 				<th>작성일</th>
	 				<td>${mNoticeRetrieve.noticeWritedate}</td>
	 				<th>조회수</th>
	 				<td>${mNoticeRetrieve.noticeReadcnt}</td>
	 			</tr>
	 			<tr>
	 				<td colspan="6" align="left" class="noticeContent">${mNoticeRetrieve.noticeContent}</td>	
	 			</tr>
	 			<tr>
	 				<td>
	 					<input type="submit" class="btn btn-primary black-background" value="삭제하기">
	 				</td>	
	 			</tr>
			</tbody>
		</table>
	</div>
	</form>
</div>
