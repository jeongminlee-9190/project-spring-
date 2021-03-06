<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<!-- reset -->
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<!-- font -->
<link rel="stylesheet" type="text/css" href="resources/css/fonts.css">

<link rel="stylesheet" type="text/css" href="resources/css/member/search_header.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/search_new.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/lightslider.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/lightslider.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/shopMemberView.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/shop_top_btn.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/footer.css">

<!-- jquery -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ip9MzYUcGqHV9etI8TeJ&submodules=geocoder"></script>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>  

<script type="text/javascript" src="resources/js/user_info_list.js"></script>
<script type="text/javascript" src="resources/js/member_join.js"></script>
<script type="module" src="resources/js/interest.js"></script>
<script type="text/javascript" src='resources/js/search_new.js'></script>
<script type="text/javascript" src="resources/js/keyword.js"></script>

<script type="text/javascript" src="resources/js/lightslider.js"></script>
<script type="text/javascript" src="resources/js/lightslider.min.js"></script>
<script type="text/javascript" src="resources/js/All_keywords.js"></script>
<script type="module" src="resources/js/shopMemberView.js"></script>
<script type="text/javascript" src="resources/js/shop_top_btn.js"></script>

<title>상점 관리</title>

</head>
<body>
<div id="AllContentWrap">
<div class="emphasized"></div>
<jsp:include page="../search/search_header.jsp" flush="true" />
<jsp:include page="../search/search_new.jsp" flush="true" />
<jsp:include page="includes/shopMemberView.jsp" flush="true" />
<jsp:include page="includes/shop_top_btn.jsp" flush="true" />
<jsp:include page="../footer/footer.jsp" flush="true" />
</div>

</body>