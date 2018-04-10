<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<div class="pagebox">
				<h3>개인회원 공지사항</h3>
				<span class="info">검색값을 입력하지 않고 검색을 클릭하면 전체 조회</span>
				<form action="mNotice" method="GET" role="form">
					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="70%">
							<col width="15%">
						</colgroup>
  						<tr align="center">
   							<td colspan="5" align="center">
   								<c:if test="${empty searchName || searchName=='title'}">
	    							<select class="form-control" id="searchName" name="searchName">
	        							<option value="title" selected="selected">제목</option>
	        							<option value="content">내용</option>
	     							</select> 
	     							<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="${searchValue}"></td>    					
								</c:if>
     							
     							<c:if test="${searchName=='content'}">
	    							<select class="form-control" id="searchName" name="searchName">
	        							<option value="title">제목</option>
	        							<option value="content" selected="selected">내용</option>
	     							</select>
	     							<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="${searchValue}"></td>
     							</c:if>
     							<td><input type="submit" class="btn btn-primary sm-black-background" value="검색"></td>
 						</tr>
  					</table>
  				</form>
				<table class="table table-hover">
					<colgroup>
						<col width="15%">
						<col width="45%">
						<col width="25%">
						<col width="15%">
					</colgroup>
				 			
					<thead class="thead-light">
						<tr>
					  		<th scope="col">번호</th>
					  		<th scope="col">제목</th>
					  		<th scope="col">작성일</th>
					  		<th scope="col">조회수</th>
				 		</tr>
					</thead>
					<c:forEach var="dto" items="${pageDTO.list}" varStatus="status">
						<tbody>
					 		<tr>
					  			<td align="center">${dto.noticeNum}</td>
					  			<td><c:set var="noticeTitle" value="${dto.noticeTitle}"/>
					  				<a data-toggle="modal" data-target="#myModal" class="mNoticeRetrieve" data-num="${dto.noticeNum}">${fn:substring(noticeTitle, 0, 16)}</a></td>
					  			<td align="center">${dto.noticeWritedate}</td>
					  			<td align="center">${dto.noticeReadcnt}</td>
					  			<!-- The Modal -->
								<div class="modal fade" id="myModal">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											      
											<!-- Modal Header -->
											<div class="modal-header">
												<h4 class="modal-title">공지사항 자세히 보기</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
												        
											<!-- Modal body -->
											<div class="modal-body">
											</div>
										 </div>
									</div>
								</div>
					 		</tr>
				 		</tbody>
					</c:forEach>
				  	<!-- 페이지번호 -->
				  	<tr>
				   		<td colspan="5" align="center">◀&nbsp;<jsp:include page="noticePaging.jsp" flush="true" />▶</td>
				  	</tr>
				  </table>
			</div>
		</div>
		<div class="col-md-6">
			<div class="pagebox">
				<h3></h3>
				<form action="mNoticeWrite" method="POST">
					<table class="NoticeWrite_tbl">
						 <tr>
							<td>
								<div class="form-group">
								  	<label for="title">제목:</label>
								  	<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" maxlength="30">
								</div>
							</td>
						 </tr>
						 <tr>
						 	<td colspan="2">
							 	  <div class="form-group">
								  	<label for="noticeContent">내용:</label>
								  	<textarea class="form-control" rows="12" id="comment" name="noticeContent" maxlength="1000"></textarea>
								  </div>
							  </td>
						</tr>
						 <tr>
						 	<td colspan="2" align="center">
						 	<input type="submit" class="btn btn-primary black-background" value="작성완료">
						 	<input type="reset" class="btn btn-primary black-border" value="취소"></td>
						 </tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>