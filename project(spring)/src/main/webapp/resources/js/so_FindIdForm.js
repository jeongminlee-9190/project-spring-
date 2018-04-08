$(document).ready(function(){
		var re_phone1=/^[0-9]{3,4}$/;
		var re_phone2=/^[0-9]{4,4}$/;
		var re_phone3=/^[0-9]{4,4}$/;
		var re_license=/^[0-9]{10,10}$/;
		var re_email=/^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
		
		$("#SoFindForm").submit(function(e){
			if(re_license.test($("#soLicense").val())!= true){
				alert('유효한 사업자 번호를 입력하세요. 10자리&하이픈제거');
				$("#soLicense").focus();
				e.preventDefault();
			}else if($("#soName").val()==""){
				alert('이름을 입력하세요');
				$("#soName").focus();
				e.preventDefault();
			}else if(re_phone1.test($("#soPhone1").val())!= true){
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
			}	
		});
	});