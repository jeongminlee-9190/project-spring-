$(document).ready(function(){
	
	// 비밀번호 검사식
	var re_pw = /^[a-zA-Z0-9]{6,15}$/;
	
	var oldPw = $("#old_mPasswd");
	var mPasswd = $("#mPasswd");
	var mPasswd2 = $("#mPasswd2");
	
	$("#old_mPasswd").keyup(function(){
		var mPasswd = $("#old_mPasswd").val();
		var length = mPasswd.length;
		console.log(mPasswd,length);
		
		if(length>5){
			$.ajax({
				url: "mPwCheck",
				type: "POST",
				data:{
					mPasswd:mPasswd
				},
				dataType:"text",
				success:function(responseData){
					if(responseData==0){
						$("#result1").text("현재 비밀번호 불일치").css("color","red");
					}
					else if(responseData==1){
						$("#result1").text("현재 비밀번호 일치").css("color","blue");
					}
				},
				error:function(error){
					console.log("error"+error);
				}
			});
		}
	});	
	
	$("#mPasswd").on("click",function(){

		if (!oldPw.val()) {
			$("#result2").text("현재 비밀번호를 먼저 입력해 주세요.").css("color","red");
			oldPw.focus();
			return false;
		}
		
	});
	
	$("#mPasswd").keyup(function(){
		
		// 현재 비밀번호와 동일 여부
		if ( oldPw.val() == mPasswd.val()){
			$("#result2").text("현재 비밀번호와 동일 합니다.").css("color","red");
			return false;
		}
		
		// 비밀번호 길이
		if(!/^[a-zA-Z0-9]{6,15}$/.test(mPasswd.val())){ 
			$("#result2").text("비밀번호는 숫자, 영문 조합으로 6~15자리를 사용해야 합니다.").css("color","red");
			mPasswd.focus();
			return false;
		}
		
		var chk = 0;
		
		// 비밀번호 영문, 숫자 2종 이상 혼용
		if(mPasswd.val().search(/[0-9]/g) != -1 ) chk ++;
		if(mPasswd.val().search(/[a-z]/ig)  != -1 ) chk ++;
		if (chk >= 2) {
			$("#result2").text("사용 가능한 비밀번호 입니다.").css("color","blue");
		} else if(chk < 2){ 
			$("#result2").text("비밀번호는 숫자,영문 두가지이상 혼용하여야 합니다.").css("color","red");
			return false;
		} 
		
		//새 비밀번호 일치 확인
		if( mPasswd.val() == mPasswd2.val() ) {
			$("#result2").text("비밀번호가 일치 합니다.").css("color","blue");
		} 
		if( mPasswd.val() != mPasswd2.val()){
			$("#result2").text("비밀번호가 일치 하지 않습니다.").css("color","red");
			return false;
		}

	});
	
	//새 비밀번호 일치 확인 
	$("#mPasswd2").keyup(function(){
		
		if( mPasswd.val() == mPasswd2.val() ) {
			$("#result2").text("비밀번호가 일치 합니다.").css("color","blue");
		} 
		if( mPasswd.val() != mPasswd2.val()){
			$("#result2").text("비밀번호가 일치 하지 않습니다.").css("color","red");
			return false;
		}

	});
		
	$("#mPwUpdate").submit(function(){
		var mesg=null;
		if($("#result1").text()=="" || $("#result1").text()=="현재 비밀번호 불일치"){
			alert("현재 비밀번호를 정확히 입력해주세요.");
			$("#old_mPasswd").focus();
			return false;
		}else if(re_pw.test($("#mPasswd").val()) != true){/* 비밀번호 체크  */
			alert("유효한 비밀번호를 입력해주세요.");
			$("#mPasswd").focus();
			return false;
		}else if($("#mPasswd").val()!=$("#mPasswd2").val()){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			$("#mPasswd2").focus();
			return false;
		}else if($("#old_mPasswd").val() == $("#mPasswd").val()){
			alert('기존 비밀번호와 동일합니다.');
			return false;
		}
	});
	
	// 전화 번호
	$("#mPhoneUpdateForm").submit(function(){
		var re_phone2=/^[0-9]{4,4}$/;
		var re_phone3=/^[0-9]{4,4}$/;
		var phone1 = $("#mPhone1").val();
		var phone2 = $("#mPhone2").val();
		var phone3 = $("#mPhone3").val();
		var phone = phone1+"-"+phone2+"-"+phone3;
		var mPhone = $("#mPhone").text();

		if(re_phone2.test(phone2)!= true){
			alert('유효한 전화번호를 입력해주세요.');
			$("#mPhone2").focus();
			return false;
		}else if(re_phone3.test(phone3)!= true){
			alert('유효한 전화번호를 입력해주세요.');
			$("#mPhone3").focus();
			return false;
		}else if(mPhone == phone){
			alert('기존에 등록한 전화번호와 동일합니다.');
			return false;
		}
	});
	
});
