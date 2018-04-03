<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <c:set var="shopList" value="${shopList }" scope="request"></c:set>
  <c:set var="login" value="${loginInfo}" scope="session"/>
  <c:forEach var="shop" items="${shopList }">
  	<a href="shopRetrieve?sCode=${shop.sCode }" >${shop.sName }</a>  <br>
  	address : ${shop.sAddr }<br>
  	tel : ${shop.sPhone }<br>

    <span id="${shop.sCode}" class="star">☆</span>
  	<button id="interest${shop.sCode}" class="interest" value="${shop.sCode}">관심</button><br>
  	${shop.scoresum }
  	<hr>
  	<script>
  	$(document).ready(function(){
  		if(${!empty login}){
	        $.ajax({
	         type : "post",
	         url : "isInterest",
	         dataType : "text",
	         data : {
	           mId : '${login.mId}',
	           sCode : '${shop.sCode}'
	         },
	         success : function(data,status,xhr){
	           if(data=="1"){
	             $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>★</span>");
	           }else if(data=="0"){
	             $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>☆</span>");
	           }
	         }
	       });
  		}

      $("#interest"+"${shop.sCode}").on("click",function(){
        if('${login.mId}'!=""){
          $.ajax({
            type : "post",
            url : "interest",
            dataType : "text",
            data : {
              mId : '${login.mId}',
              sCode : '${shop.sCode}'
            },
            success : function(data,status,xhr){
              if(data=="1"){
                $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>★</span>");
              }else if(data=="0"){
                $("#"+"${shop.sCode}").replaceWith("<span id='"+"${shop.sCode}"+"'>☆</span>");
              }
            }
          });
        }else{
          alert("로그인을 하세요")
        }
      });
	 });




  	</script>
  </c:forEach>
