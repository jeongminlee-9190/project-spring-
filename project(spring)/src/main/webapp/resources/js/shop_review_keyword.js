
$(document).ready(function(){
	
	var shop_category0 = "shop_category0";
	
	for (var i=0; i<3; i++){
		$("#shop_review_cate_wrap").append(
				"<div id='" +  shop_category0 + (i+1) + "' class='shop_category'></div>"
		);
	}
	
	var shop_cate_btn0 = "shop_cate_btn0";
	var shop_cate_title = ["목적","기분","종류"]
	for (var j=0; j<3; j++){
		$("#" + shop_category0 + (j+1)).append(
			"<div id='" + shop_cate_btn0 + (j+1) + "' class='shop_cate_btn'>" +
				"<p>" + shop_cate_title[j] + "</p>" +
				"<div class='shop_cate_icon'>" +
					"<span></span><span></span><span></span>" +
				"</div>" +
			"</div>"
		);
	}
	
	
	/*for (var k=1; k<9; k++){
		$("#" + shop_category0 + j + "div").append(
			
		)
	}*/
	
});
