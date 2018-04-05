<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
	<link href="${pageContext.request.contextPath}/resources/css/s_view.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/so_footer.css" rel="stylesheet" >
	<title>상점 관리</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<body>
<c:if test="${!empty SoLogin}"> 
	<jsp:include page="../so/includes/soTop.jsp" flush="true"/>
	<div class="container-fluid sbasicInfo">
		<c:set var="sdto" value="${sInfo}"></c:set>
		<c:set var="saddr" value="${sInfo.sAddr}"></c:set>
		<c:set var="simage" value="${sInfo.sImage}"></c:set>
		<!-- 상점명, 좋아요 개수, 후기 개수, 메뉴 보기 버튼, 상점정보 보기 버튼 -->
		<div class="row">
			<span class="sName">${sdto.sName}</span>
			<table class="sbasicInfo_tbl1" border="1">
				<colgroup>
		       		<col width="15%"></col>
		       		<col width="15%"></col>
		       		<col width="15%"></col>
		       		<col width="50%"></col>
		       	</colgroup>
				<tr>
					<td align="center">${sdto.sCategory}</td>
					<td align="center">좋아요</td>
					<td align="center">후기</td>
					<td align="right" rowspan="2"><a href="#" class="showMask"><input type="button" class="btn_sInfoView" value="메뉴"></a>
					<a href="#" class="showMask2"><input type="button" class="btn_sInfoView" value="상점 정보"></a></td>
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
							   	 <div id="map" style="width:650px;height:230px;"></div>
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
				<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#menu"><h3 class="panel-title">메뉴</h3><a></div>
				<div id="menu" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="col-sm-12">
							<c:set var="sMenuCategory1" value="${fn: split(sdto.sMenu1,'/')[0]}"></c:set>
							<c:set var="sC1Menu1" value="${fn: split(sdto.sMenu1,'/')[1]}"></c:set>
							<c:set var="sC1Menu2" value="${fn: split(sdto.sMenu1,'/')[2]}"></c:set>
							<c:set var="sC1Menu3" value="${fn: split(sdto.sMenu1,'/')[3]}"></c:set>
								
							<c:set var="sMenuCategory2" value="${fn: split(sdto.sMenu2,'/')[0]}"></c:set>
							<c:set var="sC2Menu1" value="${fn: split(sdto.sMenu2,'/')[1]}"></c:set>
							<c:set var="sC2Menu2" value="${fn: split(sdto.sMenu2,'/')[2]}"></c:set>
							<c:set var="sC2Menu3" value="${fn: split(sdto.sMenu2,'/')[3]}"></c:set>
				       			
				       		<table>
				       			<th>-${sMenuCategory1}-</th>
				   				<td>${fn: split(sC1Menu1,':')[0]}</td>
				   				<td>${fn: split(sC1Menu1,':')[1]}</td>
				   				<td>${fn: split(sC1Menu1,':')[2]}원</td>
							</table>	
								<%-- <tr>
									<td scope="col">${fn: split(sC1Menu2,':')[0]}</td>
									<td scope="col">${fn: split(sC1Menu2,':')[1]}</td>
									<td scope="col">${fn: split(sC1Menu2,':')[2]}원</td>
								</tr>
								<tr>
									<td scope="col">${fn: split(sC1Menu3,':')[0]}</td>
									<td scope="col">${fn: split(sC1Menu3,':')[1]}</td>
									<td scope="col">${fn: split(sC1Menu3,':')[2]}원</td>
								</tr>
								
								<tr><!-- 메뉴2카테고리 -->
									<td align="left" colspan="3"><br>-${sMenuCategory2}-</td>
								</tr>
								
								<tr>
									<td scope="col">${fn: split(sC2Menu1,':')[0]}</td>
									<td scope="col">${fn: split(sC2Menu1,':')[1]}</td>
									<td scope="col">${fn: split(sC2Menu1,':')[2]}원</td>
								</tr>
								
								<tr>
									<td scope="col">${fn: split(sC2Menu2,':')[0]}</td>
									<td scope="col">${fn: split(sC2Menu2,':')[1]}</td>
									<td scope="col">${fn: split(sC2Menu2,':')[2]}원</td>
								</tr>
								<tr>
									<td scope="col">${fn: split(sC2Menu3,':')[0]}</td>
									<td scope="col">${fn: split(sC2Menu3,':')[1]}</td>
									<td scope="col">${fn: split(sC2Menu3,':')[2]}원</td>
								</tr>
							</table> --%>
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
		</div>
		
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
	
	

	
		
		
		
