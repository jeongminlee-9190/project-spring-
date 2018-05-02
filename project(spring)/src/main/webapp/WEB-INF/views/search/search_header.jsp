<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="search_header" data-target="top_btn">
	<div id="search_logo"><a href="main" >
		<img src="resources/images/logo_search.png" title="home">
	</a></div>
	<jsp:include page="search.jsp" flush="true" />
	<jsp:include page="../member/mLogin.jsp" flush="true" />
</div>