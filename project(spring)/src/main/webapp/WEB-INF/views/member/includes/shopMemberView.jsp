<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="shop_member_view_wrap">

<div class="shop_Img_wrap">
	<ul id="autoplay" >
		<li><c:if test="${!empty fn: split(sdto.sImage,'/')[0]}"> 
			<a href="resources/upload/${fn: split(sdto.sImage,'/')[0]}">
				<%-- <img src="resources/upload/${fn: split(sdto.sImage,'/')[0]}"> --%>
				<img src="resources/images/check.gif">
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
</div>