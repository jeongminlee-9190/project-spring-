<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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

<form action="adminLogin" method="post">
아이디<input type="text" name="adminId"><br>
비밀번호<input type="password" name="adminPasswd"><br>
<input type="submit" value="로그인">
<input type="reset" value="취소">
</form>
</body>
</html>