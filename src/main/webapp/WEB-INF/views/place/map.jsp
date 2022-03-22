<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#map-button{margin:auto;
        display:block;
        margin-top: 30px;}
</style>
</head>
<body>
<div class="container">
	<div id="map" style="width:1080px;height:700px;"></div>
	<div class="button">
		<a href="<%=request.getContextPath()%>/place/list?main_id=${pm.criteria.main_id }">
			<button type="button" class="btn btn-info" id="map-button" >목록 보기</button>
		</a>
	</div>
</div>


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
		/*
		var positions = [
		    {
		        title: '카카오', 
		        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        title: '생태연못', 
		        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        title: '텃밭', 
		        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        title: '근린공원',
		        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		    },
		    {
		        title: '백운목장',
		        latlng: new kakao.maps.LatLng(34.940116,  127.7006108)
		    }
		    
		];
		*/
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
	
	</script>
</body>
</html>