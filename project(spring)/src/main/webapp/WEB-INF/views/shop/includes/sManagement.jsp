<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" value="${sInfo}">
<!-- 레벨이 0인 경우 메뉴를 클릭하면 다른페이지로 -->
<br>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-4">
			<h3>상점 등록 및 수정</h3><hr>
			<c:if test="${empty sInfo.sCode && empty sInfo.sImage}">
				<div class="card">
					<div class="card1">
    					<h3>1단계</h3>
						<span class="shopbasicinfo">상점 기본정보</span><br><br>
						<a href="SInfoEnrollForm"><input type="button" class="btn btn-primary btn_enroll"value="등록"></a><br><br>
 					</div>	
 					<div class="card2">
    					<h3>2단계</h3>
						<span class="shopimageinfo">상점 사진정보</span><br><br>
						<p class="shopwarn">기본정보 먼저 등록해주세요.</p>
 					</div>
 				</div>	
			</c:if>
			<c:if test="${!empty sInfo.sCode && empty sInfo.sImage}">
				<div class="card">
					<div class="card1">
    					<h3>1단계</h3>
						<span class="shopbasicinfo">상점 기본정보</span><br><br>
						<span>등록 완료</span><br><br>
						<a href="sInfoUpdateForm"><input type="button" class="btn btn-primary btn_enroll"value="기본정보 수정"></a>
 					</div>	
 					<div class="card2">
    					<h3>2단계</h3>
						<span class="shopimageinfo">상점 사진정보</span><br><br>
						<a href="sImageUploadForm"><input type="button" class="btn btn-primary btn_enroll"value="등록"></a><br><br>
 					</div>	
 				</div>
			</c:if>
		
			<c:if test="${!empty sInfo.sCode && !empty sInfo.sImage}">
				<div class="card">
					<div class="card1">
    					<h3>1단계</h3>
						<span class="shopbasicinfo">상점 기본정보</span><br><br>
						<span>등록 완료</span><br><br>
						<a href="sInfoUpdateForm"><input type="button" class="btn btn-primary btn_enroll"value="기본정보 수정"></a>
 					</div>	
 					<div class="card2">
    					<h3>2단계</h3>
						<span class="shopimageinfo">상점 사진정보</span><br><br>
						<span>등록 완료</span><br><br>
						<a href="sImageUploadForm"><input type="button" class="btn btn-primary btn_enroll"value="사진정보 수정"></a>
 					</div>
 				</div>
			</c:if>
		</div>
		<div class="col-sm-1"></div>
		<div class="col-sm-2" >
			<div class="shopView">
				<h3>상점 확인</h3><hr><br>
				<p>등록한 기본정보와 사진을 </p>
				<p>확인할 수 있습니다.</p>
				<br>
				<c:if test="${!empty sInfo.sCode && !empty sInfo.sImage}">
					<a href="sView"><input type="button" class="btn btn-primary btn_enroll"value="상점 확인"></a><br><br>
				</c:if>
				<c:if test="${empty sInfo.sCode && !empty sInfo.sImage}">
					<p class="shopwarn">기본 정보를 등록해주세요.</p>
				</c:if>
				<c:if test="${!empty sInfo.sCode && empty sInfo.sImage}">
					<p class="shopwarn">사진 정보를 등록해주세요.</p>
				</c:if>
				<c:if test="${empty sInfo.sCode && empty sInfo.sImage}">
					<p class="shopwarn">기본정보와 사진 정보를</p>
					<p class="shopwarn">등록해주세요.</p>
				</c:if>
			</div>
		</div>
		<div class="col-sm-1"></div>
		<div class="col-sm-2" >
			<div class="shopDeleteform">
				<h3>상점 삭제</h3><hr><br>
				<p class="shopwarn">삭제하면 복원되지 않습니다.<p>
				<br>
				<c:if test="${(!empty sInfo.sCode && !empty sInfo.sImage) ||(empty sInfo.sCode && !empty sInfo.sImage) ||(!empty sInfo.sCode && empty sInfo.sImage)}">
					<a href="sDelete"><input type="button" class="btn btn-primary btn_enroll"value="상점 삭제"></a><br><br>
				</c:if>
				<c:if test="${empty sInfo.sCode && empty sInfo.sImage}">
					<p class="shopwarn">삭제할 정보가 없습니다.</p>
				</c:if>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>	
</div>
