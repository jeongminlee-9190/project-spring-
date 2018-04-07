<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="container-fluid top"> 
		<div class="row">
			<div class="col-sm-12">
				<jsp:useBean id="now" class="java.util.Date" />
				<h4 class="orange"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>  Daily Report</h4>
			</div>
		</div>
</div>
<div class="container-fluid middle"> 
	<div class="btn-group btn-group-sm">
	  	<div class="row">
	  		<div class="col-sm-2">
	  			<a href="soList2" class="btn btn-primary bg-black">승인 대기 <span class="badge">${soList2TotalCount}</span></a>
	  		</div>
	  		<div class="col-sm-2">
	  			<a href="mList" class="btn btn-primary bg-black">개인 회원(누적)<span class="badge">${mListTotalCount}</span></a>
	  		</div>
	  		<div class="col-sm-2">
	  			<a href="soList" class="btn btn-primary bg-black">상점 회원(누적)<span class="badge">${soListTotalCount}</span></a>
	  		</div>
	  		<div class="col-sm-2">
	  			<a href="sList" class="btn btn-primary bg-black">상점(누적) <span class="badge">${sListTotalCount}</span></a>
	  		</div>
	  		<div class="col-sm-2">
	  			<a href="#" class="btn btn-primary bg-black">휴면계정 <span class="badge">${mDormantListTotalCount+soDormantListTotalCount}</span></a>
	  		</div>
	  		<div class="col-sm-2">
	  			<a href="#" class="btn btn-primary bg-black">1:1 문의 <span class="badge">0</span></a>
	  		</div>
		</div>
	</div>
</div>