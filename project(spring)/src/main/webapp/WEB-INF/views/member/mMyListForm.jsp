<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://localhost:8090/controller/resources/js/jquery-3.3.1.js"></script>
<!-- css -->
<!-- reset -->
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<!-- font -->
<link rel="stylesheet" type="text/css" href="resources/css/fonts.css">

<link rel="stylesheet" type="text/css" href="resources/css/member/search_header.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/search_new.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/member_myList.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/member_myListResult.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/shop_top_btn.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/footer.css">


<!-- javascript -->
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script type="module" src='resources/js/interest.js'></script>
<script type="module" src='resources/js/interest_export.js'></script>
<script type="text/javascript" src='resources/js/search_new.js'></script>
<script type="text/javascript" src="resources/js/keyword.js"></script>
<script type="text/javascript" src="resources/js/member_myList.js"></script>
<script type="module" src="resources/js/member_myListResult.js"></script>
<script type="text/javascript" src="resources/js/shop_top_btn.js"></script>
<script type="text/javascript" src="resources/js/user_info_list.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<title>나의 맛집</title>
</head>
<body>
<div id="AllContentWrap">
<div class="emphasized"></div>
<jsp:include page="../search/search_header.jsp" flush="true" />

<jsp:include page="../search/search_new.jsp" flush="true" />

<jsp:include page="includes/mMyListForm.jsp" flush="true" />
<jsp:include page="includes/mMyListResult.jsp" flush="true" />

<jsp:include page="includes/shop_top_btn.jsp" flush="true" />

<jsp:include page="../footer/footer.jsp" flush="true" />
</div>
</body>
</html>
