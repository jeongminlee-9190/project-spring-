import {countInterest} from './util.js';

function isInterest(){
	var mId = $('#loginInfo').attr('data-login_mId');
	if (mId != undefined) {
	  $.each($(".interestUI"), function () {
	    var UIsCode = $(this).attr("data-sCode");
	    $.ajax({
	      type: "post",
	      url: "isInterest",
	      dataType: "text",
	      data: {
	        mId: mId,
	        sCode: UIsCode
	      },
	      success: function (data, status, xhr) {
	        if (data == "1") {
	          $("#interestUI" + UIsCode).replaceWith("<span id='interestUI" + UIsCode + "'><img src='resources/images/icon_clickHt.png'></span>");
	        } else if (data == "0") {
	        	if($('#interestUI' + UIsCode).parent('#shop_title_like').length > 0){
	        		$("#interestUI" + UIsCode).replaceWith("<span id='interestUI" + UIsCode + "'><img src='resources/images/shopInfo_heart_none.png'></span>");
	        	}else{
	        		$("#interestUI" + UIsCode).replaceWith("<span id='interestUI" + UIsCode + "'><img src='resources/images/icon_Ht.png'></span>");
	        	}
	        }
	      }
	    });
	  });
	}
}
$('body').on('click','.interestBTN',function(){
	var BTNsCode = $(this).attr("data-sCode");
	var mId = $('#loginInfo').attr('data-login_mId');
	if (mId != undefined) {
		$.ajax({
			type: "post",
			url: "interest",
			dataType: "text",
			data: {
				mId: mId,
				sCode: BTNsCode
			},
			success: function (data, status, xhr) {
				if (data == "1") {
					$("#interestUI" + BTNsCode).replaceWith("<span id='interestUI" + BTNsCode + "'><img src='resources/images/icon_clickHt.png'></span>");
				} else if (data == "0") {
					if($('#interestUI' + BTNsCode).parent('#shop_title_like').length > 0){
						$("#interestUI" + BTNsCode).replaceWith("<span id='interestUI" + BTNsCode + "'><img src='resources/images/shopInfo_heart_none.png'></span>");
					}else{
						$("#interestUI" + BTNsCode).replaceWith("<span id='interestUI" + BTNsCode + "'><img src='resources/images/icon_Ht.png'></span>");
					}
				}
				countInterest(BTNsCode);
			}
		});
	} else {
		alert("로그인을 하세요")
	}
})


export {isInterest}