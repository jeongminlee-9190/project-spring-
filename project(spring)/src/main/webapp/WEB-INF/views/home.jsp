<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>페이지 선택</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
</head>
<body>
<div class="container-fluid">
		시연/구현용 페이지
		<div class="row">
			<div class="col-sm-4">
				<div class="pagebox">
					<h3>개인 사용자</h3>
					<hr><br>
					<p>개인 사용자 접속페이지</p>
					<span>회원/비회원 가능</span><br>
					<a href="main"><button type="button" class="btn btn-outline-primary">접속하기</button></a>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="pagebox">
					<h3>상점 회원</h3>
					<hr><br>
					<p>상점 회원 접속페이지</p>
					<span>회원만 이용 가능</span><br>
					<a href="index_shopowner"><button type="button" class="btn btn-outline-primary">접속하기</button></a>
				</div>
			</div>
			<div class="col-sm-4">
			    <div class="pagebox">
					<h3>관리자(완료)</h3>
					<hr><br>
					<p>관리자 접속페이지</p>
					<a href="index_admin"><button type="button" class="btn btn-outline-primary">접속하기</button></a>
				</div>
			</div>
		</div>
</div>

</body>
</html>