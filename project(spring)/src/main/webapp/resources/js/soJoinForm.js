/*idCheck*/
//요청용
	/* var xmlRequest;
	function idCheck(id){
		xmlRequest=new XMLHttpRequest();
  		xmlRequest.onreadystatechange=x;	
  		// MemberIdCheckServlet에 요청
  		xmlRequest.open("get","SoIdCheckServlet?soId="+id, true);
  		xmlRequest.send(null); // null은 get일때
  	
  		console.log(id.length);
		if(id.length<5 || id.length>10){
			document.querySelector("#result1").innerText="아이디는 4자 이상 10자 이하여야 합니다.";
		}else{
			document.querySelector("#result1").innerText="";
		}
 	 }//end req
	// 응답용
	function x(){
  		if(xmlRequest.readyState==4 && xmlRequest.status == 200){
  			var time = xmlRequest.responseText;
  			document.querySelector("#result1").innerText=time;
  		} //end if
	}//end response() */
/*end of idCheck*/
 	$(document).ready(function(){
 		$("#passwd").keyup(function(){
 			var re_pw = /^[a-z0-9]{8,10}$/; // 비밀번호 검사식
 			var mesg = "비밀번호 사용 가능";
 			if(re_pw.test($("#passwd").val())!=true){
 				mesg ="비밀번호는 8자 이상 10자 이하여야 하며, 특수문자는 사용 불가합니다.";
 			}
 			$("#result2").text(mesg); 
 		});
 		$("#passwd2").keyup(function(){
 			var mesg = "비밀번호 일치";
 			if($("#passwd").val()!=$("#passwd2").val()){
 				mesg="비밀번호 불일치";
 			}
 			$("#result2").text(mesg);
 		});
 		
 		$("#SoAddForm").submit(function(e){
 			var re_phone1=/^[0-9]{3,4}$/;
 			var re_phone2=/^[0-9]{4,4}$/;
 			var re_phone3=/^[0-9]{4,4}$/;
 			var re_license=/^[0-9]{10,10}$/;
 			var re_email=/^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
 			var re_pw = /^[a-z0-9]{8,10}$/; // 비밀번호 검사식
 			var mesg=null;
 			if(re_email.test($("#soId").val()) != true){
 				alert("아이디는 이메일 형식으로 입력해주세요.");
 				$("#soId").focus();
 				e.preventDefault();
 			}else if(re_pw.test($("#passwd").val()) != true){/* 비밀번호 체크  */
 				alert("유효한 비밀번호를 입력해주세요.");
 				$("#passwd").focus();
 				e.preventDefault();
 			}else if($("#passwd").val()!=$("#passwd2").val()){
 				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
 				$("#passwd2").focus();
 				e.preventDefault();
 			}else if($("#soName").val().length==0){/* 이름 체크 */
 				alert("이름을 입력하세요.");
 				$("#soName").focus();
 				e.preventDefault();
 			}else if(re_phone1.test($("#soPhone1").val())!= true){/* 전화번호 체크 */
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone1").focus();
				e.preventDefault();
			}else if(re_phone2.test($("#soPhone2").val())!= true){
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone2").focus();
				e.preventDefault();
			}else if(re_phone3.test($("#soPhone3").val())!= true){
				alert('유효한 전화번호를 입력하세요');
				$("#soPhone3").focus();
				e.preventDefault();
			}else if(re_license.test($("#soLicense").val())!= true){
				alert('유효한 사업자 번호를 입력하세요. 10자리&하이픈제거');
				$("#soLicense").focus();
				e.preventDefault();
			}else if($("#sample6_address").val().length==0){
				alert('기본 주소를 입력하세요');
				$("#sample6_address").focus();
				e.preventDefault();
			}else if($("#sample6_address2").val().length==0){
				alert('상세 주소를 입력하세요');
				$("#sample6_address2").focus();
				e.preventDefault();
			}
 		});
 	});