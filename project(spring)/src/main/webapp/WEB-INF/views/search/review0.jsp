<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

한줄평
<button id="reviewWrite">평가하기</button>
<hr>
${login.mName }<br>
<form id="reviewContentSubmit" action="ReviewWriteServlet" method="post">
  <input type="text" name="reviewContent" style="width:800; height:200">
  <input type="submit" name="" value="남기기" >
  <input type="hidden" name="mName" value="${login.mName}">
  <input type="hidden" name="sCode" value="${shop.sCode}">
  <input type="hidden" name="url" value="" id="url">

  <div class="meal">
    식사<input type="checkbox" class="meal" name="favorKeywords" value="meal,1">
    <input type="checkbox" class="meal" name="favorKeywords" value="meal,0">
  </div>
  <div class="together">
    회식<input type="checkbox" class="together" name="favorKeywords" value="together,1">
    <input type="checkbox" class="together" name="favorKeywords" value="together,0">
  </div>
  <div class="date">
    식사<input type="checkbox" class="date" name="favorKeywords" value="date,1">
    <input type="checkbox" class="date" name="favorKeywords" value="date,0">
  </div>
  <div class="party">
    파티<input type="checkbox" class="party" name="favorKeywords" value="party,1">
    <input type="checkbox" class="party" name="favorKeywords" value="party,0">
  </div>

</form>


1.loginUI + memberName<br>
2.review details<br>
3.keyword and score<br>

<c:set var="reviewList" value="${reviewList }" scope="request"/>
<c:forEach var="review" items="${reviewList }">
${review.rvContent }, ${review.mName}<br>
<hr>
</c:forEach>

<script>
$("#reviewContentSubmit").on("submit",function(evt){
	if(${empty login}){
    alert("로그인을 하세요");
		evt.preventDefault();
	}
});
$(document).ready(function(){
  $("#url").val($(location).attr("search"));
});

$(".meal").on("click", function(){
  if($(this).prop('checked')){
    $(".meal").prop('checked',false);
    $(this).prop('checked',true);
  }
})
$(".together").on("click", function(){
  if($(this).prop('checked')){
    $(".together").prop('checked',false);
    $(this).prop('checked',true);
  }
})
$(".date").on("click", function(){
  if($(this).prop('checked')){
    $(".date").prop('checked',false);
    $(this).prop('checked',true);
  }
})
$(".party").on("click", function(){
  if($(this).prop('checked')){
    $(".party").prop('checked',false);
    $(this).prop('checked',true);
  }
})




</script>
