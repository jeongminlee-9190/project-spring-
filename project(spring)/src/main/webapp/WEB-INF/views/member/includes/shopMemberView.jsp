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
<div id="slider_wrap">
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
</div>

<div id="shop_title_wrap">
	<p id="shop_title">${sdto.sName}</p>
	<p id="shop_subTitle">${sdto.sCategory}</p>
	<div>
		<img src="">
		<p>좋아요</p>
	</div>
	<div id="shop_title_line"></div>
	<span class="shop_title_Ntxt">좋아요</span><span class="shop_title_num">${sdto.sLike}</span>
	<span class="shop_title_Ntxt">후기</span><span class="shop_title_num">${sdto.sLike}</span>
</div>

<div id="shop_Sinfo_wrap">
	<ul>
		<li>
			<img src="resources/images/shopInfo_icon_loc.png">
			<span>${sdto.sAddr}</span>
		</li>
		<li>
			<img src="resources/images/shopInfo_icon_subway.png">
			<span>${sdto.sSubway}</span>
		</li>
		<li>
			<img src="resources/images/shopInfo_icon_phone.png">
			<span>${sdto.sPhone}</span>
		</li>
		<li>
			<img src="resources/images/shopInfo_icon_parking.png">
			<span>${sdto.sParkinglot}</span>
		</li>
		<li>
			<img src="resources/images/shopInfo_icon_terrace.png">
			<span>${sdto.sTerrace}</span>
		</li>
		<li>
			<img src="resources/images/shopInfo_icon_time.png">
			<span>평일</span>
			<span>${fn: split(sdto.sBusinesshours,"/")[0]}</span>
			<span>주말</span>
			<span>${fn: split(sdto.sBusinesshours,"/")[1]}</span>
			<span>휴무</span>
			<span>${fn: split(sdto.sBusinesshours,"/")[2]}</span>
		</li>
		<li>
			<span>상점 사정에 따라 예기치 못한 휴무가 발생할 수 있으며, 재료 소진 시 영업시간이 마감될 수 있습니다.</span>
		</li>
	</ul>
</div>

<div id="shop_menu_wrap">
	<c:set var="sMenuCategory1" value="${fn: split(sdto.sMenu1,'/')[0]}"></c:set>
	<c:set var="sC1Menu1" value="${fn: split(sdto.sMenu1,'/')[1]}"></c:set>
	<c:set var="sC1Menu2" value="${fn: split(sdto.sMenu1,'/')[2]}"></c:set>
	<c:set var="sC1Menu3" value="${fn: split(sdto.sMenu1,'/')[3]}"></c:set>
		
	<c:set var="sMenuCategory2" value="${fn: split(sdto.sMenu2,'/')[0]}"></c:set>
	<c:set var="sC2Menu1" value="${fn: split(sdto.sMenu2,'/')[1]}"></c:set>
	<c:set var="sC2Menu2" value="${fn: split(sdto.sMenu2,'/')[2]}"></c:set>
	<c:set var="sC2Menu3" value="${fn: split(sdto.sMenu2,'/')[3]}"></c:set>
	<button>
		MENU
		<img src="resources/images/shopInfo_menu_down.png" title="menu_down">
	</button>
	<ul>
		<li>
			<ul>
				<li>
					<img src="resources/images/shopInfo_menu_title.png" title="menu_title">
					<p>${sMenuCategory1}</p>
				</li>
				<li>
					<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
					<span>${fn: split(sC1Menu1,':')[0]}</span>
					<span>${fn: split(sC1Menu1,':')[1]}</span>
					<span><fmt:formatNumber value="${fn: split(sC1Menu1,':')[2]}" type="currency" /></span>
				</li>
				<li>
					<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
					<span>${fn: split(sC1Menu2,':')[0]}</span>
					<span>${fn: split(sC1Menu2,':')[1]}</span>
					<span><fmt:formatNumber value="${fn: split(sC1Menu2,':')[2]}" type="currency" /></span>
				</li>
				<li>
					<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
					<span>${fn: split(sC1Menu3,':')[0]}</span>
					<span>${fn: split(sC1Menu3,':')[1]}</span>
					<span><fmt:formatNumber value="${fn: split(sC1Menu3,':')[2]}" type="currency" /></span>
				</li>
			</ul>
		</li>
		<li>
			<ul>
				<li>
					<img src="resources/images/shopInfo_menu_title.png" title="menu_title">
					<p>${sMenuCategory2}</p>
				</li>
				<li>
					<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
					<span>${fn: split(sC2Menu1,':')[0]}</span>
					<span>${fn: split(sC2Menu1,':')[1]}</span>
					<span><fmt:formatNumber value="${fn: split(sC1Menu2,':')[2]}" type="currency" /></span>
				</li>
				<li>
					<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
					<span>${fn: split(sC2Menu2,':')[0]}</span>
					<span>${fn: split(sC2Menu2,':')[1]}</span>
					<span><fmt:formatNumber value="${fn: split(sC2Menu2,':')[2]}" type="currency" /></span>
				</li>
				<li>
					<img src="resources/images/shopInfo_menu_list.png" title="${fn: split(sC1Menu1,':')[0]}">
					<span>${fn: split(sC2Menu3,':')[0]}</span>
					<span>${fn: split(sC2Menu3,':')[1]}</span>
					<span><fmt:formatNumber value="${fn: split(sC2Menu3,':')[2]}" type="currency" /></span>
				</li>
			</ul>
		</li>
		<li>
			<button>
				<img src="resources/images/shopInfo_menu_up.png" title="menu_up">
			</button>
		</li>
	</ul>
</div>

<div id="shop_map_wrap">
	<!-- 네이버 지도 api -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ip9MzYUcGqHV9etI8TeJ&submodules=geocoder"></script>
  	<input Type="hidden" value="${saddr}" id="sAddr">
	<div id="map" style="maxWidth:650px;height:230px;"></div>
	<script>
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
</div>

<div id="shop_review_wrap">
	<div id="review_title">REVIEW</div>
	<div id="shop_cate_wrap">

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
				<li>
					<button type="button" class='category'>
						식사
					</button>
					<div>
						<button>
							<img src="resources/images/shopInfo_review_LBtn_good.png" title="good">
						</button>
						<button>
							<img src="resources/images/shopInfo_review_RBtn_bad.png" title="bad">
						</button>
					</div>
				</li>
			 	<li><button type="button" class='category'>회식</button></li>
			 	<li><button type="button" class='category'>데이트</button></li>
			 	<li><button type="button" class='category'>파티</button></li>
			 	<li><button type="button" class='category'>목적E</button></li>
			 	<li><button type="button" class='category'>목적F</button></li>
			 	<li><button type="button" class='category'>목적G</button></li>
			 	<li><button type="button" class='category'>목적H</button></li>
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
		
	</div>
</div>

</div>