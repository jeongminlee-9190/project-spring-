<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/so_mainwrapper.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_maincontent.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
</head>
<body>
<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>
<c:remove var="success"/>
<c:if test="${!empty SoLogout}">
	<script type="text/javascript">
    	alert('${SoLogout}');
    </script>
</c:if>

<c:if test="${!empty SoLogin}"> 
	<nav class="navbar navbar-inverse">
	   <div class="container-fluid">
	     <div class="navbar-header">
	        <a class="navbar-brand" href="main_admin">갬성갱단</a>
	     </div>
	     
	     <ul class="nav navbar-nav">
	     	<li><a href="#" class="active">서비스 소개</a></li>
	     	<li><a href="#" class="active">상점 관리</a></li>
	     	<li><a href="payMentUI" class="active">서비스 결제</a></li>
	        <li class="dropdown">
	        	<a class="dropdown-toggle" data-toggle="dropdown" href="#" class="active">고객센터<span class="caret"></span></a>
	 			<ul class="dropdown-menu">
		           <li><a href="#">공지사항</a></li>
		           <li><a href="#">자주 묻는 질문</a></li>
		           <li><a href="#">1:1 문의</a></li>
		        </ul>
		    </li>
		    <li><a href="#">예약관리</a></li>
		    <li><a href="#"></a></li>
	     </ul>
	     
	     <ul class="nav navbar-nav navbar-right">
	       <li><a href="#">계정: ${SoLogin.soId}</a></li>
	       <li><a href="sologout">로그아웃</a></li>
	       <li><a href="sologout">마이페이지</a></li>
	     </ul>
	  </div>
	</nav>
</c:if>


<jsp:include page="so/soContainer.jsp" flush="true"/>

	<div class="footer">
		footer
	</div>	
</body>
</html>