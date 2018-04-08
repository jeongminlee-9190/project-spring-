$(document).ready(function(){
		var re_pw = /^[a-z0-9]{8,10}$/; // 비밀번호 검사식
		$("#old_soPasswd").keyup(function(){
			var soPasswd = $("#old_soPasswd").val();
			var length = soPasswd.length;
			console.log(soPasswd,length);
			if(length>5){
				$.ajax({
					url: "soPwCheck",
					type: "POST",
					data:{
						soPasswd:soPasswd
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
		
		$("#soPasswd").keyup(function(){
 			var mesg = "비밀번호 사용 가능";
 			if(re_pw.test($("#soPasswd").val())!=true){
 				mesg ="비밀번호는 8자 이상 10자 이하여야 하며, 특수문자는 사용 불가합니다.";
 			}
 			$("#result2").text(mesg); 
 		});
 		$("#soPasswd2").keyup(function(){
 			var mesg = "비밀번호 일치";
 			if($("#soPasswd").val()!=$("#soPasswd2").val()){
 				mesg="비밀번호 불일치";
 			}
 			$("#result3").text(mesg);
 		});
 		
 		$("#soPwUpdate").submit(function(e){
 			var mesg=null;
 			if($("#result1").text()=="" || $("#result1").text()=="현재 비밀번호 불일치"){
 				alert("현재 비밀번호를 정확히 입력해주세요.");
 				$("#old_soPasswd").focus();
 				e.preventDefault();
 			}else if(re_pw.test($("#soPasswd").val()) != true){/* 비밀번호 체크  */
 				alert("유효한 비밀번호를 입력해주세요.");
 				$("#soPasswd").focus();
 				e.preventDefault();
 			}else if($("#soPasswd").val()!=$("#soPasswd2").val()){
 				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
 				$("#soPasswd2").focus();
 				e.preventDefault();
 			}
 		});
});
