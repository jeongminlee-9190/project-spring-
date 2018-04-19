$(document).ready(function () {
    var mId = $('#loginInfo').attr('data-login_mId');
    if (mId != '') {
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
            	$("#interestUI" + UIsCode).replaceWith("<span id='interestUI" + UIsCode + "'><img src='resources/images/icon_Ht.png'></span>");
            }
          }
        });
      });
    }

    $(".interestBTN").on("click", function () {
      if (mId != '') {
        var BTNsCode = $(this).attr("data-sCode");
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
              $("#interestUI" + BTNsCode).replaceWith("<span id='interestUI" + BTNsCode + "'><img src='resources/images/icon_Ht.png'></span>");
            }
          }
        });
      } else {
        alert("로그인을 하세요")
      }
    });
  })