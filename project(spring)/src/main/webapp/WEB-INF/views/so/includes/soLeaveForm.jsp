<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.row{
		margin-top: 70px;
	}
	
	.btn-submit{
		border: 1px solid orange;
		background-color: orange;
		color: white;
	}
	
	.btn-primary.orange-border-leave{
		border: 1px solid orange;
		background-color: orange;
		width: 180px;
		margin-top: 10px;
	}
	
	.btn-primary.orange-border-main{
		border: 1px solid orange;
		background-color: white;
		color: orange;
		width: 180px;
		margin-top: 10px;
	}
</style>

<c:set var="dto" value="${soleaveDTO}"></c:set>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4" ></div>
    <div class="col-sm-4">
    	<form action="soLeave" method="GET">
	    	<h3>마이페이지-회원 탈퇴</h3><br>
			<table class="table table-hover">
				<colgroup>
						<col width="40%">
						<col width="60%">
				</colgroup>
				<tr>
					<th>상점</th>
					<td>${dto.soShopCnt} 건</td>
				</tr>
				<tr>
					<th>리뷰</th>
					<td>${dto.soReviewCnt} 건</td>
				</tr>
				<tr>
					<th>관심상점</th>
					<td>${dto.soInterestCnt} 건</td>
				</tr>
				<tr>
					<th>카테고리 점수</th>
					<td>${dto.soScore} 점</td>
				</tr>
				<tr>
					<th>정산 예정 포인트</th>
					<td>${dto.soCouponCnt}</td>
				</tr>
				<tr>
					<th>서비스 결제-잔여 기간</th>
					<td>${dto.soExpireDate}</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="alert alert-warning">
    						<strong>주의!</strong>&emsp;회원 탈퇴 시 위의 정보가 모두 삭제되며, 재가입 시 복구되지 않습니다.
  						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<a href="soLeave"><button type="button" class="btn btn-primary orange-border-leave">회원탈퇴</button></a>
					<a href="main_shopowner"><button type="button" class="btn btn-primary orange-border-main">취소</button></a></td>
				</tr>
			</table> 
		</form>   
    </div>
    <div class="col-sm-4"></div>
  </div>
</div>
