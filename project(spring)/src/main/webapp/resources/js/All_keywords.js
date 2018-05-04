
$(document).ready(function(){
	
	//main_keyword
	var category0 = "category0";
	var cate_btn0 = "cate_btn0";
	var list0 = "list0";
	
	//shop_review_keyword
	var shop_category0 = "shop_category0";
	var shop_cate_btn0 = "shop_cate_btn0";
	var shop_cate_title = [];
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
			console.log("aaa");
			//main_keyword
			$("#cate_wrap").append(
				"<div id='" + category0 + (i+1) + "' class='k_category'></div>"
			);
			//shop_review_keyword
			$("#shop_review_cate_wrap").append(
				"<div id='" +  shop_category0 + (i+1) + "' class='shop_category'></div>"
			);
		}
		
		for (var j=0; j<shop_cate_title.length; j++){
			//main_keyword
			$("#" + category0 + (j+1)).append(
				"<div id='" + cate_btn0 + (j+1) + "' class='cate_btn'>" +
				"<p>" + shop_cate_title[j] + "</p>" +
				"<div class='cate_icon'>" +
					"<span></span><span></span><span></span>" +
				"</div>" +
				"</div>" +
				"<ul id='" + list0 + (j+1) + "' class='list clearfix'>" +
				"</ul>"
			);
			
			//shop_review_keyword
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
		
		//main_keyword
		$(".cate_btn").one("click",function(){
			if($(this).parent("div").index()==0){
				keywords = res.data.keywordList01;
				
				for (var k=0; k<keywords.length; k++){
					//shop_review_keyword
					$(this).next("ul").append(
						"<li>" +
						"<button type='button' class='category'>" + keywords[k] + "</button>" +
						"</li>"
					);
				}
				
			} else if ($(this).parent("div").index()==1){
				keywords = res.data.keywordList02;
				
				for (var k=0; k<keywords.length; k++){
					//shop_review_keyword
					$(this).next("ul").append(
						"<li>" +
						"<button type='button' class='category'>" + keywords[k] + "</button>" +
						"</li>"
					);
				}
				
			} else {
				keywords = res.data.keywordList03;
				
				for (var k=0; k<keywords.length; k++){
					//shop_review_keyword
					$(this).next("ul").append(
						"<li>" +
						"<button type='button' class='category'>" + keywords[k] + "</button>" +
						"</li>"
					);
				}
				
			}
			
		});
		
		//shop_review_keyword
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
					);
					
					// 좋아요 input + label 묶기 CSS
					$(":input[id='" + keyword_good_user + (k+1) + "']").css("display", "none");

					$(":input[id='" + keyword_good_user + (k+1) + "'] + label").css({
						"display":"block",
						"position":"absolute",
						"top":"15px",
						"left":"50px",
						"width":"23px",
						"height":"20px",
						"background-image":"url('resources/images/shopInfo_review_LBtn_good.png')",
						"background-repeat":"no-repeat",
						"background-size":"100%",
						"background-position":"center center",
						"opacity":".4",
						"cursor":"pointer"
					});
					
					// 싫어요 input + label 묶기 CSS
					$(":input[id='" + keyword_bad_user + (k+1) + "']").css("display","none");
					
					$(":input[id='" + keyword_bad_user + (k+1) + "'] + label").css({
						"display":"block",
						"position":"absolute",
						"top":"15px",
						"left":"50px",
						"width":"23px",
						"height":"20px",
						"background-image":"url('resources/images/shopInfo_review_RBtn_bad.png')",
						"background-repeat":"no-repeat",
						"background-size":"100%",
						"background-position":"center center",
						"opacity":".4",
						"cursor":"pointer"
					});
				};

			} else if ($(this).parent("div").index()==1){
				keywords = res.data.keywordList02;

				for (var k=0; k<keywords.length; k++){

					$(this).next("ul").append(
						"<li class='clearfix'>" +
						"<button type='button' class='category' data-keyword='" + keywords[k] + "' >" + keywords[k] + "</button>" +
						"<div class='keyword_good_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + good + keywords[k] +"' id='" + keyword_good_user + (k+9) + "'>" +
							"<label for='" + keyword_good_user + (k+9) + "' class='reviewKeyword_good'></label>" +
						"</div>" +
						"<div class='keyword_bad_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + bad + keywords[k] + "' id='" + keyword_bad_user + (k+9) + "'>" +
							"<label for='" + keyword_bad_user + (k+9) + "' class='reviewKeyword_bad'></label>" +
						"</div>" +
						"</li>"
					);
					
					// 좋아요 input + label 묶기 CSS
					$(":input[id='" + keyword_good_user + (k+9) + "']").css("display", "none");

					$(":input[id='" + keyword_good_user + (k+9) + "'] + label").css({
						"display":"block",
						"position":"absolute",
						"top":"15px",
						"left":"50px",
						"width":"23px",
						"height":"20px",
						"background-image":"url('resources/images/shopInfo_review_LBtn_good.png')",
						"background-repeat":"no-repeat",
						"background-size":"100%",
						"background-position":"center center",
						"opacity":".4",
						"cursor":"pointer"
					});
					
					// 싫어요 input + label 묶기 CSS
					$(":input[id='" + keyword_bad_user + (k+9) + "']").css("display","none");
					
					$(":input[id='" + keyword_bad_user + (k+9) + "'] + label").css({
						"display":"block",
						"position":"absolute",
						"top":"15px",
						"left":"50px",
						"width":"23px",
						"height":"20px",
						"background-image":"url('resources/images/shopInfo_review_RBtn_bad.png')",
						"background-repeat":"no-repeat",
						"background-size":"100%",
						"background-position":"center center",
						"opacity":".4",
						"cursor":"pointer"
					});
					
				}	
			} else {
				keywords = res.data.keywordList03;

				for (var k=0; k<keywords.length; k++){

					$(this).next("ul").append(
						"<li class='clearfix'>" +
						"<button type='button' class='category' data-keyword='" + keywords[k] + "' >" + keywords[k] + "</button>" +
						"<div class='keyword_good_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + good + keywords[k] +"' id='" + keyword_good_user + (k+17) + "'>" +
							"<label for='" + keyword_good_user + (k+17) + "' class='reviewKeyword_good'></label>" +
						"</div>" +
						"<div class='keyword_bad_bg'>" +
							"<input type='checkbox' name='favorKeywords' value='" + bad + keywords[k] + "' id='" + keyword_bad_user + (k+17) + "'>" +
							"<label for='" + keyword_bad_user + (k+17) + "' class='reviewKeyword_bad'></label>" +
						"</div>" +
						"</li>"
					);
					
					// 좋아요 input + label 묶기 CSS
					$(":input[id='" + keyword_good_user + (k+17) + "']").css("display", "none");

					$(":input[id='" + keyword_good_user + (k+17) + "'] + label").css({
						"display":"block",
						"position":"absolute",
						"top":"15px",
						"left":"50px",
						"width":"23px",
						"height":"20px",
						"background-image":"url('resources/images/shopInfo_review_LBtn_good.png')",
						"background-repeat":"no-repeat",
						"background-size":"100%",
						"background-position":"center center",
						"opacity":".4",
						"cursor":"pointer"
					});
					
					// 싫어요 input + label 묶기 CSS
					$(":input[id='" + keyword_bad_user + (k+17) + "']").css("display","none");
					
					$(":input[id='" + keyword_bad_user + (k+17) + "'] + label").css({
						"display":"block",
						"position":"absolute",
						"top":"15px",
						"left":"50px",
						"width":"23px",
						"height":"20px",
						"background-image":"url('resources/images/shopInfo_review_RBtn_bad.png')",
						"background-repeat":"no-repeat",
						"background-size":"100%",
						"background-position":"center center",
						"opacity":".4",
						"cursor":"pointer"
					});
				}	
			}
			
		});
	})
	.catch((error)=>{
		console.log(error);
	});	

	
});
