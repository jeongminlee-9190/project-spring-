<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="shop_member_view_wrap">
<c:set var="sdto" value="${sInfo}"></c:set>
<c:set var="saddr" value="${sInfo.sAddr}"></c:set>
<c:set var="simage" value="${sInfo.sImage}"></c:set>
	<div id="shop_slider_wrap">
		<div class="item" >
			<ul id="slider" class="content-slider">
				<li><c:if test="${!empty fn: split(sdto.sImage,'/')[0]}"> 
					<a href="resources/upload/${fn: split(sdto.sImage,'/')[0]}">
						<img src="resources/upload/${fn: split(sdto.sImage,'/')[0]}">
					</a>
				</c:if></li>
				<li><c:if test="${!empty fn: split(sdto.sImage,'/')[1]}">
					<a href="resources/upload/${fn: split(sdto.sImage,'/')[1]}">
						<img src="resources/upload/${fn: split(sdto.sImage,'/')[1]}">
					</a>
				</c:if></li>
				<li><c:if test="${!empty fn: split(sdto.sImage,'/')[2]}">
					<img src="resources/upload/${fn: split(sdto.sImage,'/')[2]}">
				</c:if></li>
				<li><c:if test="${!empty fn: split(sdto.sImage,'/')[3]}">
					<img src="resources/upload/${fn: split(sdto.sImage,'/')[3]}">
				</c:if></li>
				<li><c:if test="${!empty fn: split(sdto.sImage,'/')[4]}">
					<img src="resources/upload/${fn: split(sdto.sImage,'/')[4]}">
				</c:if></li>
			</ul>
			
			<div class="slide_arrow" id="slide_arrow1"></div>
			<div class="slide_arrow" id="slide_arrow2"></div>
		</div>
	</div> <!-- End : shop_slider_wrap -->

	<div id="shop_title_wrap">
		<div id="shop_title_demo">
			<div id="shop_title">
				<p>${sdto.sName}</p>
				<p>${sdto.sCategory}</p>
			</div>
			<div id="shop_title_like">
				<img src="resources/images/shopInfo_heart_none.png">
				<button type="button">좋아요</button>
			</div>
			<div id="shop_title_line"></div>
			<div id="shop_title_scoreResult">
				<span class="shop_title_Ntxt">좋아요</span>
				<span class="shop_title_num">${reviewList.size()}</span>
				<span class="shop_title_Ntxt">후기</span>
				<span class="shop_title_num"></span>
			</div>
		</div>
	</div> <!-- End : shop_title_wrap -->

	<div id="shop_small_info_wrap">
		<ul id="shop_small_info" class="clearfix">
			<li>
				<ul id="shop_info_left">
					<li>
						<img src="resources/images/shopInfo_icon_loc.png">
						<p>${sdto.sAddr}</p>
					</li>
					<li>
						<img src="resources/images/shopInfo_icon_subway.png">
						<p>${sdto.sSubway}</p>
					</li>
					<li>
						<img src="resources/images/shopInfo_icon_phone.png">
						<p>${sdto.sPhone}</p>
					</li>
					<li>
						<img src="resources/images/shopInfo_icon_parking.png">
						<p>${sdto.sParkinglot}</p>
					</li>
					<li>
						<img src="resources/images/shopInfo_icon_terrace.png">
						<p>${sdto.sTerrace}</p>
					</li>
				</ul>
			</li>
			<li>
				<ul id="shop_info_right">
					<li>
						<img src="resources/images/shopInfo_icon_time.png">
						<div>
							<div>
								<span>평일</span>
								<span>${fn: split(sdto.sBusinesshours,"/")[0]}</span>
							</div>
							<div>
								<span>주말</span>
								<span>${fn: split(sdto.sBusinesshours,"/")[1]}</span>
							</div>
							<div>
								<span>휴무</span>
								<span>${fn: split(sdto.sBusinesshours,"/")[2]}</span>
							</div>
						</div>
					</li>
					<li>
						<span>상점 사정에 따라 예기치 못한 휴무가 발생할 수 있으며, <br> 재료 소진 시 영업시간이 마감될 수 있습니다.</span>
					</li>
				</ul>
			</li>
		</ul>
	</div> <!-- End : shop_small_info_wrap -->

	<div id="shop_menu_wrap">
		<c:set var="sMenuCategory1" value="${fn: split(sdto.sMenu1,'/')[0]}"></c:set>
		<c:set var="sC1Menu1" value="${fn: split(sdto.sMenu1,'/')[1]}"></c:set>
		<c:set var="sC1Menu2" value="${fn: split(sdto.sMenu1,'/')[2]}"></c:set>
		<c:set var="sC1Menu3" value="${fn: split(sdto.sMenu1,'/')[3]}"></c:set>
			
		<c:set var="sMenuCategory2" value="${fn: split(sdto.sMenu2,'/')[0]}"></c:set>
		<c:set var="sC2Menu1" value="${fn: split(sdto.sMenu2,'/')[1]}"></c:set>
		<c:set var="sC2Menu2" value="${fn: split(sdto.sMenu2,'/')[2]}"></c:set>
		<c:set var="sC2Menu3" value="${fn: split(sdto.sMenu2,'/')[3]}"></c:set>
		<button id="shop_menu_title" type="button">
			<p>MENU</p>
			<img src="resources/images/shopInfo_menu_down.png" title="menu_down">
		</button>
		<ul id="shop_menu_list_wrap" class="clearfix">
			<li>
				<ul id="shop_menu_list01">
					<li>
						<img src="resources/images/shopInfo_menu_title.png" title="menu_title">
						<p class="shop_menuTitle">${sMenuCategory1}</p>
					</li>
					<li class="shop_menu_wrap clearfix">
						<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
						<p class="shop_menuName">${fn: split(sC1Menu1,':')[0]}</p>
						<p class="shop_menuInfo">${fn: split(sC1Menu1,':')[1]}</p>
						<p class="shop_menuPrice"><fmt:formatNumber value="${fn: split(sC1Menu1,':')[2]}" type="currency" /></p>
					</li>
					<li class="shop_menu_wrap clearfix">
						<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
						<p class="shop_menuName">${fn: split(sC1Menu2,':')[0]}</p>
						<p class="shop_menuInfo">${fn: split(sC1Menu2,':')[1]}</p>
						<p class="shop_menuPrice"><fmt:formatNumber value="${fn: split(sC1Menu2,':')[2]}" type="currency" /></p>
					</li>
					<li class="shop_menu_wrap clearfix">
						<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
						<p class="shop_menuName">${fn: split(sC1Menu3,':')[0]}</p>
						<p class="shop_menuInfo">${fn: split(sC1Menu3,':')[1]}</p>
						<p class="shop_menuPrice"><fmt:formatNumber value="${fn: split(sC1Menu3,':')[2]}" type="currency" /></p>
					</li>
				</ul>
			</li>
			<li id="shop_menu_line"></li>
			<li>
				<ul id="shop_menu_list02">
					<li>
						<img src="resources/images/shopInfo_menu_title.png" title="menu_title">
						<p class="shop_menuTitle">${sMenuCategory2}</p>
					</li>
					<li class="shop_menu_wrap clearfix">
						<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
						<p class="shop_menuName">${fn: split(sC2Menu1,':')[0]}</p>
						<p class="shop_menuInfo">${fn: split(sC2Menu1,':')[1]}</p>
						<p class="shop_menuPrice"><fmt:formatNumber value="${fn: split(sC1Menu2,':')[2]}" type="currency" /></p>
					</li>
					<li class="shop_menu_wrap clearfix">
						<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
						<p class="shop_menuName">${fn: split(sC2Menu2,':')[0]}</p>
						<p class="shop_menuInfo">${fn: split(sC2Menu2,':')[1]}</p>
						<p class="shop_menuPrice"><fmt:formatNumber value="${fn: split(sC2Menu2,':')[2]}" type="currency" /></p>
					</li>
					<li class="shop_menu_wrap clearfix">
						<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
						<p class="shop_menuName">${fn: split(sC2Menu3,':')[0]}</p>
						<p class="shop_menuInfo">${fn: split(sC2Menu3,':')[1]}</p>
						<p class="shop_menuPrice"><fmt:formatNumber value="${fn: split(sC2Menu3,':')[2]}" type="currency" /></p>
					</li>
				</ul>
			</li>
		</ul>
		<button id="shop_menu_up" type="button">
			<img src="resources/images/shopInfo_menu_up.png" title="menu_up">
		</button>
	</div> <!-- End : shop_menu_wrap -->

	<div id="shop_map_wrap">
		<!-- 네이버 지도 api -->
	  	<input Type="hidden" value="${saddr}" id="sAddr">
		<div id="map" style="maxWidth:650px;height:230px;"></div>
		<script type="text/javascript">
		var map = new naver.maps.Map('map');
		var myaddress = document.getElementById("sAddr").value;// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		console.log(myaddress);
		naver.maps.Service.geocode({address: myaddress}, function(status, response) {
		    if (status !== naver.maps.Service.Status.OK) {
		        return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
		    }
		    var result = response.result;
		    // 검색 결과 갯수: result.total
		    // 첫번째 결과 결과 주소: result.items[0].address
		    // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
		    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
		    map.setCenter(myaddr); // 검색된 좌표로 지도 이동
		    // 마커 표시
		    var marker = new naver.maps.Marker({
		      position: myaddr,
		      map: map
		    });
		    // 마커 클릭 이벤트 처리
		    naver.maps.Event.addListener(marker, "click", function(e) {
		      if (infowindow.getMap()) {
		          infowindow.close();
		      } else {
		          infowindow.open(map, marker);
		      }
		    });
		});
		</script>	
	</div> <!-- End : shop_map_wrap -->

		<div id="shop_review_wrap">
		
			<p id="shop_review_title" >REVIEW</p>
			<c:if test='${empty loginInfo }'>
				<p style='text-align:center'>리뷰를 남기려면 로그인이 필요합니다.</p>
			</c:if>
			<c:if test='${!empty loginInfo}'>
				<form id="reviewWriteForm" action='reviewWrite' method='post' accept-charset='UTF-8'>
					<!-- 댓글 키워드 클릭하기 -->
					<div id="shop_review_cate_wrap">
				
						<div id="shop_category01" class="shop_category">
							<div id="shop_cate_btn01" class="shop_cate_btn">
								<p>목적</p>
								<div class="shop_cate_icon">
									<span></span>
									<span></span>
									<span></span>
								</div>
							</div>
							<ul id="shop_list01" class="shop_list clearfix">
								<li class="clearfix">
									<button type="button" class='category' data-keyword="식사" >식사</button>
									<div class="keyword_good_bg">
										<input type="checkbox" name="favorKeywords" value="good/식사" class="meal" id="keyword_good_user01">
										<label for="keyword_good_user01" class="reviewKeyword_good"></label>
									</div>
									<div class="keyword_bad_bg ">
										<input type="checkbox" name="favorKeywords" value="bad/식사" class="meal" id="keyword_bad_user01">
										<label for="keyword_bad_user01" class="reviewKeyword_bad"></label>
									</div>
								</li>
							 	<li class="clearfix">
									<button type="button" class='category' data-keyword="회식" >회식</button>
									<div class="keyword_good_bg">
										<input type="checkbox" name="favorKeywords" value="good/회식" id="keyword_good_user02">
										<label for="keyword_good_user02" class="reviewKeyword_good"></label>
									</div>
									<div class="keyword_bad_bg">
										<input type="checkbox" name="favorKeywords" value="bad/회식" id="keyword_bad_user02">
										<label for="keyword_bad_user02" class="reviewKeyword_bad"></label>
									</div>
								</li>
								<li>
									<button type="button" class='category' data-keyword="데이트" >데이트</button>
									<div class="keyword_good_bg">
										<input type="checkbox" name="favorKeywords" value="good/데이트" id="keyword_good_user03">
										<label for="keyword_good_user03" class="reviewKeyword_good"></label>
									</div>
									<div class="keyword_bad_bg">
										<input type="checkbox" name="favorKeywords" value="bad/데이트" id="keyword_bad_user03">
										<label for="keyword_bad_user03" class="reviewKeyword_bad"></label>
									</div>
								</li>
								<li>
									<button type="button" class='category' data-keyword="파티" >파티</button>
									<div class="keyword_good_bg">
										<input type="checkbox" name="favorKeywords" value="good/파티" id="keyword_good_user04">
										<label for="keyword_good_user04" class="reviewKeyword_good"></label>
									</div>
									<div class="keyword_bad_bg">
										<input type="checkbox" name="favorKeywords" value="bad/파티" id="keyword_bad_user04">
										<label for="keyword_bad_user04" class="reviewKeyword_bad"></label>
									</div>
								</li>
							 	<li class="clearfix">
									<button type="button" class='category' data-keyword="혼자" >혼자</button>
									<div class="keyword_good_bg">
										<input type="checkbox" name="favorKeywords" value="good/혼자" id="keyword_good_user05">
										<label for="keyword_good_user05" class="reviewKeyword_good"></label>
									</div>
									<div class="keyword_bad_bg">
										<input type="checkbox" name="favorKeywords" value="bad/혼자" id="keyword_bad_user05">
										<label for="keyword_bad_user05" class="reviewKeyword_bad"></label>
									</div>
								</li>
							 	<li class="clearfix">
									<button type="button" class='category' data-keyword="간단한" >간단한</button>
									<div class="keyword_good_bg">
										<input type="checkbox" name="favorKeywords" value="good/간단한" id="keyword_good_user06">
										<label for="keyword_good_user06" class="reviewKeyword_good"></label>
									</div>
									<div class="keyword_bad_bg">
										<input type="checkbox" name="favorKeywords" value="bad/간단한" id="keyword_bad_user06">
										<label for="keyword_bad_user06" class="reviewKeyword_bad"></label>
									</div>
								</li>
								<li>
									<button type="button" class='category' data-keyword="둘이서" >둘이서</button>
									<div class="keyword_good_bg">
										<input type="checkbox" name="favorKeywords" value="good/둘이서" id="keyword_good_user07">
										<label for="keyword_good_user07" class="reviewKeyword_good"></label>
									</div>
									<div class="keyword_bad_bg">
										<input type="checkbox" name="favorKeywords" value="bad/둘이서" id="keyword_bad_user07">
										<label for="keyword_bad_user07" class="reviewKeyword_bad"></label>
									</div>
								</li>
								<li>
									<button type="button" class='category' data-keyword="갬성" >갬성</button>
									<div class="keyword_good_bg">
										<input type="checkbox" name="favorKeywords" value="good/갬성" id="keyword_good_user08">
										<label for="keyword_good_user08" class="reviewKeyword_good"></label>
									</div>
									<div class="keyword_bad_bg">
										<input type="checkbox" name="favorKeywords" value="bad/갬성" id="keyword_bad_user08">
										<label for="keyword_bad_user08" class="reviewKeyword_bad"></label>
									</div>
								</li>
							</ul>
						</div>
						
						<div id="shop_category02" class="shop_category">
							<div id="shop_cate_btn02" class="shop_cate_btn">
								<p>기분</p>
								<div class="shop_cate_icon">
									<span></span>
									<span></span>
									<span></span>
								</div>
							</div>
							<ul id="shop_list02" class="shop_list clearfix">
								<li><button type="button">기분A</button></li>
							 	<li><button type="button">기분B</button></li>
							 	<li><button type="button">기분C</button></li>
							 	<li><button type="button">기분D</button></li>
							 	<li><button type="button">기분E</button></li>
							 	<li><button type="button">기분F</button></li>
							 	<li><button type="button">기분G</button></li>
							 	<li><button type="button">기분H</button></li>
							</ul>
						</div>
						
						<div id="shop_category03" class="shop_category">
							<div id="shop_cate_btn03" class="shop_cate_btn">
								<p>종류</p>
								<div class="shop_cate_icon">
									<span></span>
									<span></span>
									<span></span>
								</div>
							</div>
							<ul id="shop_list03" class="shop_list clearfix">
								<li><button type="button">종류A</button></li>
							 	<li><button type="button">종류B</button></li>
							 	<li><button type="button">종류C</button></li>
							 	<li><button type="button">종류D</button></li>
							 	<li><button type="button">종류E</button></li>
							 	<li><button type="button">종류F</button></li>
							 	<li><button type="button">종류G</button></li>
							 	<li><button type="button">종류H</button></li>
							</ul>
						</div>
						
					</div> <!-- End : shop_cate_wrap -->
					
					<!-- 키워드 결과 -->
					<div id="shop_review_result_keyword" class="clearfix">
					</div> <!-- End : shop_review_result_keyword -->
					
					<!-- 댓글 쓰기 -->
					<div id="shop_review_user_write" class="clearfix">
						<img src="resources/images/shopInfo_userImg.png" title="userIcon">
						<p id="shop_review_userId">${loginInfo.mName}</p>
						<input type="text" id='review_write_form' name="reviewContent" value="" required>
						<input type="hidden" name="mName" value="${loginInfo.mName}" id='loginInfo'>
		  				<input type="hidden" name="sCode" value="${sInfo.sCode}">
						<button type='submit' id='reviewSubmit'>확인</button>
					</div> <!-- End : shop_review_user_write -->
				</form>
			</c:if>
		
		<!-- 다른 사용자가 쓴 댓글 -->
		<div id="shop_user_allReview_wrap" >
			<div class="lists" id='myReview'>
				<!-- 내가 쓴 댓글 -->
				<div id="shop_review_my_write_wrap" class="lists__item js-load">
					<c:forEach var='review' items='${reviewList }'>
						<c:if test='${review.mName eq loginInfo.mName }'>
							<div id="shop_review_my_write">
								<div class="myText clearfix">
									<img src="resources/images/shopInfo_userImg.png" title="userIcon">
									<p class="shop_review_myUserId">${loginInfo.mName}</p>
									<p id='allReview_my_rvContent'_class="shop_review_myUsers_write">${review.rvContent }</p>
									<button type="button" id='shop_review_delete' class="shop_review_delete"
									data-rvNum='${review.rvNum }' data-sCode='${review.sCode }' 
									data-mName='${review.mName }'>삭제</button>
									<button type="button" id='shop_review_update' class="shop_review_update">수정</button>
								</div>
								
								<div class="myChoice clearfix">
									<c:forEach var="score" items="${scoreList }">
										<c:if test='${review.mName eq score.mName }'>
											<div>
												<p id="review_my_keyword_txt">${score.keyword }</p>
												<c:if test='${score.good == 1 }'>
													<div id="review_other_keyword01_img"><img src="resources/images/shopInfo_review_OUgood.png"></div>
												</c:if>
												<c:if test='${score.bad == 1 }'>
													<div id="review_other_keyword01_img"><img src="resources/images/shopInfo_review_OUbad.png"></div>
												</c:if>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div> <!-- End : shop_review_my_write -->
				<c:forEach var='review' items='${reviewList }'>
					<c:if test='${review.mName ne loginInfo.mName }'>
						<div id="shop_review_otherUsers" class="lists__item js-load">
							<div class="otherUserText clearfix">
								<img src="resources/images/shopInfo_userImg.png" title="OtherUsersIcon">
								<p class="shop_review_otherUserId">${review.mName }</p>
								<p class="shop_review_otherUsers_write">${review.rvContent }</p>
								<button type="button" class="shop_review_report">신고</button>
							</div>
							
							<div class="otherUserChoice clearfix">
								<c:forEach var="score" items="${scoreList }">
									<c:if test='${review.mName eq score.mName }'>
										<div>
											<p id="review_my_keyword_txt">${score.keyword }</p>
											<c:if test='${score.good == 1 }'>
												<div id="review_other_keyword01_img"><img src="resources/images/shopInfo_review_OUgood.png"></div>
											</c:if>
											<c:if test='${score.bad == 1 }'>
												<div id="review_other_keyword01_img"><img src="resources/images/shopInfo_review_OUbad.png"></div>
											</c:if>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div> <!-- End : shop_review_otherUsers -->
					</c:if>
				</c:forEach>
			</div> <!-- End : shop_user_allReview_wrap -->
			
			<div id="js-btn-wrap" class="btn-wrap">
				<button type="button" id="shopReviewListMoreBtn">
					<img src="resources/images/shopInfo_review_more.png" title="더보기">
				</button>
			</div>
			
		</div> <!-- End : js-load -->
	</div> <!-- End : shop_review_wrap -->
	
</div> <!-- End : shop_member_view_wrap -->