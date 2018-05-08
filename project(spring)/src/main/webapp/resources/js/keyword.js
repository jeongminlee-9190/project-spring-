$(document).ready(function(){
	
	//키워드 검색창으로 올리기
	var keywords = [];
	var keyword;
	var keywordsIndex;
	
	$(document).on("click",".k_category ul li button",function(){
		keyword = $(this).text();
		keywordsIndex = keywords.indexOf(keyword);
		console.log(keywordsIndex);
		
		if(keywords.length < 4 && keywordsIndex==-1){
			keywords.push(keyword);
			$("#search").val(keywords);
			//카테고리 리트스 버튼 클릭 하면 컬러 바뀌기
			$(this).css({"background-color":"#ffa827", "color":"#fff"});
		}else if(keywordsIndex>=0){
			keywords.splice(keywordsIndex,1);
			$("#search").val(keywords);
			//카테고리 리트스 버튼 클릭 하면 원래 컬러로 돌아오기
			$(this).css({"background-color":"#fff", "color":"#ffa827"});
		}
	
	});
	
	//카테고리 버튼 누르면 보여지기
	$(document).on("click",".cate_btn", function(){
		$(this).next("ul").slideToggle(300);
		$(this).find("span").fadeToggle(300);
	});
	
  
});