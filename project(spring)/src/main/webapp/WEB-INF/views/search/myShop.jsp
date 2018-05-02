<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Shop</title>
</head>
<body>
	<span id='loginInfo' data-loginInfo=${loginInfo.mId }></span>
	<div id='button_wrap'>
		<button id='myFavorite'>좋아요 한 맛집</button>
		<button id='myReview'>리뷰 남긴 맛집</button>
	</div>
	<div id='retrieve'></div>
	
	
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script>
	let loginInfo = $('#loginInfo').attr('data-loginInfo');
	if(loginInfo == null){
		alert('로그인을 하세요');
	}else{
		$('#myFavorite').on('click',function(){
			$.ajax({
				url:'myFavorite',
				method:'get',
				data:$('#loginInfo').attr('data-loginInfo'),
				
				dataType: '',
				success:function(data, status, xhr){
					$('#retrieve').empty();
					console.log(data);
					console.log(status);
					console.log(xhr);
				}
			});
		});
		
	}
</script>
</body>
</html>