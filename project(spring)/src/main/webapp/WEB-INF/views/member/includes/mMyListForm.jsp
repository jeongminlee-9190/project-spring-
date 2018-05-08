<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="myList_title" data-mId='${loginInfo.mId }' data-mName='${loginInfo.mName }'>
	<p>MY LIST</p>
</div>

<div id="myList_content_wrapper">

	<div id="myList_content_wrap" class="clearfix">
	
		<button id="myList_like" class="myList_wrap">
			<div class="myList_title clearfix">
				<p>내가 좋아요한 맛집</p>
				<img src="resources/images/member_like_icon.png" title="내가 좋아요한 맛집">
			</div>
			<div class="myList_num clearfix">
				<p></p>
				<p>개</p>
			</div>
		</button>
		
		<button id="myList_review" class="myList_wrap">
			<div class="myList_title clearfix">
				<p>내가 평가한 맛집</p>
				<img src="resources/images/member_review_icon.png" title="내가 평가한 맛집">
			</div>
			<div class="myList_num clearfix">
				<p></p>
				<p>개</p>
			</div>
		</button>
	
	</div>

</div>



