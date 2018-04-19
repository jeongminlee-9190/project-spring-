$(document).ready(function(){
		$("#btn_pw_submit").click(function(){
			$(".phone_modify").html("<select class='form-control' id='mPhone1' name='mPhone1'><option>010</option><option>011</option></select>-"+
					"<input type='text' class='form-control' name='mPhone2' id='mPhone2' size='3' maxlength='4'>-"+
					"<input type='text' class='form-control' name='mPhone3' class='form-control' id='mPhone3' size='3' maxlength='4'>"+
					"<input type='submit' class='btn btn-primary btn_pw_submit' id='btn-complete' value='변경완료'>")
		});
		
		$("#mPhoneUpdateForm").submit(function(e){
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
 				e.preventDefault();
 			}else if(re_phone3.test(phone3)!= true){
 				alert('유효한 전화번호를 입력해주세요.');
 				$("#mPhone3").focus();
 				e.preventDefault();
 			}else if(mPhone == phone){
 				alert('기존에 등록한 전화번호와 동일합니다.');
 				e.preventDefault();
 			}
		});
	});

$(document).ready(function(){
	var re_pw = /^[a-z0-9]{8,10}$/; // 비밀번호 검사식
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
						$("#result1").text("현재 비밀번호 불일치");
					}
					else if(responseData==1){
						$("#result1").text("현재 비밀번호 일치");
					}
				},
				error:function(error){
					console.log("error"+error);
				}
			});
		}
	});	
	
	$("#mPasswd").keyup(function(){
			var mesg = "비밀번호 사용 가능";
			if(re_pw.test($("#mPasswd").val())!=true){
				mesg ="비밀번호는 8자 이상 10자 이하여야 하며, 특수문자는 사용 불가합니다.";
			}
			$("#result2").text(mesg); 
		});
		$("#mPasswd2").keyup(function(){
			var mesg = "비밀번호 일치";
			if($("#mPasswd").val()!=$("#mPasswd2").val()){
				mesg="비밀번호 불일치";
			}
			$("#result3").text(mesg);
		});
		
		$("#mPwUpdate").submit(function(e){
			var mesg=null;
			if($("#result1").text()=="" || $("#result1").text()=="현재 비밀번호 불일치"){
				alert("현재 비밀번호를 정확히 입력해주세요.");
				$("#old_mPasswd").focus();
				e.preventDefault();
			}else if(re_pw.test($("#mPasswd").val()) != true){/* 비밀번호 체크  */
				alert("유효한 비밀번호를 입력해주세요.");
				$("#mPasswd").focus();
				e.preventDefault();
			}else if($("#mPasswd").val()!=$("#mPasswd2").val()){
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
				$("#mPasswd2").focus();
				e.preventDefault();
			}else if($("#old_mPasswd").val() == $("#mPasswd").val()){
 				alert('기존 비밀번호와 동일합니다.');
 				e.preventDefault();
 			}
		});
});
