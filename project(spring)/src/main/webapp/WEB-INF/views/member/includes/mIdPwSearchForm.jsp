<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="idpwSearch_title">
	<div>
		<p>ID</p><p>/</p><p>PASSWD</p><p> Search</p>
	</div>
</div>
	
<div id="idpwSearch_content_wrapper">
	
	<div id="idpwSearch_content_wrap">
	
		<div class="clearfix">
			<button type="button" id="idSearch">ID Search</button>
			<button type="button" id="pwSearch">PASSWD Search</button>
		</div>
		
		<form action="mFind" method="get" id="idSearch_wrap" class="idpwSearch_wrap">
		
			<input type="hidden" name="find" value="mId">	
			
			<div id="idSearch_txt">
				<label for="mNameSearch">
					<span>닉네임</span>
					<input type="text" name="mName" id="mNameSearch">
				</label>
				
				<label for="mPhoneSearch">
					<span>전화번호</span>
					<input type="text" name="mPhone1" id="mPhoneSearch1">-<input type="text" name="mPhone2" id="mPhoneSearch2">-<input type="text" name="mPhone3" id="mPhoneSearch3">
				</label>
			</div>
			
			<div id="idSearch_btn" class="idpwSearch_btn">
				<button>검색하기</button>
			</div>
			
		</form>
		
		<form action="mFind" method="get" id="pwSearch_wrap" class="idpwSearch_wrap">
		
			<input type="hidden" name="find" value="mPasswd">
				
			<div id="pwSearch_txt">
				<label for="mIdSearch">
					<span>아이디 또는 이메일</span>
					<input type="text" name="mId" id="mIdSearch">
				</label>
			
				<label for="mNameSearch">
					<span>닉네임</span>
					<input type="text" name="mName" id="mNameSearch2">
				</label>
				
				<label for="mPhoneSearch">
					<span>전화번호</span>
					<input type="text" name="mPhone1" id="mPhoneSearch1-2">-<input type="text" name="mPhone2" id="mPhoneSearch2-2">-<input type="text" name="mPhone3" id="mPhoneSearch3-2">
				</label>
			</div>
			
			<div id="pwSearch_btn" class="idpwSearch_btn">
				<button>검색하기</button>
			</div>
			
		</form>
	
	</div>
	
</div> <!-- End : idpwSearch_content_wrapper -->
