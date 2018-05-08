<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="searchList_wrapper">
	
	<div id="myListResult_title_wrap" class="clearfix">
		<p id="myListResult_title"></p>
		<img src="resources/images/member_miniITitle_icon.png" title="">
	</div>
	
	<div id="test"></div>
	
	<c:forEach var="shop" items="${shopList}">
	<div class="searchList_wrap clearfix" >
	
		<div class="shop_main_img">
			<img src="resources/upload/${fn:split(shop.sImage,'/')[4]}" title="${shop.sName}">
		</div>
		
		<div class="shop_small_info clearfix">
			<div class="shop_leftInfo">
				<a href="shopRetrieve?sCode=${shop.sCode}&mName=${loginInfo.mName}" class="shop_title" >${shop.sName}</a>
				<div class="shop_score clearfix">
					<span><img src="resources/images/icon_search.png" title="검색횟수"></span>
					<span>${shop.scoresum}</span>
				</div>
			</div>
			
			<div class="shop_rightInfo">
				<div class="shop_addr clearfix">
					<span><img src="resources/images/icon_loc.png" title="주소"></span>
					<span>${shop.sAddr}</span>
				</div>
				<div class="shop_phone clearfix">
					<span><img src="resources/images/icon_phone.png" title="전화번호"></span>
					<span>${shop.sPhone}</span>
				</div>
				<div class="shop_like clearfix">
					<span id="interestUI${shop.sCode}" class="interestUI" data-sCode="${shop.sCode}">
					<img src="resources/images/icon_Ht.png" title="종아요">
					</span>
					
					<button id="interestBTN${shop.sCode}" class="interestBTN" data-sCode="${shop.sCode}">
						좋아요
					</button>
				</div>
			</div>
		</div>
		
	</div>
	</c:forEach>
</div>
<span id='loginInfo' data-login_mId='${loginInfo.mId }'></span>