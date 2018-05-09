$(document).ready(function(){
	
	var mId = $("#mIdSearch");
	var mName = $("#mNameSearch");
	var mName2 = $("#mNameSearch2");
	var mPhone1 = $("#mPhoneSearch1");
	var mPhone2 = $("#mPhoneSearch2");
	var mPhone3 = $("#mPhoneSearch3");
	var mPhone1_2 = $("#mPhoneSearch1-2");
	var mPhone2_2 = $("#mPhoneSearch2-2");
	var mPhone3_2 = $("#mPhoneSearch3-2");
	
	// 정규식 - 아이디 유효성 검사
    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	// 정규식 - 전화번호 번호 정규식
	var regExp1 = /^\d{3}$/;
    var regExp2 = /^\d{3,4}$/;
    var regExp3 = /^\d{4}$/;
    // 정규식 - 전화번호 유효성 검사
    var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	
	//비밀번호 찾기 hide
	$("#pwSearch").css({"background-color":"#fddcaa","border-bottom":"3px solid #faa72a"});
	
	var idHide;
	var pwHide = $("#pwSearch_wrap").detach();
	//비밀번호 찾기 클릭
	$("#pwSearch").on("click",function(){
		
		$("#idpwSearch_content_wrap").append(pwHide);
		idHide = $("#idSearch_wrap").detach();
		
		$("#pwSearch").css({"background-color":"#faa72a","border-bottom":"none"});
		$("#idSearch").css({"background-color":"#fddcaa","border-bottom":"3px solid #faa72a"});
		
	});

	//아이디 찾기 클릭
	$("#idSearch").on("click",function(){
		
		pwHide = $("#pwSearch_wrap").detach();
		$("#idpwSearch_content_wrap").append(idHide);
		
		$("#idSearch").css({"background-color":"#faa72a","border-bottom":"none"});
		$("#pwSearch").css({"background-color":"#fddcaa","border-bottom":"3px solid #faa72a"});
	
	});
	
	$("#idSearch_btn button").on("click",function(){
	    
	    // 닉네임 입력 체크
		if(!mName.val()){
			alert("닉네임을 입력하세요.");
			mName.focus();
			return false;
		}
		
		// 닉네임 길이 체크
		if(mName.val().length == 1){
			alert("닉네임은 2글자 이상 입력해주세요.");
			mName.focus();
			return false;
		}
	    
	    //휴대전화1 입력 체크
		if(!mPhone1.val()){
			alert("휴대전화번호를 입력해 주세요.");
			mPhone1.focus();
			return false;
		}
	    
		//휴대전화2 입력 체크
		if(!mPhone2.val()){
			alert("휴대전화번호를 입력해 주세요.");
			mPhone2.focus();
			return false;
		}
		
		//휴대전화3 입력 체크
		if(!mPhone3.val()){
			alert("휴대전화번호를 입력해 주세요.");
			mPhone3.focus();
			return false;
		}
		
		//휴대전화1 길이
		if(!regExp1.test(mPhone1.val())){
			alert("총 핸드폰 자리수는 3자여야 합니다.");
			mPhone1.focus();
			return false;
		}
		
		//휴대전화2 길이
		if(!regExp2.test(mPhone2.val())){
			alert("총 핸드폰 자리수는 3글자이거나, 4자여야 합니다.");
			mPhone2.focus();
			return false;
		}
		
		//휴대전화3 길이
		if(!regExp3.test(mPhone3.val())){
			alert("총 핸드폰 자리수는 4자여야 합니다.");
			mPhone3.focus();
			return false;
		}
		
	});
	
	$(document).on("click","#pwSearch_btn button",function(){
		
	    //아이디 입력 체크
		if(!mId.val()){
			alert("아이디를 입력하세요.");
			mId.focus();
			return false;
		} else { 
			if(!regEmail.test(mId.val())) { 
				alert("이메일 주소가 유효하지 않습니다."); 
				mId.focus();
				return false;
			} 
		} 
		
	    // 닉네임 입력 체크
		if(!mName2.val()){
			console.log("AAA");
			alert("닉네임을 입력하세요.");
			mName2.focus();
			return false;
		}
		
		// 님네임 길이 체크
		if(mName2.val().length == 1){
			alert("닉네임은 2글자 이상 입력해주세요.");
			mName2.focus();
			return false;
		}
	    
	    //휴대전화1 입력 체크
		if(!mPhone1_2.val()){
			alert("휴대전화번호를 입력해 주세요.");
			mPhone1_2.focus();
			return false;
		}
	    
		//휴대전화2 입력 체크
		if(!mPhone2_2.val()){
			alert("휴대전화번호를 입력해 주세요.");
			mPhone2_2.focus();
			return false;
		}
		
		//휴대전화3 입력 체크
		if(!mPhone3_2.val()){
			alert("휴대전화번호를 입력해 주세요.");
			mPhone3_2.focus();
			return false;
		}
		
		//휴대전화1 길이
		if(!regExp1.test(mPhone1_2.val())){
			alert("총 핸드폰 자리수는 3자여야 합니다.");
			mPhone1_2.focus();
			return false;
		}
		
		//휴대전화2 길이
		if(!regExp2.test(mPhone2_2.val())){
			alert("총 핸드폰 자리수는 3글자이거나, 4자여야 합니다.");
			mPhone2_2.focus();
			return false;
		}
		
		//휴대전화3 길이
		if(!regExp3.test(mPhone3_2.val())){
			alert("총 핸드폰 자리수는 4자여야 합니다.");
			mPhone3_2.focus();
			return false;
		}
		
	});
	
});