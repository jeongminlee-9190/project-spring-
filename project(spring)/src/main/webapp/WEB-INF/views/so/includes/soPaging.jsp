<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageDTO" value="${sopageDTO}"/>
<c:set var="curPage" value="${sopageDTO.curPage}"/>
<c:set var="perPage" value="${sopageDTO.perPage}"/>
<c:set var="totalCnt" value="${sopageDTO.totalCnt}"/>
<c:set var="pageNum" value="${totalCnt/perPage}"/>
<c:if test="${totalCnt%perPage !=0}">
    <c:set var="pageNum" value="${pageNum+1}" />
</c:if>
<c:forEach var="i" begin="1" end="${pageNum}" varStatus="status">
    <c:if test="${curPage == (status.index)}">
      ${status.index}&nbsp;&nbsp;
    </c:if>
    <c:if test="${curPage != (status.index)}">
    <a href="SoDormantList?curPage=${status.index}">${status.index}</a>&nbsp;&nbsp;
    </c:if>
</c:forEach>