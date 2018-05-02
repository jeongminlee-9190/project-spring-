
//countInterest에서 sCode를 파라미터로 받는 이유는 여러 페이지에서 sCode를 받아 오는 방법이 다르기 때문!
function countInterest(sCode){
	let data = {'sCode' : sCode};
	$.ajax({
		method:'post',
		url:'countInterest',
		contentType:'application/json',
		data:JSON.stringify(data),
		dataType:'text',
		success:function(data, status, xhr){
			$('#shop_title_scoreResult span:nth-child(2)').text(data);
		}
	});
}

function countReview(){
	let count = $('#myReview > div > div:nth-child(1)').length;
	$('#shop_title_scoreResult span:nth-child(4)').text(count);
}

export {countInterest, countReview}

