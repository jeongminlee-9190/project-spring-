<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
	<form class="form-inline" action="SoJoin" method="POST" id="SoAddForm">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<h2 style="text-align:center">회원 가입 정보</h2>
				<table class="table table-hover">
					<tbody>
						<tr>
							 <th>아이디</th>
							 <td><input type="text" class ="form-control" name="soId" id="soId" placeholder="(예)zzz@naver.com" maxlength="30"size="32px">
							 <span id="result1"></span></td>
						</tr>
					
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class ="form-control" name="soPasswd" id="passwd" placeholder="영어+숫자  8~10자리" maxlength="10" size="17">
						   	 <input type="password" class ="form-control" id="passwd2" placeholder="비밀번호 재입력" maxlength="10" size="17">
						</tr>
				
						<tr>
							<th>이름</th>
							<td><input type="text" class ="form-control" name="soName" id="soName" placeholder="(예)홍길동" size="20" maxlength="20"></td>
						</tr>
				
						<tr>
							<th>휴대전화</th> 
							<td><input type="text" class ="form-control" name="soPhone1" id="soPhone1" size="3" maxlength="3" placeholder="010">-
								<input type="text" class ="form-control" name="soPhone2" id="soPhone2" size="4" maxlength="4" placeholder="1111">-
								<input type="text" class ="form-control" name="soPhone3" id="soPhone3" size="4" maxlength="4" placeholder="1111">			
							</td>
						</tr>	
							
						<tr>
							<th>사업자번호</th>
							<td><input type="text" class ="form-control" name="soLicense" id="soLicense" placeholder="- 하이픈 없이 숫자 10자리만 기재" maxlength="10" size="30">
							<br><span id="result3"></span></td>
						</tr>
					
						<tr>
							<th>주소</th>
							<td><input type="text" class ="form-control" name="soPost" id="sample6_postcode" size="5" placeholder="우편번호">
							<input type="button" class="btn_addr" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
							<input type="text" class ="form-control" name="soAddr1" id="sample6_address" placeholder="사업자 등록증 상의 주소" size="40px"><br>
							<input type="text" class ="form-control" name="soAddr2" id="sample6_address2" placeholder="상세 주소" size="40px"></td>
						</tr>
					</tbody>
				</table>

				<a data-toggle="modal" data-target="#myModal"><input type="button" value="약관 확인" class="btn btn-primary orange-border-term" id="termRead"></a>
				<input type="submit" value="약관 모두 동의하고 회원가입" class="btn btn-primary orange-bg">
				<a href="index_shopowner"><input type="button" value="취소" class="btn btn-primary orange-border-cancel"></a>
				<!-- The Modal -->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">			      
							<!-- Modal Header -->
							<div class="modal-header">
								<span class="modal-title">약관 자세히 보기</span><button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>			        
							<!-- Modal body -->
							<div class="modal-body">
								<jsp:include page="soTermForm.jsp" flush="true" />
							</div><!--modal body  -->
						</div>
					</div>
				</div>
			</div><!-- col-sm-6 -->
			<div class="col-sm-4"></div>
		</div><!-- end of row -->
	</form>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="resources/js/addr.js"></script>
<script>
</script>
