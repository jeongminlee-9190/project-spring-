var map = new naver.maps.Map('map');
var myaddress = document.getElementById("sAddr").value;// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
naver.maps.Service.geocode({address: myaddress}, function(status, response) {
	if (status !== naver.maps.Service.Status.OK) {
		return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
	}
	var result = response.result;
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