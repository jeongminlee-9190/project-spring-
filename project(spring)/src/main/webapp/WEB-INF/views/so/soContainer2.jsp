<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	.container-fluid{
		background-color: black;
	}
	.bg-black{
		background-color: black;
		border: 1px solid black;
	}
</style>

<c:if test="${!empty SoLogin}"> 
	<div class="container-fluid"> 
  		<div class="btn-group btn-group-justified">
		    <a href="#" class="btn btn-primary bg-black">관심상점 </a>
		    <a href="#" class="btn btn-primary bg-black">카테고리 점수</a>
		    <a href="#" class="btn btn-primary bg-black">예약 승인 대기</a>
		    <a href="#" class="btn btn-primary bg-black">등록된 후기</a>
		    <a href="#" class="btn btn-primary bg-black">1:1문의 답변</a>
		    <a href="#" class="btn btn-primary bg-black">예약 승인 대기</a>
		    <a href="#" class="btn btn-primary bg-black">예약 승인 대기</a>
  		</div>
	</div>
</c:if>


