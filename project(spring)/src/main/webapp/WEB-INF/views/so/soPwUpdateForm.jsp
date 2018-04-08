<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/so/so_pwmodify.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
<script type="text/javascript">
$(document).ready(function(){
		$(".old_soPasswd").keyup(function(){
		var soPasswd = $(".old_soPasswd").val();
		console.log(soPasswd);
		console.log(soPasswd.length());
		/* $.ajax({
			url: "soIdCheck",
			type: "GET",
			data:{
				soId:soId
			},
			dataType:"text",
			success:function(responseData){
				if(responseData==0){
					$("#result1").text("아이디 사용 가능");
				}
				else if(responseData==1){
					$("#result1").text("아이디 중복");
				}
			},
			error:function(error){
				console.log("error"+error);
			}
		}); */
	});
});
</script>
<style>
 .row{
 	/* text-align: center; */
 }
 
</style>
<jsp:include page="includes/soTop.jsp" flush="true"/>
<c:set var="dto" value="${SoMyPage}"></c:set>
<div class="container-fluid">
  <div class="row">
  	<div class="col-sm-3"></div>
    <div class="col-sm-6">
    	<h3>마이페이지-비밀번호 변경</h3>
    	<br>
		<form class="form-horizontal" action="soPwUpdate" method="POST">
			<div class="form-group">
			    <label class="col-sm-5 control-label">현재 비밀번호</label>
			    <div class="col-sm-4">
			        <input class="form-control" id="focusedInput old_soPasswd" class="old_soPasswd" maxlength="10" type="text">
			    </div>
    		</div>
    		<div class="form-group">
			    <label class="col-sm-5 control-label">새로운 비밀번호</label>
			    <div class="col-sm-4">
			        <input class="form-control" id="focusedInput" name="soPasswd" maxlength="10" type="text">
			    </div>
    		</div>
    		<div class="form-group">
			    <label class="col-sm-5 control-label">새로운 비밀번호 재입력</label>
			    <div class="col-sm-4">
			        <input class="form-control" id="focusedInput" name="soPasswd2" maxlength="10" type="text">
			    </div>
    		</div>
    		<div class="form-group">
			   <input type="submit" class="btn btn-primary orange-background" value="변경하기">
    		</div>
    	</form>
    </div>
    <div class="col-sm-3"></div>
  </div>
</div>
<jsp:include page="includes/soFooter.jsp" flush="true"/>