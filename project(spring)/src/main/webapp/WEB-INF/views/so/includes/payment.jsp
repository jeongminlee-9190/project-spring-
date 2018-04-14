<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form action="payMent" method="post" class="payMentForm">
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h3>서비스 결제</h3>
				<p>갬성갱단 가입 시 체험 회원으로  상점관리 서비스를 이용하실 수 있습니다.</p>
				<p>단, 체험 기간(90일) 만료 후 갬성갱단의 상점관리 서비스를 이용하시려면 </p>
				<p>아래와 같은  서비스를 결제하셔야 합니다.</p>
				<br><br>
				<div class="col-sm-3" >
					<br>
			  		<div class="card">
				    	<div class="card-body">
				      		<h4 class="card-title">30일</h4><hr>
				     		<p class="card-text">
				     		<div class="radio">
			  					<label><input type="radio" name="period" value="30" checked="checked">16000원 </label>
							</div>
				     		</p>
				    	</div>
				    </div>
				</div>
				<div class="col-sm-3" >
					<br>
			  		<div class="card">
				    	<div class="card-body">
				      		<h4 class="card-title">60일</h4><hr>
				     		<p class="card-text">
				     		<div class="radio">
			  					<label><input type="radio" name="period" value="30">28000원 </label>
							</div>
				     		</p>
				    	</div>
				    </div>
				</div>
				<div class="col-sm-3" >
					<br>
			  		<div class="card">
				    	<div class="card-body">
				      		<h4 class="card-title">90일</h4><hr>
				     		<p class="card-text">
				     		<div class="radio">
			  					<label><input type="radio" name="period" value="30">40000원 </label>
							</div>
				     		</p>
				    	</div>
				    </div>
				</div>
				<div class="col-sm-3" >
					<br>
			  		<div class="card">
				    	<div class="card-body">
				      		<h4 class="card-title">120일</h4><hr>
				     		<p class="card-text">
					     		<div class="radio">
				  					<label><input type="radio" name="period" value="30">52000원 </label>
								</div>
				     		</p>
				    	</div>
				    </div>
				</div>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="alert alert-warning">
		    		<strong>주의!</strong> <p>1. 결제 후 환불은 약정 기간 50% 이상 경과 시 불가합니다.</p>
		    		<p>2. 환불은 이용하신 기간을 일할 계산하여 결제금액에서 차감 후 처리됩니다.</p>
		    		<p>3. 환불 시 카드결제 취소는 환불 신청일로부터 영업일 기준 3~7일 내에 카드사를 통해 확인 가능합니다.
  				</div>
  			</div>
  			<div class="col-sm-3"></div>
  		</div>
  		<div class="paymentTry">
  			<c:if test="${empty SoExpireDate}">
  				<input type="submit" class="btn btn-primary orange-background" value="위의 내용에 동의하고 결제"> 
  				<a href="main_shopowner"><input type="button" class="btn btn-primary orange-border" value="취소"></a>
  			</c:if>
  			<c:if test="${!empty SoExpireDate}">
  				<span class="red">서비스 만료 날짜인 ${SoExpireDate} 이후에 결제해주세요!</span>
  			</c:if>
  			
  		</div>
	<!-- 
		<input type="radio" name="selectPay" > <br>
		<input type="radio" name="selectPay" value="60"> 60일 상품 [ 28000원 ]<br>
	    <input type="radio" name="selectPay" value="90"> 90일 상품 [ 40000원 ]<br>
	    <input type="radio" name="selectPay" value="120"> 120일 상품 [ 52000원 ]<br>
		<input type="submit" value="결제하기"> -->
	
	</div>
	<div class="col-sm-3" ></div>
</form>

