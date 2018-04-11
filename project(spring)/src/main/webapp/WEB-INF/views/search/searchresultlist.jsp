<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="shop" items="${shopList }">
	<a href="shopRetrieve?sCode=${shop.sCode }" >${shop.sName }</a>  <br>
	address : ${shop.sAddr }<br>
	tel : ${shop.sPhone }<br>
	<span id="interestUI${shop.sCode}" class="interestUI" data-sCode="${shop.sCode}">☆</span>
	<button id="interestBTN${shop.sCode}" class="interestBTN" data-sCode="${shop.sCode}">관심</button><br>
	${shop.scoresum }
	<hr>
</c:forEach>
<span id='loginInfo' data-login_mId='${loginInfo.mId }'></span>
<script type="text/javascript" src='resources/js/search_result.js'></script>
