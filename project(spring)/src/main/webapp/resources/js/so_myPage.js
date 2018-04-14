$(document).ready(function(){
		$("#btn_pw_submit").click(function(){
			$(".phone_modify").html("<select class='form-control' id='soPhone1' name='soPhone1'><option>010</option><option>011</option></select>-"+
					"<input type='text' class='form-control' name='soPhone2' id='soPhone2' size='3' maxlength='4'>-"+
					"<input type='text' class='form-control' name='soPhone3' class='form-control' id='soPhone3' size='3' maxlength='4'>"+
					"<input type='submit' class='btn btn-primary btn_pw_submit' id='btn-complete' value='변경완료'>")
		});
		
		$("#soPhoneUpdateForm").submit(function(e){
 			var re_phone2=/^[0-9]{4,4}$/;
 			var re_phone3=/^[0-9]{4,4}$/;
 			var phone1 = $("#soPhone1").val();
 			var phone2 = $("#soPhone2").val();
 			var phone3 = $("#soPhone3").val();
 			var phone = phone1+"-"+phone2+"-"+phone3;
 			var soPhone = $("#soPhone").text();

 			if(re_phone2.test(phone2)!= true){
 				alert('유효한 전화번호를 입력해주세요.');
 				$("#soPhone2").focus();
 				e.preventDefault();
 			}else if(re_phone3.test(phone3)!= true){
 				alert('유효한 전화번호를 입력해주세요.');
 				$("#soPhone3").focus();
 				e.preventDefault();
 			}else if(soPhone == phone){
 				alert('기존에 등록한 전화번호와 동일합니다.');
 				e.preventDefault();
 			}
		});
	});