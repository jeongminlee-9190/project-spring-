import {countInterest} from './util.js';
import {isInterest} from './interest_export.js';

$(document).ready(function(){
	
	let mId = $('#myList_title').attr('data-mId');
	let mName = $('#myList_title').attr('data-mName');
	
	let countMyFavorite = function(){
		axios.get('countMyFavorit',{params:{'mId':mId, 'mName':mName}})
		.then((res)=>{
			console.log(res.data); 
			$("#myList_like > div:nth-child(2) > p:first-child").text(res.data.myInterestCnt);
			$("#myList_review > div:nth-child(2) > p:first-child").text(res.data.myReviewCnt);
		})
		.catch((error)=>{console.log(error)});
	}

	//내가 좋아요한 맛집
	$('#myList_like').on('click',function(){
		axios.get('myInterest',{params:{'mId':mId}})
		.then((res)=>{
			$('#test').empty();
			viewList(res);
			isInterest();
		})
		.catch((error)=>{console.log(error)});
	});
	
	//내가 리뷰남긴 맛집
	$('#myList_review').on('click',function(){
		axios.get('myReview',{params:{'mName':mName}})
		.then((res)=>{
			$('#test').empty();
			viewList(res);
			isInterest();
		})
		.catch((error)=>{console.log(error)});
	});
	
	let viewList = function(res){
		for(let i=0; i<res.data.length; i++){
			document.getElementById('test').innerHTML += `
			<div class="searchList_wrap clearfix" >
			
				<div class="shop_main_img">
					<img src="resources/upload/${res.data[i].sImage.split('/')[4]}" title="${res.data[i].sName}">
				</div>
				
				<div class="shop_small_info clearfix">
					<div class="shop_leftInfo">
						<a href="shopRetrieve?sCode=${res.data[i].sCode}&mName=${mName}" class="shop_title" >${res.data[i].sName}</a>
					</div>
					
					<div class="shop_rightInfo">
						<div class="shop_addr clearfix">
							<span><img src="resources/images/icon_loc.png" title="주소"></span>
							<span>${res.data[i].sAddr}</span>
						</div>
						<div class="shop_phone clearfix">
							<span><img src="resources/images/icon_phone.png" title="전화번호"></span>
							<span>${res.data[i].sPhone}</span>
						</div>
						<div class="shop_like clearfix">
							<span id="interestUI${res.data[i].sCode}" class="interestUI" data-sCode="${res.data[i].sCode}">
							<img src="resources/images/icon_Ht.png" title="종아요">
							</span>
							
							<button id="interestBTN${res.data[i].sCode}" class="interestBTN" data-sCode="${res.data[i].sCode}">
								좋아요
							</button>
						</div>
					</div>
				</div>
				
			</div>
			`
		}
	}
	
	countMyFavorite();
	
});

$("#test").ready(function(){
	$(".interestBTN").on("click", function () {
		clickInterest();
	});
})