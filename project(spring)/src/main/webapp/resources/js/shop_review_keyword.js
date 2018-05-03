
$(document).ready(function(){
	
	var shop_category0 = "shop_category0";
	
	var shop_cate_btn0 = "shop_cate_btn0";
	var shop_cate_title = [];
	var shop_category0 = "shop_category0";
	var shop_list0 = "shop_list0";
	
	var keyword_good_user = "keyword_good_user";
	var keyword_bad_user = "keyword_bad_user";
	var good = "good/";
	var bad = "bad/"
	var keywords = [];
	
	axios.get('reviewKeywords')
	.then((res)=>{
		shop_cate_title = res.data.shop_cate_title;
		
		for (var i=0; i<shop_cate_title.length; i++){
			$("#shop_review_cate_wrap").append(
					"<div id='" +  shop_category0 + (i+1) + "' class='shop_category'></div>"
			);
		}
		
		for (var j=0; j<shop_cate_title.length; j++){
			$("#" + shop_category0 + (j+1)).append(
				"<div id='" + shop_cate_btn0 + (j+1) + "' class='shop_cate_btn'>" +
					"<p>" + shop_cate_title[j] + "</p>" +
					"<div class='shop_cate_icon'>" +
						"<span></span><span></span><span></span>" +
					"</div>" +
				"</div>" +
				"<ul id='" + shop_list0 + (j+1) + "' class='shop_list clearfix'>" +
				"</ul>"
			);
		}
		
		$(".shop_cate_btn").one("click",function(){
			
			if($(this).parent("div").index()==0){
				keywords = res.data.keywordList01;
				for (var k=0; k<keywords.length; k++){
					$(this).next("ul").append(
						"<li class='clearfix'>" +
						"<button type='button' class='category' data-keyword='" + keywords[k] + "' >" + keywords[k] + "</button>" +
						"<div class='keyword_good_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + good + keywords[k] +"' id='" + keyword_good_user + (k+1) + "'>" +
							"<label for='" + keyword_good_user + (k+1) + "' class='reviewKeyword_good'></label>" +
						"</div>" +
						"<div class='keyword_bad_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + bad + keywords[k] + "' id='" + keyword_bad_user + (k+1) + "'>" +
							"<label for='" + keyword_bad_user + (k+1) + "' class='reviewKeyword_bad'></label>" +
						"</div>" +
						"</li>"
					)
				}	
			} else if ($(this).parent("div").index()==1){
				keywords = res.data.keywordList02;
				for (var k=0; k<keywords.length; k++){
					$(this).next("ul").append(
						"<li class='clearfix'>" +
						"<button type='button' class='category' data-keyword='" + keywords[k] + "' >" + keywords[k] + "</button>" +
						"<div class='keyword_good_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + good + keywords[k] +"' id='" + keyword_good_user + (k+8) + "'>" +
							"<label for='" + keyword_good_user + (k+8) + "' class='reviewKeyword_good'></label>" +
						"</div>" +
						"<div class='keyword_bad_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + bad + keywords[k] + "' id='" + keyword_bad_user + (k+8) + "'>" +
							"<label for='" + keyword_bad_user + (k+8) + "' class='reviewKeyword_bad'></label>" +
						"</div>" +
						"</li>"
					)
				}	
			} else {
				keywords = res.data.keywordList03;
				for (var k=0; k<keywords.length; k++){
					$(this).next("ul").append(
						"<li class='clearfix'>" +
						"<button type='button' class='category' data-keyword='" + keywords[k] + "' >" + keywords[k] + "</button>" +
						"<div class='keyword_good_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + good + keywords[k] +"' id='" + keyword_good_user + (k+15) + "'>" +
							"<label for='" + keyword_good_user + (k+15) + "' class='reviewKeyword_good'></label>" +
						"</div>" +
						"<div class='keyword_bad_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + bad + keywords[k] + "' id='" + keyword_bad_user + (k+15) + "'>" +
							"<label for='" + keyword_bad_user + (k+15) + "' class='reviewKeyword_bad'></label>" +
						"</div>" +
						"</li>"
					)
				}	
			}
			
		});
	})
	.catch((error)=>{
		console.log(error);
	});	

	
});
