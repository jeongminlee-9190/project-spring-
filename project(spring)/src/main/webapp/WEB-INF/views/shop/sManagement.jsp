<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<link href="${pageContext.request.contextPath}/resources/css/s_management.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
<title>상점 관리</title>
</head>

<body>
<c:if test="${!empty success}">
   <script type="text/javascript">
       alert('${success}');
    </script>
</c:if>
<c:remove var="success"/>
<c:if test="${!empty SoLogin}"> 
	<jsp:include page="../so/includes/soTop.jsp" flush="true"/>
</c:if>


<input type="hidden" value="${sInfo}">
<!-- 레벨이 0인 경우 메뉴를 클릭하면 다른페이지로 -->
<br>
<div class="container">
	<div class="row">
		<div class="col-sm-4" >
			<h3>상점 등록</h3><hr><br>
			<c:if test="${empty sInfo.sCode && empty sInfo.sImage}">
				<div class="card">
					<div class="card1">
    					<h3>1단계</h3>
						<span class="shopbasicinfo">상점 기본정보</span><br><br>
						<a href="SInfoEnrollForm"><input type="button" class="btn_enroll"value="등록"></a><br><br>
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
						<span>등록 완료</span>
 					</div>	
 					<div class="card2">
    					<h3>2단계</h3>
						<span class="shopimageinfo">상점 사진정보</span><br><br>
						<a href="SImageUploadFormServlet"><input type="button" class="btn_enroll"value="등록"></a><br><br>
 					</div>	
 				</div>
			</c:if>
		
			<c:if test="${!empty sInfo.sCode && !empty sInfo.sImage}">
				<div class="card">
					<div class="card1">
    					<h3>1단계</h3>
						<span class="shopbasicinfo">상점 기본정보</span><br><br>
						<span>등록 완료</span>
 					</div>	
 					<div class="card2">
    					<h3>2단계</h3>
						<span class="shopimageinfo">상점 사진정보</span><br><br>
						<span>등록 완료</span>
 					</div>
 				</div>
			</c:if>
		</div>
	
		<div class="col-sm-3" >
			<div class="shopView">
				<h3>상점 확인</h3><hr><br>
				<p>등록한 기본정보와 사진을 </p>
				<p>확인할 수 있으며,</p>
				<p>개인회원에게 보여지는 화면을</p>
				<p>확인할 수 있습니다.</p>
				<br>
				<c:if test="${!empty sInfo.sCode && !empty sInfo.sImage}">
					<a href="sView"><input type="button" class="btn_enroll"value="상점 확인"></a><br><br>
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
		<div class="col-sm-3" >
			<div class="shopModify">
				<h3>상점 수정</h3><hr><br>
				<p>등록한 기본정보와 사진을 </p>
				<p>수정할 수 있습니다.</p>
				<br>
				<c:if test="${!empty sInfo.sCode && empty sInfo.sImage}">
					<a href="SViewServlet"><input type="button" class="btn_enroll"value="기본정보 수정"></a><br><br>
					<p class="shopwarn">사진 정보를 등록해주세요.</p>
				</c:if>
				<c:if test="${empty sInfo.sCode && empty sInfo.sImage}">
					<p class="shopwarn">기본 정보를 등록해주세요.</p>
					<p class="shopwarn">사진 정보를 등록해주세요.</p>
				</c:if>
				<c:if test="${!empty sInfo.sCode && !empty sInfo.sImage}">
					<a href="SInfoUpdateServlet"><input type="button" class="btn_enroll"value="기본정보 수정"></a><br><br>
					<a href="SImageUpdateFormServlet"><input type="button" class="btn_enroll"value="사진정보 수정"></a>
				</c:if>
			</div>
		</div>
		<div class="col-sm-2" >
			<div class="shopDeleteform">
				<h3>상점 삭제</h3><hr><br>
				<p class="shopwarn">삭제하면 복원되지 않습니다.<p>
				<br>
				<c:if test="${(!empty sInfo.sCode && !empty sInfo.sImage) ||(empty sInfo.sCode && !empty sInfo.sImage) ||(!empty sInfo.sCode && empty sInfo.sImage)}">
					<a href="SDeletion"><input type="button" class="btn_enroll"value="상점 삭제"></a><br><br>
				</c:if>
				<c:if test="${empty sInfo.sCode && empty sInfo.sImage}">
					<p class="shopwarn">삭제할 정보가 없습니다.</p>
				</c:if>
			</div>
		</div>
	</div>	
</div>
<jsp:include page="../so/includes/soFooter.jsp" flush="true"/>	
</body>
