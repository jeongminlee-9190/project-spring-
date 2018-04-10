<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
	<div class="container-fluid sbasicInfo">
		<c:set var="sdto" value="${sInfo}"></c:set>
		<c:set var="saddr" value="${sInfo.sAddr}"></c:set>
		<c:set var="simage" value="${sInfo.sImage}"></c:set>
		<!-- 상점명, 좋아요 개수, 후기 개수, 메뉴 보기 버튼, 상점정보 보기 버튼 -->
		<div class="row">
			<span class="sName">${sdto.sName}</span>
			<table class="sbasicInfo_tbl1">
				<colgroup>
		       		<col width="15%"></col>
		       		<col width="15%"></col>
		       		<col width="15%"></col>
		       	</colgroup>
				<tr>
					<td align="center">${sdto.sCategory}</td>
					<td align="center">좋아요</td>
					<td align="center">후기</td>
				</tr>
				<tr>
					<td></td>
					<td align="center">${sdto.sLike}</td>
					<td align="center">0</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container-fluid sInfo">
		<div class="row">
			<div class="panel panel-default Info1">
				<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#info1"><h3 class="panel-title">상점 기본 정보</h3><a></div>
				<div id="info1" class="panel-collapse collapse in">
					<div class="panel-body">
						<div class="col-sm-6">
							<span class="span_Info1">주소 </span>${sdto.sAddr}<br>
							<span class="span_Info1">지하철역 </span>${sdto.sSubway}<br><br>
							<span class="span_Info1">전화 </span>${sdto.sPhone}<br><br>
							<span class="span_Info1">영업시간 </span><br>
							평일)  ${fn: split(sdto.sBusinesshours,"/")[0]} &nbsp;&nbsp;&nbsp;&nbsp;
							주말) ${fn: split(sdto.sBusinesshours,"/")[1]} &nbsp;&nbsp;&nbsp;&nbsp;
							휴무)  ${fn: split(sdto.sBusinesshours,"/")[2]}<br>
		  					<span class="span_warn">상점 사정에 따라 예기치 못한 휴무가 발생할 수 있으며,</span><br>
		  					<span class="span_warn">재료 소진 시 영업시간이 마감될 수 있습니다.</span><br><br>
							<span class="span_Info1">테라스 </span>${sdto.sTerrace} &nbsp;&nbsp;&nbsp;&nbsp;    
							<span class="span_Info1">주차 </span>${sdto.sParkinglot}<br>
						</div>
						<div class="col-sm-6">
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
					</div>
				</div><!-- collapse -->
			</div><!-- pannel -->
		</div><!-- end of row -->
		<div class="row">
			<div class="panel panel-default menu">
				<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#image"><h3 class="panel-title">사진</h3><a></div>
				<div id="image" class="panel-collapse collapse">
					<div class="panel-body">
						<c:if test="${!empty fn: split(sdto.sImage,'/')[0]}"> 
							<a href="resources/images/${fn: split(sdto.sImage,'/')[0]}"><img class="img-rounded image1" src="resources/images/${fn: split(sdto.sImage,'/')[0]}"></a>
						</c:if>
						<c:if test="${!empty fn: split(sdto.sImage,'/')[1]}">
							<a href="resources/images/${fn: split(sdto.sImage,'/')[1]}"><img class="img-rounded image2" src="resources/images/${fn: split(sdto.sImage,'/')[1]}"></a>
						</c:if>
						<c:if test="${!empty fn: split(sdto.sImage,'/')[2]}">
							<img class="img-rounded image3" src="resources/images/${fn: split(sdto.sImage,'/')[2]}">
						</c:if>
						<c:if test="${!empty fn: split(sdto.sImage,'/')[3]}">
							<img class="img-rounded image4" src="resources/images/${fn: split(sdto.sImage,'/')[3]}">
						</c:if>
						<c:if test="${!empty fn: split(sdto.sImage,'/')[4]}">
							<img class="img-rounded image5" src="resources/images/${fn: split(sdto.sImage,'/')[4]}">
						</c:if>
					</div>
				</div><!-- collapse -->
			</div><!-- pannel -->
		</div><!-- end of row -->
		
		<div class="row">
			<div class="panel panel-default menu">
				<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#menu"><h3 class="panel-title">메뉴</h3><a></div>
				<div id="menu" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="col-sm-6">
							<c:set var="sMenuCategory1" value="${fn: split(sdto.sMenu1,'/')[0]}"></c:set>
							<c:set var="sC1Menu1" value="${fn: split(sdto.sMenu1,'/')[1]}"></c:set>
							<c:set var="sC1Menu2" value="${fn: split(sdto.sMenu1,'/')[2]}"></c:set>
							<c:set var="sC1Menu3" value="${fn: split(sdto.sMenu1,'/')[3]}"></c:set>
								
							<c:set var="sMenuCategory2" value="${fn: split(sdto.sMenu2,'/')[0]}"></c:set>
							<c:set var="sC2Menu1" value="${fn: split(sdto.sMenu2,'/')[1]}"></c:set>
							<c:set var="sC2Menu2" value="${fn: split(sdto.sMenu2,'/')[2]}"></c:set>
							<c:set var="sC2Menu3" value="${fn: split(sdto.sMenu2,'/')[3]}"></c:set>
							
							
							<div class="row">
								<div class="col-sm-6">
									<h4>-${sMenuCategory1}-</h4>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<p>메뉴명</p>
									${fn: split(sC1Menu1,':')[0]}<br>
									${fn: split(sC1Menu2,':')[0]}<br>
									${fn: split(sC1Menu3,':')[0]}<br>
								</div>
								<div class="col-sm-5">
									<p>메뉴 설명</p>
									${fn: split(sC1Menu1,':')[1]}<br>
									${fn: split(sC1Menu2,':')[1]}<br>
									${fn: split(sC1Menu3,':')[1]}<br>
								</div>
								<div class="col-sm-2">
									<p>가격</p>
									<fmt:formatNumber value="${fn: split(sC1Menu1,':')[2]}" type="currency" /><br>
									<fmt:formatNumber value="${fn: split(sC1Menu2,':')[2]}" type="currency" /><br>
									<fmt:formatNumber value="${fn: split(sC1Menu3,':')[2]}" type="currency" /><br> 
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="row">
								<div class="col-sm-6">
									<h4>-${sMenuCategory2}-</h4>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<p>메뉴명</p>
									${fn: split(sC2Menu1,':')[0]}<br>
									${fn: split(sC2Menu2,':')[0]}<br>
									${fn: split(sC2Menu3,':')[0]}
								</div>
								<div class="col-sm-5">
									<p>메뉴 설명</p>
									${fn: split(sC2Menu1,':')[1]}<br>
									${fn: split(sC2Menu2,':')[1]}<br>
									${fn: split(sC2Menu3,':')[1]}<br>
								</div>
								<div class="col-sm-2">
									<p>가격</p>
									<fmt:formatNumber value="${fn: split(sC2Menu1,':')[2]}" type="currency" /><br>
									<fmt:formatNumber value="${fn: split(sC2Menu2,':')[2]}" type="currency" /><br>
									<fmt:formatNumber value="${fn: split(sC2Menu3,':')[2]}" type="currency" /><br> 
								</div>
							</div>
						</div>
					</div>
				</div><!-- collapse -->
			</div><!-- pannel -->
		</div>
		
		<div class="row">
			<div class="panel panel-default menu">
				<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#reservation"><h3 class="panel-title">예약</h3><a></div>
				<div id="reservation" class="panel-collapse collapse">
					<div class="panel-body">
					예약.....
					</div>
				</div><!-- collapse -->
			</div><!-- pannel -->
		</div><!-- end of row -->
		
		<div class="row">
			<div class="panel panel-default menu">
				<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#review"><h3 class="panel-title">후기</h3><a></div>
				<div id="review" class="panel-collapse collapse">
					<div class="panel-body">
					후기.....
					</div>
				</div><!-- collapse -->
			</div><!-- pannel -->
		</div>
	</div>
