<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="shop_member_view_wrap">
<c:set var="sdto" value="${sInfo}"></c:set>
<c:set var="saddr" value="${sInfo.sAddr}"></c:set>
<c:set var="simage" value="${sInfo.sImage}"></c:set>
<div id="slider_wrap">
	<div class="item" >
		<ul id="slider" class="content-slider">
			<li><c:if test="${!empty fn: split(sdto.sImage,'/')[0]}"> 
				<a href="resources/upload/${fn: split(sdto.sImage,'/')[0]}">
					<img src="resources/upload/${fn: split(sdto.sImage,'/')[0]}">
				</a>
			</c:if></li>
			<li><c:if test="${!empty fn: split(sdto.sImage,'/')[1]}">
				<a href="resources/upload/${fn: split(sdto.sImage,'/')[1]}">
					<img src="resources/upload/${fn: split(sdto.sImage,'/')[1]}">
				</a>
			</c:if></li>
			<li><c:if test="${!empty fn: split(sdto.sImage,'/')[2]}">
				<img src="resources/upload/${fn: split(sdto.sImage,'/')[2]}">
			</c:if></li>
			<li><c:if test="${!empty fn: split(sdto.sImage,'/')[3]}">
				<img src="resources/upload/${fn: split(sdto.sImage,'/')[3]}">
			</c:if></li>
			<li><c:if test="${!empty fn: split(sdto.sImage,'/')[4]}">
				<img src="resources/upload/${fn: split(sdto.sImage,'/')[4]}">
			</c:if></li>
		</ul>
		
		<div class="slide_arrow" id="slide_arrow1"></div>
		<div class="slide_arrow" id="slide_arrow2"></div>
	</div>
</div>

<div id="shop_title_wrap">
	<p id="shop_title">${sdto.sName}</p>
	<p id="shop_subTitle">${sdto.sCategory}</p>
	<div>
		<img src="">
		<p>좋아요</p>
	</div>
	<div id="shop_title_line"></div>
	<span class="shop_title_Ntxt">좋아요</span><span class="shop_title_num">${sdto.sLike}</span>
	<span class="shop_title_Ntxt">후기</span><span class="shop_title_num">${sdto.sLike}</span>
</div>

</div>