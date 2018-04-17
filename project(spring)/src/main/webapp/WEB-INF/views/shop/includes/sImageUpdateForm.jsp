<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="sImage" value="${sImage}"></c:set>
	<c:set var="sImage1" value="${fn: split(sImage,'/')[0]}"></c:set>
	<c:set var="sImage2" value="${fn: split(sImage,'/')[1]}"></c:set>
	<c:set var="sImage3" value="${fn: split(sImage,'/')[2]}"></c:set>
	<c:set var="sImage4" value="${fn: split(sImage,'/')[3]}"></c:set>
	<c:set var="sImage5" value="${fn: split(sImage,'/')[4]}"></c:set>
	<div class="container-fluid upload">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h3>상점 이미지 수정(구현중)</h3>
				<span class="blue">상점 이미지는 최대 5개까지 등록 가능하며, JPG 파일만 가능합니다.</span>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<br><br>
		<div class="row">
		  <div class="col-sm-1"></div>
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
			  	<input type="hidden" name="num" value="1">
			  	<c:if test="${empty sImage1}">
			  		<img src="resources/images/default.png" style="width: 100%; max-width: 700px; vertical-align: middle">
			  		이미지1<input type="file" name="theFile"><br>
					<input type="submit" class="btn btn-primary btn_submit" value="업로드">
			  	</c:if>
			  	<c:if test="${!empty sImage1}">
			  		<a class="btn btn-info" data-toggle="modal" data-target="#myModal">
			  		<img src="resources/upload/${sImage1}" style="width: 100%; max-width: 700px; vertical-align: middle"></a><br>
			  		이미지1
					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">이미지1</h4>
					      </div>
					      <div class="modal-body">
					        <img src="resources/upload/${sImage1}" style="width: 100%; max-width: 700px; vertical-align: middle">
					      </div>
					    </div>
					  </div>
					</div><!--end of Modal -->
					<input type="submit" class="btn btn-primary btn_submit" value="수정">
					<input type="button" class="btn btn-primary btn_delete" value="삭제">
			  	</c:if>
			</form>
		  </div>
		  
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
				<input type="hidden" name="num" value="2">
				<c:if test="${empty sImage2}">
					<img src="resources/images/default.png" style="width: 100%; max-width: 700px; vertical-align: middle"><br>
					이미지2<input type="file" name="theFile"><br>
					<input type="submit" class="btn btn-primary btn_submit" value="업로드">
				</c:if>
				<c:if test="${!empty sImage2}">
			  		<a class="btn btn-info" data-toggle="modal" data-target="#myModal2">
			  		<img src="resources/upload/${sImage2}" style="width: 100%; max-width: 700px; vertical-align: middle"></a><br>
			  		이미지2
					<!-- Modal -->
					<div id="myModal2" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">이미지2</h4>
					      </div>
					      <div class="modal-body">
					        <img src="resources/upload/${sImage2}" style="width: 100%; max-width: 700px; vertical-align: middle">
					      </div>
					    </div>
					  </div>
					</div><!--end of Modal -->
					<input type="submit" class="btn btn-primary btn_submit" value="수정">
					<input type="button" class="btn btn-primary btn_delete" value="삭제">
		  		</c:if>
			</form>
		  </div>
		  
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
				<input type="hidden" name="num" value="3">
				<c:if test="${empty sImage3}">
					<img src="resources/images/default.png" style="width: 100%; max-width: 700px; vertical-align: middle"><br>
					이미지3<input type="file" name="theFile"><br>
					<input type="submit" class="btn btn-primary btn_submit" value="업로드">
				</c:if>
				<c:if test="${!empty sImage3}">
			  		<a class="btn btn-info" data-toggle="modal" data-target="#myModal3">
			  		<img src="resources/upload/${sImage3}" style="width: 100%; max-width: 700px; vertical-align: middle"></a><br>
			  		이미지3
					<!-- Modal -->
					<div id="myModal3" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">이미지3</h4>
					      </div>
					      <div class="modal-body">
					        <img src="resources/upload/${sImage3}" style="width: 100%; max-width: 700px; vertical-align: middle">
					      </div>
					    </div>
					  </div>
					</div><!--end of Modal -->
					<input type="submit" class="btn btn-primary btn_submit" value="수정">
					<input type="button" class="btn btn-primary btn_delete" value="삭제">
		  		</c:if>
			</form>
		  </div>
		  
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
		  		<input type="hidden" name="num" value="4">
				<c:if test="${empty sImage4}">
					<img src="resources/images/default.png" style="width: 100%; max-width: 700px; vertical-align: middle"><br>
					이미지4<input type="file" name="theFile"><br>
					<input type="submit" class="btn btn-primary btn_submit" value="업로드">
				</c:if>
				<c:if test="${!empty sImage4}">
			  		<a class="btn btn-info" data-toggle="modal" data-target="#myModal4">
			  		<img src="resources/upload/${sImage4}" style="width: 100%; max-width: 700px; vertical-align: middle"></a><br>
			  		이미지4
					<!-- Modal -->
					<div id="myModal4" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">이미지4</h4>
					      </div>
					      <div class="modal-body">
					        <img src="resources/upload/${sImage4}" style="width: 100%; max-width: 760px; vertical-align: middle">
					      </div>
					    </div>
					  </div>
					</div><!--end of Modal -->
					<input type="submit" class="btn btn-primary btn_submit" value="수정">
					<input type="button" class="btn btn-primary btn_delete" value="삭제">
		  		</c:if>
			</form>
		  </div>
		  
		  <div class="col-sm-2">
		  	<form action="sImageUpload" method="POST" encType="multipart/form-data">
		  		<input type="hidden" name="num" value="5">
				<c:if test="${empty sImage5}">
					<img src="resources/images/default.png" style="width: 100%; max-width: 760px; vertical-align: middle"><br>
					이미지5<input type="file" name="theFile"><br>
					<input type="submit" class="btn btn-primary btn_submit" value="업로드">
				</c:if>
				<c:if test="${!empty sImage5}">
			  		<a class="btn btn-info" data-toggle="modal" data-target="#myModal5">
			  		<img src="resources/upload/${sImage5}" style="width: 100%; max-width: 760px; vertical-align: middle"></a><br>
			  		이미지5
					<!-- Modal -->
					<div id="myModal5" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">이미지5</h4>
					      </div>
					      <div class="modal-body">
					        <img src="resources/upload/${sImage5}" style="width: 100%; max-width: 760px; vertical-align: middle">
					      </div>
					    </div>
					  </div>
					</div><!--end of Modal -->
					<input type="submit" class="btn btn-primary btn_submit" value="수정">
					<input type="button" class="btn btn-primary btn_delete" value="삭제">
		  		</c:if>
			</form>
		  </div>
		  <div class="col-sm-1"></div>
		</div><!-- end if row -->
		<br><br>
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4 sManagement">
			<a href="sManagement" data-toggle="tooltip" title="이미지 등록을 완료합니다!">
			<input type="button" class="btn btn-primary btn-sManagement" value="상점관리 페이지로"></a>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>