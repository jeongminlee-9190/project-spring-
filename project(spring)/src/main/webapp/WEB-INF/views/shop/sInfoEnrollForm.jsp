<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<link href="resources/css/fonts.css" rel="stylesheet" >
<link href="resources/css/shop/s_infoEnrollForm.css" rel="stylesheet" >
<link href="resources/css/so_footer.css" rel="stylesheet" >
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="resources/js/s_infoEnrollForm.js"></script>

</head>
<body>
<jsp:include page="../so/includes/soTop.jsp" flush="true"/>
<jsp:include page="includes/sInfoEnrollForm.jsp" flush="true"/>
<jsp:include page="../so/includes/soFooter.jsp" flush="true"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/addr.js"></script>
</body>