<!-- 메뉴 레이어 팝업  -->
	<div class="setDiv">
		<div class="mask"></div>
    	<div class="window">
       		<input type="button" href="#" class="close" value="닫기"/ >
       		<div class="imageView">
				<img class="image1" src="upload/${fn: split(sdto.sImage,'/')[0]}">
				<img class="image2" src="upload/${fn: split(sdto.sImage,'/')[1]}">
				<img class="image3" src="upload/${fn: split(sdto.sImage,'/')[2]}">
				<img class="image4" src="upload/${fn: split(sdto.sImage,'/')[3]}">
				<img class="image5" src="upload/${fn: split(sdto.sImage,'/')[4]}">
			</div>
       			
       		<c:set var="sMenuCategory1" value="${fn: split(sdto.sMenu1,'/')[0]}"></c:set>
			<c:set var="sC1Menu1" value="${fn: split(sdto.sMenu1,'/')[1]}"></c:set>
			<c:set var="sC1Menu2" value="${fn: split(sdto.sMenu1,'/')[2]}"></c:set>
			<c:set var="sC1Menu3" value="${fn: split(sdto.sMenu1,'/')[3]}"></c:set>
				
			<c:set var="sMenuCategory2" value="${fn: split(sdto.sMenu2,'/')[0]}"></c:set>
			<c:set var="sC2Menu1" value="${fn: split(sdto.sMenu2,'/')[1]}"></c:set>
			<c:set var="sC2Menu2" value="${fn: split(sdto.sMenu2,'/')[2]}"></c:set>
			<c:set var="sC2Menu3" value="${fn: split(sdto.sMenu2,'/')[3]}"></c:set>
       			
       		<table class="sMenu_tbl">
       			<colgroup>
       				<col width="25%"></col>
       				<col width="40%"></col>
       				<col width="10%"></col>
       			</colgroup>
			
				<tr><!-- 메뉴1 카테고리 -->
					<td align="left" colspan="3">-${sMenuCategory1}-</td>
				</tr>
				
				<tr>
					<td scope="col">${fn: split(sC1Menu1,':')[0]}</td>
					<td scope="col">${fn: split(sC1Menu1,':')[1]}</td>
					<td scope="col">${fn: split(sC1Menu1,':')[2]}원</td>
				</tr>
				
				<tr>
					<td scope="col">${fn: split(sC1Menu2,':')[0]}</td>
					<td scope="col">${fn: split(sC1Menu2,':')[1]}</td>
					<td scope="col">${fn: split(sC1Menu2,':')[2]}원</td>
				</tr>
				<tr>
					<td scope="col">${fn: split(sC1Menu3,':')[0]}</td>
					<td scope="col">${fn: split(sC1Menu3,':')[1]}</td>
					<td scope="col">${fn: split(sC1Menu3,':')[2]}원</td>
				</tr>
				
				<tr><!-- 메뉴2카테고리 -->
					<td align="left" colspan="3"><br>-${sMenuCategory2}-</td>
				</tr>
				
				<tr>
					<td scope="col">${fn: split(sC2Menu1,':')[0]}</td>
					<td scope="col">${fn: split(sC2Menu1,':')[1]}</td>
					<td scope="col">${fn: split(sC2Menu1,':')[2]}원</td>
				</tr>
				
				<tr>
					<td scope="col">${fn: split(sC2Menu2,':')[0]}</td>
					<td scope="col">${fn: split(sC2Menu2,':')[1]}</td>
					<td scope="col">${fn: split(sC2Menu2,':')[2]}원</td>
				</tr>
				<tr>
					<td scope="col">${fn: split(sC2Menu3,':')[0]}</td>
					<td scope="col">${fn: split(sC2Menu3,':')[1]}</td>
					<td scope="col">${fn: split(sC2Menu3,':')[2]}원</td>
				</tr>
			</table>
		</div>
	</div>
</c:if>
</body>