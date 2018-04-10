<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="searchList_wrapper">
	<c:forEach var="shop" items="${shopList}">
	<div class="searchList_wrap clearfix" >
	
		<div class="shop_main_img">
			<img src="resources/images/shop_img.jpg" title="자판기">
		</div>
		
		<div class="shop_small_info clearfix">
			<div class="shop_leftInfo">
				<a href="shopRetrieve?sCode=${shop.sCode}" class="shop_title" >${shop.sName}</a>
				<div class="shop_score">
					<span><img src="resources/images/icon_search.png" title="검색횟수"></span>
					${shop.scoresum }
				</div>
			</div>
			
			<div class="shop_rightInfo">
				<div class="shop_addr">
					<span><img src="resources/images/icon_loc.png" title="주소"></span>
					address : ${shop.sAddr}
				</div>
				<div class="shop_phone">
					<span><img src="resources/images/icon_phone.png" title="전화번호"></span>
					${shop.sPhone}
				</div>
				<div class="shop_like">
					<span id="interestUI${shop.sCode}" class="interestUI" data-sCode="${shop.sCode}"></span>
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