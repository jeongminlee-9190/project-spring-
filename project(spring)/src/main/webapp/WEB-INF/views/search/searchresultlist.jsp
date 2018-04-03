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
    <span id="interestUI${shop.sCode}" class="interestUI" data-sCode="${shop.sCode}">☆</span>
  	<button id="interestBTN${shop.sCode}" class="interestBTN" data-sCode="${shop.sCode}">관심</button><br>
  	${shop.scoresum }
  	<hr>
  </c:forEach>

<script type="text/javascript">
  $(document).ready(function () {
    if (${!empty login}) {
      $.each($(".interestUI"), function () {
        var UIsCode = $(this).attr("data-sCode");
        $.ajax({
          type: "post",
          url: "isInterest",
          dataType: "text",
          data: {
            mId: '${login.mId}',
            sCode: UIsCode
          },
          success: function (data, status, xhr) {
            if (data == "1") {
              $("#interestUI" + UIsCode).replaceWith("<span id='interestUI" + UIsCode + "'>★</span>");
            } else if (data == "0") {
              $("#interestUI" + UIsCode).replaceWith("<span id='interestUI" + UIsCode + "'>☆</span>");
            }
          }
        });
      });
    }

    $(".interestBTN").on("click", function () {
      if (${!empty login}) {
        var BTNsCode = $(this).attr("data-sCode");
        $.ajax({
          type: "post",
          url: "interest",
          dataType: "text",
          data: {
            mId: '${login.mId}',
            sCode: BTNsCode
          },
          success: function (data, status, xhr) {
            if (data == "1") {
              $("#interestUI" + BTNsCode).replaceWith("<span id='interestUI" + BTNsCode + "'>★</span>");
            } else if (data == "0") {
              $("#interestUI" + BTNsCode).replaceWith("<span id='interestUI" + BTNsCode + "'>☆</span>");
            }
          }
        });
      } else {
        alert("로그인을 하세요")
      }
    });
  })
</script>
