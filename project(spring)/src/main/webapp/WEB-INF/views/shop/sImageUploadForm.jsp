<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/so/so_footer.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/shop/s_imageUploadForm.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/fonts.css" rel="stylesheet" >
<script type="text/javascript" src="resources/js/s_imageUploadForm.js"></script>
<title>이미지 업로드</title>
</head>
<body>
<c:if test="${!empty mesg}">
	<script type="text/javascript">
		alert('${mesg}');
	</script>
</c:if>
<c:remove var="mesg"/>
<c:if test="${!empty SoLogin}"> 
	<jsp:include page="../so/includes/soTop.jsp" flush="true"/>
	<jsp:include page="includes/sImageUploadForm.jsp" flush="true"/>
	<jsp:include page="../so/includes/soFooter.jsp" flush="true"/>
</c:if> 
</body>
</html>