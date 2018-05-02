<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<p>${loginInfo.mName }</p><br>
<form id="reviewWriteForm" action="reviewWrite" method="post">
  <input type="text" name="reviewContent" style="width:800; height:200" required>
  <input type="submit" value="남기기" >
  <input type="hidden" name="mName" value="${loginInfo.mName}" id='loginInfo'>
  <input type="hidden" name="sCode" value="${sInfo.sCode}">

  <div class="meal">
    식사<input type="checkbox" class="meal" name="favorKeywords" value="good/식사">
    <input type="checkbox" class="meal" name="favorKeywords" value="bad/식사">
  </div>
  <div class="together">
    회식<input type="checkbox" class="together" name="favorKeywords" value="good/회식">
    <input type="checkbox" class="together" name="favorKeywords" value="bad/회식">
  </div>
  <div class="date">
    데이트<input type="checkbox" class="date" name="favorKeywords" value="good/데이트">
    <input type="checkbox" class="date" name="favorKeywords" value="bad/데이트">
  </div>
  <div class="party">
    파티<input type="checkbox" class="party" name="favorKeywords" value="good/파티">
    <input type="checkbox" class="party" name="favorKeywords" value="bad/파티">
  </div>
</form>

<c:forEach var="review" items="${reviewList }">
	${review.rvNum}, ${review.rvContent }, ${review.mName}<br>
	<c:if test="${loginInfo.mName eq review.mName }">
		<input type='button' id="deleteReview" data-rvNum='${review.rvNum }' 
		data-sCode='${review.sCode }' data-mName='${review.mName }' value='삭제'>
	</c:if>
	<hr>
</c:forEach>

<c:forEach var="score" items="${scoreList }">
	<c:if test="${score.good == 1 }">
		${score.keyword}, good ${score.good}<br>
	</c:if>
	<c:if test="${score.bad == 1 }">
		${score.keyword}, bad ${score.bad}<br>
	</c:if>
<hr>
</c:forEach>

<script>


$("#deleteReview").on("click",function(){
	var rvNum = $(this).attr("data-rvNum");
	var sCode = $(this).attr("data-sCode");
	var mName = $(this).attr("data-mName");
	var data = {
			'rvNum':rvNum,
			'sCode':sCode,
			'mName':mName
		}
	$.ajax({
		url:'deleteReview',
		method:'post',
		contentType:'application/json',
		data:JSON.stringify(data)
	});
	location.reload();
});

$("#reviewContentSubmit").on("submit",function(evt){
	if($("#loginInfo")==''){
    	alert("로그인을 하세요");
		evt.preventDefault();
	}
});
$(".meal").on("click", function(){
  if($(this).prop('checked')){
    $(".meal").prop('checked',false);
    $(this).prop('checked',true);
  }
});
$(".together").on("click", function(){
  if($(this).prop('checked')){
    $(".together").prop('checked',false);
    $(this).prop('checked',true);
  }
});
$(".date").on("click", function(){
  if($(this).prop('checked')){
    $(".date").prop('checked',false);
    $(this).prop('checked',true);
  }
});
$(".party").on("click", function(){
  if($(this).prop('checked')){
    $(".party").prop('checked',false);
    $(this).prop('checked',true);
  }
});
</script>
