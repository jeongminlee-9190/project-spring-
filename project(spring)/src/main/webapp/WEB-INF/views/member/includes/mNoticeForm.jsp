<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>
<c:remove var="success"/>
<%-- <c:if test="${!empty ALogout}">
	<script type="text/javascript">
    	alert('${ALogout}');
    </script>
</c:if> --%>

<div id="notice_title">
	<p>NOTICE</p>
</div>
	
<div id="notice_content_wrapper">
	<div id="notice_wrap">
		<form action="mNotice" method="GET" role="form">
			<c:if test="${empty searchName || searchName=='title'}">
			<div id="notice_search_wrap" class="clearfix">
				<select name="notice_searchName">
					<option value="title" selected="selected">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" id="searchValue" name="searchValue" placeholder="검색" value="${searchValue}">
				<button type="submit">
					<img src="resources/images/search_icon.png" title="검색">
				</button>
			</div>
			</c:if>	
			<c:if test="${searchName=='content'}">
			<div id="notice_search_wrap" class="clearfix">
				<select name="notice_searchName">
					<option value="title">제목</option>
					<option value="content" selected="selected">내용</option>
				</select>
				<input type="text" id="searchValue" name="searchValue" placeholder="검색" value="${searchValue}">
				<button type="submit">
					<img src="resources/images/search_icon.png" title="검색">
				</button>
			</div>
			</c:if>
		</form>
		<table id="notice_board_wrap">
			<thead>
				<tr>
					<th scope="col">번호</th>
				  	<th scope="col">제목</th>
				  	<th scope="col">작성일</th>
				  	<th scope="col">조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${pageDTO.list}" varStatus="status">
				<tr>
					<td>${dto.noticeNum}</td>
			  		<td><c:set var="noticeTitle" value="${dto.noticeTitle}"/>
			  			<a data-toggle="modal" data-target="#myModal" class="mNoticeRetrieve" data-num="${dto.noticeNum}">
			  			${fn:substring(noticeTitle, 0, 16)}</a>
			  		</td>
			  		<td>${dto.noticeWritedate}</td>
			  		<td>${dto.noticeReadcnt}</td>
			  		<!-- 공지사항 자세히 보기 -->
					<!-- The Modal -->
					<div id="myModal" class="modal fade">
						<div id="noticeMoreWrapper" class="modal-dialog modal-lg">
							<div class="modal-content">
								<!-- Modal Header -->
								<div id="notice_more_header_wrap" class="modal-header">
									<h4 class="modal-title">공지사항 자세히 보기</h4>
									<button id="notice_more_close" type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
									        
								<!-- Modal body -->
								<div id="modal-body" class="modal-body">
								</div>
							 </div>
						</div>
					</div>
				</tr>
				</c:forEach>
			</tbody>

		</table>
		
		<!-- 페이지번호 -->
		<div id="notice_page_wrap">
			<jsp:include page="mNoticePaging.jsp" flush="true" />
		</div>
	</div>
</div>
