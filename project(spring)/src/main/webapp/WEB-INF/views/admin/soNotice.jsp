<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet" >
<script type="text/javascript">

	$(document).ready(function(){
		  $(".soNoticeRetrieve").on("click",function(){
			  var num =  $(this).attr("data-num");
			  $.ajax({
				  url:"soNoticeRetrieve",
				  type:"get",
				  data:{
					num:num
				  },
				  dataType:"text",
				  success:function(responseData,status,xhr){
					  $(".modal-body").html(responseData);
				  },
				  error:function(){}
			  });
		   });
	});
		 
</script>

<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>
<c:remove var="success"/>
<c:if test="${!empty ALogout}">
	<script type="text/javascript">
    	alert('${ALogout}');
    </script>
</c:if>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <a class="navbar-brand" href="main_admin"><img src="resources/images/logo.png" class="logo"> 관리자 센터</a>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
       <ul class="navbar-nav">
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">개인 회원 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a class="dropdown-item" href="memberList">회원 목록</a></li>
 			   <li><a class="dropdown-item" href="memberList">회원 등록</a></li>
	           <li><a class="dropdown-item" href="memberList2">휴면 계정 삭제</a></li>
	        </ul>
	    </li>
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">상점 회원 관리<span class="caret"></span></a>
 			<ul class="dropdown-menu">
 			   <li><a class="dropdown-item" href="soList">회원 목록</a></li>
 			   <li><a class="dropdown-item" href="soList2">가입 승인</a></li>
 			   <li><a class="dropdown-item" href="soList">회원 등록</a></li>
	           <li><a class="dropdown-item" href="soList2">회원 레벨 변경</a></li>
	           <li><a class="dropdown-item" href="soDelete">휴면 계정 삭제</a></li>
	           <li><a class="dropdown-item" href="#">1:1 문의 접수 현황</a></li>
	        </ul>
	    </li>
        <li class="nav-item active dropdown">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">공지사항<span class="caret"></span></a>
 			<ul class="dropdown-menu">
	           <li><a class="dropdown-item" href="mNotice">개인 회원 공지사항</a></li>
	           <li><a class="dropdown-item" href="soNotice">상점 회원 공지사항</a></li>
	        </ul>
	    </li>
     </ul>
     
     <ul class="navbar-nav ml-auto">
       <li><a href="adminLogout">로그아웃</a></li>
     </ul>
     </div>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	   <span class="navbar-toggler-icon"></span>                       
	</button>
</nav>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-5">
			<div class="pagebox">
				<h3>상점회원 공지사항 목록</h3>
				<form action="soNotice" method="GET" class="form-inline" role="form">
					<table class="noticesearch_tbl">
  						<tr align="center">
   							<td colspan="5" align="center">
   								<div class="form-group">
	    							<select name="searchName">
	        							<option value="title">제목</option>
	        							<option value="content">내용</option>
	     							</select>
	    							<input type="text" class="form-control" id="searchValue" name="searchValue"> 
				     				<input type="submit" class="btn btn-primary sm-black-background" value="검색">
  							    </div>
   							</td>
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
					  			<td><a data-toggle="modal" data-target="#myModal" class="soNoticeRetrieve" data-num="${dto.noticeNum}">${dto.noticeTitle}</a></td>
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
		<div class="col-md-7">
			<div class="pagebox">
				<h3>상점회원 공지사항 쓰기</h3>
				<form action="soNoticeWrite" method="POST">
					<table class="NoticeWrite_tbl">
						 <tr>
							<td>
								<div class="form-group">
								  	<label for="title">제목:</label>
								  	<input type="text" class="form-control" id="noticeTitle" name="noticeTitle">
								</div>
							</td>
						 </tr>
						 <tr>
						 	<td colspan="2">
							 	  <div class="form-group">
								  	<label for="noticeContent">내용:</label>
								  	<textarea class="form-control" rows="13" id="comment" name="noticeContent"></textarea>
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

  