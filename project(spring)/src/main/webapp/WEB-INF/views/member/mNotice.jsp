<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet" >
<script type="text/javascript">
	$(document).ready(function(){
		  $(".mNoticeRetrieve").on("click",function(){
			  var num =  $(this).attr("data-num");
			  $.ajax({
				  url:"mNoticeRetrieve",
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
</head>

<body>
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

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h3>공지사항 </h3>
				<form action="mNotice" method="GET" class="form-inline" role="form">
					<table class="noticesearch_tbl">
	  					<tr align="center">
	   						<td colspan="5" align="center">
	    						<select name="searchName">
	        						<option value="title">제목</option>
	        						<option value="content">내용</option>
	     						</select>
				     			<input type="text" class="form-control" id="searchValue" name="searchValue">
				     			<input type="submit" class="btn btn-primary sm-black-background" value="검색">
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
						  		<td><a data-toggle="modal" data-target="#myModal" class="mNoticeRetrieve" data-num="${dto.noticeNum}">${dto.noticeTitle}</a></td>
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
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>
  