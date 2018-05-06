<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- css -->
<!-- reset -->
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<!-- font -->
<link rel="stylesheet" type="text/css" href="resources/css/fonts.css">

<link rel="stylesheet" href="resources/css/member/main.css">
<link rel="stylesheet" href="resources/css/member/login.css">
<link rel="stylesheet" href="resources/css/member/search.css">
<link rel="stylesheet" href="resources/css/member/footer.css">

<!-- jquery -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript" src="resources/js/user_info_list.js"></script>
<script type="text/javascript" src="resources/js/subway.js"></script>
<script type="text/javascript" src="resources/js/All_keywords.js"></script>
<script type="text/javascript" src="resources/js/keyword.js"></script>
<script type="text/javascript" src="resources/js/main_bg_slider.js"></script>

<title>갬성갱단</title>

</head>
<body>
<div id="AllContentWrap">

	<!-- 로그아웃 처리-->
	<c:if test="${!empty memberlogout}">
		<script type="text/javascript">
	    	alert('${memberlogout}');
	    </script>
	</c:if>
	<div class="emphasized"></div>
	<div id="header">
		<div class="slide_wrap">
			<ul id="main_bg_slider" class="slide">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<jsp:include page="member/mLogin.jsp" flush="true"/>
		<%-- <jsp:include page="member/mNoticeUI.jsp" flush="true"/> --%>
		<div id="logo">
			<img src="resources/images/logo.png" title="logo">
		</div>
		<jsp:include page="search/search.jsp" flush="true"/>
	</div>
	
	<div id="content_wrapper">
		<jsp:include page="search/subway.jsp" flush="true" />
		<jsp:include page="search/keyword.jsp" flush="true" />
	</div>
	
	<jsp:include page="footer/footer.jsp" flush="true" />

</div>
</body>
</html>
