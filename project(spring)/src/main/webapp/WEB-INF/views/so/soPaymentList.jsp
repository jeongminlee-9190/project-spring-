<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 결제 내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.3.1.js"></script>
<script src="resources/js/so_notice.js"></script>
<link href="resources/css/so/so_notice.css" rel="stylesheet" >
<link href="resources/css/fonts.css" rel="stylesheet" >
<link href="resources/css/so_footer.css" rel="stylesheet" >
</head>
<body>
<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>
<c:remove var="success"/>
<jsp:include page="includes/soTop.jsp" flush="true"/>
<jsp:include page="includes/soPaymentList.jsp" flush="true"/>
<jsp:include page="includes/soFooter.jsp" flush="true"/>	
</body>
  