<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="map" style="width: 870px; height: 700px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44e185ba8590a8162cff60db78eccad0&libraries=services,clusterer,drawing"></script>
	<script>
	
		var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var mapOption = {
			center: new kakao.maps.LatLng(35.1767651, 126.8087806), //지도의 중심좌표.
			level: 10 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);  //지도 생성 및 객체 리턴
		
		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		//샘플
		//ajax로 DB에 모든 관광지 정보를 가져옴
		//가져온 정보를 아래 positions에 넣어줌
		var position = [];
		/*$.ajax({
			url : '',
			async : false,
			datatype : '',
			success : function(res){
				var list = res.list;
				for(place of list){
					var obj = {
							title : place.name,
							latlng: new kakao.maps.LatLng(place.longitude, place.latitude)
					}
					position.push(obj);
				}
			}
		});*/
		
		var positions = [
			<c:forEach items="${list}" var="place">
			   {
				   title: '${place.name}',
				   latlng: new kakao.maps.LatLng(${place.latitude},${place.longitude})
			   },
		   </c:forEach>
		];
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		
		
		
		//수정 필요
		positions.forEach(function (pos) {
		    
		    // content HTMLElement 생성
		    var content = document.createElement('div');
		    var info = document.createElement('span');
		    info.appendChild(document.createTextNode(pos.title));
		    content.appendChild(info);
		    var closeBtn = document.createElement('button');
		    closeBtn.appendChild(document.createTextNode('닫기'));
		    // 닫기 이벤트 추가
		    closeBtn.onclick = function() {
		        overlay.setMap(null);
		    };
		    content.appendChild(closeBtn);
		    // customoverlay 생성, 이때 map을 선언하지 않으면 지도위에 올라가지 않습니다.
		    var overlay = new daum.maps.CustomOverlay({
		        position: pos.latlng,
		        content: content
		    });
		    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        overlay.setMap(map);
		    });
		});
	
	</script>
</body>
</html>