<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.bold{
		font-weight: bold;
		color: orange;
	}
	.soLevelText,.soExpireDateText,.SoFreetrialDate{
		color: white;
	}
	.white{
		background-color: black;
	}
</style>
<div class="container-fluid white"> 
	<div class="row">
		<div class="col-sm-3"></div>
	  	<div class="col-sm-3">
	  		
	  		<span class="bold">회원 레벨 </span>
	  		&emsp;<span class="soLevelText">
	  			<c:if test="${SoLevel=='0'}"> 
	  			미승인
	  			</c:if>
	  			<c:if test="${SoLevel=='1'}"> 
	  			&emsp;체험 회원
	  			</c:if>
	  			<c:if test="${SoLevel=='2'}"> 
	  			&emsp;유료 회원
	  			</c:if>
	  			<c:if test="${SoLevel=='3'}"> 
	  			&emsp;체험 만료 회원
	  			</c:if>
	  			<c:if test="${SoLevel=='4'}"> 
	  			&emsp;유료 만료 회원
	  			</c:if>
	  		</span>
	  	</div>
	  	<div class="col-sm-3">
	  		<c:if test="${SoLevel=='0'}"> 
		  		<span class="bold">서비스 이용 </span> &emsp;
		  		<span class="SoFreetrialDate">${SoFreetrialDate}</span>
		  	</c:if>
	  		<c:if test="${SoLevel=='1'}"> 
		  		<span class="bold">체험 종료 날짜 </span> &emsp;
				<span class="SoFreetrialDate">${SoFreetrialDate}</span>
		  	</c:if>
		  	<c:if test="${SoLevel=='2'}"> 
		  		<span class="bold">서비스 만료 날짜</span> &emsp;
					<span class="soExpireDateText">${SoExpireDate}</span>
		  	</c:if>
	  	</div>	
	  	<div class="col-sm-3"></div> 	
	</div>
</div>