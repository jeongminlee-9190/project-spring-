<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="wrapper">
	<input type="hidden" name="num" value="${soNoticeRetrieve.noticeNum}">
	<div class="NoticeRetrieve">
		<table class="table">
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="40%">
			</colgroup>
			<tbody>
	 			<tr>
	  				<th>글번호</th>
	  				<td>${soNoticeRetrieve.noticeNum}</td>
	  				<th>제목</th>
	  				<td>${soNoticeRetrieve.noticeTitle}</td>
	 			</tr>
 			<tbody>
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
	 				<td scope="col">${soNoticeRetrieve.noticeWriter}</td>
	 				<th scope="col">작성일</th>
	 				<td scope="col">${soNoticeRetrieve.noticeWritedate}</td>
	 				<th scope="col">조회수</th>
	 				<td scope="col">${soNoticeRetrieve.noticeReadcnt}</td>
	 			</tr>
	 			<tr>
	 				<td colspan="6" align="left" class="noticeContent">${soNoticeRetrieve.noticeContent}</td>	
	 			</tr>
			</tbody>
		</table>
	</div>
</div>
