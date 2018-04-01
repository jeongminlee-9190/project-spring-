<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >

<style type="text/css">
	.main{
		background-color: black;
	}
	.container-fluid{
		position: relative;
		background-color: black;
	}
	.bg-black{
		background-color: black;
		border: 1px solid black;
	}
	.carousel-inner img {
	      width: 100%;
	      height: 100%;
	  }
	
	.logo{
		position: absolute;
		width:10%;
		margin-top: 3%;
		margin-left: 42%;
		
	}
	#myCarousel{
		margin-top: 50px;
	}
	.badge{
		color: orange;
	}
	.btn-group-justified{
		height: 50px;
	}
	.row{
		margin-top: 7px;
		text-align: center;
	}
	.lanking{
		background-color: white;
	}
</style>
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

<div class="main">
	<c:if test="${!empty SoLogin}"> 
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
					    <span class="icon-bar"></span>
					    <span class="icon-bar"></span> 
					</button>
				        <a class="navbar-brand" href="main_shopowner">갬성갱단 상점 센터</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
					    <li class="active"><a href="#" >서비스 소개</a></li>
					    <li class="active"><a href="sManagement" >상점 관리</a></li>
					    <li class="active"><a href="payMentUI">서비스 결제</a></li>
						<li class="active"><a href="#">예약관리</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
					    <li><a href="#">계정: ${SoLogin.soId}</a></li>
					    <li class="active"><a href="sologout">로그아웃</a></li>
					    <li class="dropdown active">
					        <a class="dropdown-toggle" data-toggle="dropdown" href="#" class="active">마이페이지<span class="caret"></span></a>
					 		<ul class="dropdown-menu">
						        <li><a href="soMyPage">기본정보</a></li>
						        <li><a href="#">서비스 결제 내역</a></li>
						    </ul>
						</li>
						<li class="dropdown active">
					        <a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터<span class="caret"></span></a>
					 		<ul class="dropdown-menu">
						        <li><a href="#">공지사항</a></li>
						        <li><a href="#">자주 묻는 질문</a></li>
						        <li><a href="#">1:1 문의</a></li>
						    </ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="container-fluid"> 
		  	<div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner">
			      <div class="item active">
			      	
			        <div class="logo">
			        	<img src="resources/images/logo.png" alt="main_bg01.jpg" style="width:170%;">
			        </div>
			        <img src="resources/images/main_bg01.jpg" alt="main_bg01.jpg" style="width:170%;">
			      </div>
			
			      <div class="item">
			        <img src="resources/images/main_bg02.jpg" alt="main_bg02.jpg" style="width:170%;">
			      </div>
			    
			      <div class="item">
			        <img src="resources/images/main_bg03.jpg" alt="main_bg03.jpg" style="width:170%;">
			      </div>
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
			    
			     <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>
			  </div>
		</div>
		<div class="container-fluid"> 
	  		<div class="btn-group btn-group-justified">
	  			<div class="row">
	  			 	<div class="col-sm-2">
	  			 		<a href="#" class="btn btn-primary bg-black">관심상점 <span class="badge">0</span></a>
	  			 	</div>
	  			 	<div class="col-sm-2">
	  			 		<a href="#" class="btn btn-primary bg-black">카테고리 점수 <span class="badge">0</span></a>
	  			 	</div>
	  			 	<div class="col-sm-2">
	  			 		<a href="#" class="btn btn-primary bg-black">예약 승인 대기 <span class="badge">0</span></a>
	  			 	</div>
	  			 	<div class="col-sm-2">
	  			 		 <a href="#" class="btn btn-primary bg-black">후기 <span class="badge">0</span></a>
	  			 	</div>
	  			 	<div class="col-sm-2">
	  			 		<a href="#" class="btn btn-primary bg-black disabled"></a>
	  			 	</div>
	  			 	<div class="col-sm-2">
	  			 		<a href="#" class="btn btn-primary bg-black">1:1문의 답변 <span class="badge">0</span></a>
	  			 	</div>
			    </div>
	  		</div>
		</div>
		<div class="container-fluid lanking"> 
			<div class="row">
	  			 <div class="col-sm-3">
	  			 	<h4>관심상점 랭킹</h4>
	  			 </div>
	  			 <div class="col-sm-3">
	  			 	<h4>카테고리 랭킹</h4>
	  			 </div>
	  			 <div class="col-sm-3">
	  			 	<h4>예약 랭킹</h4>
	  			 </div>
	  			 <div class="col-sm-3">
	  			 	<h4>후기 랭킹</h4>
	  			 </div>
			</div>
		</div>
		<div class="container-fluid"> 
			<div class="footer">
				footer
			</div>
		</div>	
	</c:if>
</div>
</body>
</html>