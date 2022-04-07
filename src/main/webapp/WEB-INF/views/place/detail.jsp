<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
h1{text-align:center;}
img{width: 500px; height: 500px;}
.contents{border: 2px solid red; padding: 10px;}
.text-box, .img-box{height: 500px; 
box-sizing: border-box; 
border: 2px solid blue; 
width: calc((100% - 5px) / 2); 
float: left;}
.text-box{border-color:#0f0; float: right; height: fit-content; }
.contents::after{ clear: both; content: ''; display: block;}
.btn{margin:auto; display:block;}
.map{margin-top: 10px;}
#btn-list{margin-left: 1015px; margin-bottom: 10px;}
</style>

</head>
<body>
<div class="body">
	<div class="container">
		<h1>${place.typeTitle}</h1>
		<div class="list-btn">
		<a href="<%=request.getContextPath()%>/place/list?main_id=${place.main_id}">
			<button class="btn btn-outline-info" id="btn-list">목록 보기</button>
		</a>
		</div>
		<div class="contents">
			<div class="img-box">
				<img src="https://live.staticflickr.com/8698/17076174837_47bb57ed65_b.jpg" alt="이미지">
			</div>
			<div class="text-box">
				<div class="info-box">
					<h4>${place.name }</h4>
					<i class="bi bi-geo-alt-fill">주소</i><p>${place.address1 }</p>
					<c:if test="${place.tel != null}">
						<i class="bi bi-telephone-fill">전화번호</i><p>${place.tel }</p>					      	  
					</c:if>
					<i class="bi bi-globe">홈페이지</i><p><a href="${place.homepage }" target="_blank">${place.homepage }</a></p>
					<c:if test="${place.holiday != null}">
						<i class="bi bi-clock-fill">휴일</i><p>${place.holiday }</p>
					</c:if>
					<c:if test="${place.parking != null}">
						<i class="bi bi-check-all">주차 이용</i><p>${place.parking }</p>
					</c:if>
					<c:if test="${place.landmark != null}">
						<i class="bi bi-signpost-split-fill">주변 여행지</i><p>${place.landmark }</p>
					</c:if>
				</div>
				<div class="btn">
					<div class="btn-group">
						<button class="btn btn-outline-info"><i class="bi bi-heart"></i> 좋아요</button>
					</div>
					<div class="btn-group">
						<button class="btn btn-outline-info"><i class="bi bi-bookmark-star"></i> 찜</button>
					</div>
				</div>
			</div>
		</div>
		<!-- map -->
		<h3 class="map">지도 보기</h3>
		<div id="map" style="width:100%;height:350px;"></div>
		
	</div>
</div>
</body>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44e185ba8590a8162cff60db78eccad0&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var mapOption = {
	center: new kakao.maps.LatLng(${place.latitude},${place.longitude}), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(mapContainer, mapOption);  //지도 생성 및 객체 리턴

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${place.latitude},${place.longitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">${place.name} <br><a href="https://map.kakao.com/link/to/${place.name},${place.latitude},${place.longitude}" style="color:blue" target="_blank">길 찾기</a> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(${place.latitude},${place.longitude}); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
</html>