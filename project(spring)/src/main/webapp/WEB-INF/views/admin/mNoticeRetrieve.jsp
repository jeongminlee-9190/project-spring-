<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="notice_more_wrapper" class="wrapper">
	<form action="mNoticeDelete" method="get">
		<input type="hidden" name="num" value="${mNoticeRetrieve.noticeNum}">
		
		<div id="notice_more_title_wrap">
			<div class="notice_more_subTitle clearfix">
				<p>제목</p>
				<p>${mNoticeRetrieve.noticeTitle}</p>
			</div>
		</div>

		<div id="notice_more_subTitle_wrap" class="NoticeRetrieve clearfix">
			<div class="notice_more_subTitle clearfix">
				<p>글번호</p>
				<p>${mNoticeRetrieve.noticeNum}</p>
			</div>
			<div class="notice_more_subTitle clearfix">
				<p>작성자</p>
				<p>${mNoticeRetrieve.noticeWriter}</p>
			</div>
			<div class="notice_more_subTitle clearfix">
				<p>작성일</p>
				<p>${mNoticeRetrieve.noticeWritedate}</p>
			</div>
			<div class="notice_more_subTitle clearfix">
				<p>조회수</p>
				<p>${mNoticeRetrieve.noticeReadcnt}</p>
			</div>
		</div>

		<div id="notice_more_text">
			<textarea class="form-control" id="comment" name="noticeContent" maxlength="1000" disabled>${mNoticeRetrieve.noticeContent}</textarea>
		</div>
		
		<div id="notice_more_del">
			<input type="submit" value="삭제하기">
		</div> 
		
	</form>
			
</div>

