<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="dto" value="${SoMyPage}"></c:set>
<div class="container-fluid">
  <div class="row">
  	<div class="col-sm-3"></div>
    <div class="col-sm-6">
    	<h3>마이페이지-비밀번호 변경</h3>
    	<br><br><br>
		<form class="form-horizontal" action="soPwUpdate" id="soPwUpdate" method="POST">
			<div class="form-group">
			    <label class="col-sm-5 control-label">현재 비밀번호</label>
			    <div class="col-sm-4">
			        <input class="form-control" type="password" id="old_soPasswd" class="old_soPasswd" maxlength="10" type="text">
			       	<span id="result1"></span>
			    </div>
    		</div>
    		<div class="form-group">
			    <label class="col-sm-5 control-label">새로운 비밀번호</label>
			    <div class="col-sm-4">
			        <input class="form-control" type="password" id="soPasswd" name="soPasswd" maxlength="10" type="text">
			        <span id="result2"></span>
			    </div>
    		</div>
    		<div class="form-group">
			    <label class="col-sm-5 control-label">새로운 비밀번호 재입력</label>
			    <div class="col-sm-4">
			        <input class="form-control" type="password" id="soPasswd2" name="soPasswd2" maxlength="10" type="text">
			        <span id="result3"></span>
			    </div>
    		</div>
    		<div class="form-group botton">
			   <input type="submit" class="btn btn-primary orange-background" value="변경하기">
    		</div>
    	</form>
    </div>
    <div class="col-sm-3"></div>
  </div>
</div>
