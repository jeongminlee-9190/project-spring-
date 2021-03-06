<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#soPayMentForm").submit(function(e){
 			var re_cardNum=/^[0-9]{15,16}$/;
 			var re_validThru=/^[0-9]{4,4}$/;
 			var re_secCode=/^[0-9]{4,4}$/;

			if(re_cardNum.test($("#cardNum").val()) != true){
 				alert("카드번호는 숫자만 입력 가능하며, 15~16자리 입니다.");
 				$("#cardNum").focus();
 				e.preventDefault();
 			}else if(re_validThru.test($("#validThru").val()) != true){
 				alert("유효기간은 숫자만 입력 가능하며, 4자리 입니다.");
 				$("#validThru").focus();
 				e.preventDefault();
 			}else if(re_secCode.test($("#secCode").val()) != true){
 				alert("보안 코드는 카드 앞면의 4자리이며, 숫자만 입력 가능합니다.");
 				$("#secCode").focus();
 				e.preventDefault();
 			}
 		});
	});
</script>

<form action="soPayMent" id="soPayMentForm" class="form-inline" method="post">
	<div class="container">
		<div class="row row1">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h3>서비스 결제</h3>
				<p>갬성갱단 가입 시 체험 회원으로  상점관리 서비스를 이용하실 수 있습니다.</p>
				<p>단, 체험 기간(90일) 만료 후 갬성갱단의 상점관리 서비스를 이용하시려면 </p>
				<p>아래와 같은  서비스를 결제하셔야 합니다.</p>
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
			  					<label><input type="radio" name="period" value="60">28000원 </label>
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
			  					<label><input type="radio" name="period" value="90">40000원 </label>
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
				  					<label><input type="radio" name="period" value="120">52000원 </label>
								</div>
				     		</p>
				    	</div>
				    </div>
				</div>
			</div>
		</div>
		<br><br>
		<div class="row row2">
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
  		<div class="row row3">
  			<div class="col-sm-3"></div>
  			<div class="col-sm-6">
	  			<c:if test="${empty SoExpireDate}">
	  				<h4>결제정보 입력</h4>
	  				카드 번호 <input type="text" class="form-control" name="cardNum" id="cardNum" placeholder="숫자만 입력" size="16" maxlength="16">
	  				유효 기간 <input type="text" class="form-control" name="validThru" id="validThru" placeholder="MMYY" size="4" maxlength="4">
	  				보안코드<input type="text" class="form-control" name="secCode" id="secCode" placeholder="1234" size="4" maxlength="4"><br><br>
	  				<input type="submit" class="btn btn-primary orange-background" value="주의사항에 동의하고 결제"> 
	  				<a href="main_shopowner"><input type="button" class="btn btn-primary orange-border" value="취소"></a>
	  			</c:if>
	  			<c:if test="${!empty SoExpireDate}">
	  				<span class="red">서비스 만료 날짜인 ${SoExpireDate} 이후에 결제해주세요!</span>
	  			</c:if>
  			</div>
  			<div class="col-sm-3"></div>
  		</div>
	</div>
	<div class="col-sm-3" ></div>
</form>

