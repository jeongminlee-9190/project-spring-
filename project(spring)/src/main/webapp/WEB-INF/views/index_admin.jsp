<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
<title></title>
<link href="${pageContext.request.contextPath}/resources/css/admin/index_admin.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<style type="text/css">
	.col-sm-4{
		margin-left: 2%;
	}
</style>
</head>
<body>
<c:if test="${! empty success}">
   <script type="text/javascript">
    alert('${success}');
   </script>
</c:if>

<c:if test="${!empty adminLogout}">
	<script type="text/javascript">
    	alert('${adminLogout}');
    </script>
    <c:remove var="adminLogout"/>
</c:if>

<c:if test="${!empty mesg}">
	<script type="text/javascript">
    	alert('${mesg}');
    </script>
</c:if>

<c:if test="${! empty fail}">
   <script type="text/javascript">
    alert('${fail}');
   </script>
   <c:remove var="fail" />
</c:if>

<div class="container-fluid">
  	<div class="row">
  		<div class="col-sm-4"></div>
  		<div class="col-sm-4">
  			<form action="adminLogin" method="post" class="adminLoginForm">
			  	<img src="resources/images/logo.png" class="logo"></td>
			  	<h3>관리자 센터</h3>
			  	<input type="text" name="adminId" class="input_adminId" placeholder="아이디" maxlength="30"><br>
				<input type="password" name="adminPasswd" class="input_adminPasswd" placeholder="비밀번호" maxlength="10"><br>
			  	<input type="submit" class="btn btn-primary orange-background" value="로그인">
			 	<input type="reset" class="btn btn-primary orange-border" value="취소">
		 	</form> 
		</div>
		<div class="col-sm-4"></div>
	 </div>
 </div>


</body>
</html>