<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="wrapper">
	<form action="mNoticeDelete" method="get">
	<input type="hidden" name="num" value="${mNoticeRetrieve.noticeNum}">
	<div class="NoticeRetrieve">
		<table class="table">
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="70%">
			</colgroup>
			<tbody>
	 			<tr>
	  				<th>글번호</th>
	  				<td>${mNoticeRetrieve.noticeNum}</td>
	  				<th>제목</th>
	  				<td>${mNoticeRetrieve.noticeTitle}</td>
	 			</tr>
 			</tbody>
		</table>
		<table class="table">
			<colgroup>
				<col width="15%">
				<col width="20%">
				<col width="15%">
				<col width="20%">
				<col width="15%">
				<col width="15%">
			</colgroup>
	 		<tbody>
		 		<tr>
		 			<th scope="col">작성자</th>
		 			<td scope="col">${mNoticeRetrieve.noticeWriter}</td>
		 			<th scope="col">작성일</th>
		 			<td scope="col">${mNoticeRetrieve.noticeWritedate}</td>
		 			<th scope="col">조회수</th>
		 			<td scope="col">${mNoticeRetrieve.noticeReadcnt}</td>
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
