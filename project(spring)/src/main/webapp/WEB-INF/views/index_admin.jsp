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

<style type="text/css">
	.jumbotron {
		margin-top: 10%;
		height: 450px;
		background-color: black;
		text-align: center;
	}
	.logo{
		width:300px;
	}
	.adminLoginForm{
		margin-top: 10px;
		margin-left: 35%;
		max-width: 310px;
	}
	h3{
		font-weight: bold;
		color: white;
	}
	span{
		font-size: 15px;
		font-weight: bold;
		color: white;
	}
	
	th{
		padding-top: 10px;
	}
	td{
		padding-top: 10px;
	}
	input {
		width: 150px;
	}
	
	.orange-background{
		border: 1px solid black;
		background-color: orange;
		width: 280px;
	}
	.orange-border{
		border: 1px solid orange;
		background-color: black;
		width: 280px;
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
   <c:remove var="fail" scope="session" />
</c:if>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
  	<form action="adminLogin" method="post" class="adminLoginForm">
  	<table>
  		<colgroup>
  			<col width="35%">
  			<col width="65%">
  		</colgroup>
  		<tr>
  			<td colspan="2"><img src="resources/images/logo.png" class="logo"></td>
  		</tr>
  		<tr>
  			<td colspan="2"><h3>관리자 페이지</h3></td>
  		</tr>
  		<tr>
  			<td><span>아이디</span></td>
  			<td><input type="text" name="adminId"></td>
  		</tr>
  		<tr>
  			<td><span>비밀번호</span></td>
  			<td><input type="password" name="adminPasswd"></td>
  		</tr>
  		<tr>
  			<td colspan="2"><input type="submit" class="btn btn-primary orange-background" size="5" value="로그인"></td>
  		</tr>
  		<tr>
  			<td colspan="2"><input type="reset" class="btn btn-primary orange-border" size="5" value="취소"></td>
  		</tr>
  		
  	
  	</table>
	<br>
	
</form>
  </div>
</div>

</body>
</html>