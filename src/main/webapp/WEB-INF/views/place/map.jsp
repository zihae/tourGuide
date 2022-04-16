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
		<a href="<%=request.getContextPath()%>/place/list?main_id=${pm.criteria.main_id}">
	    	<button type="button" class="btn btn-outline-info" id="map-button">목록 보기</button>
	    </a>
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
		
		var positions = [
			<c:forEach items="${list}" var="place">
			   {
				   title: '${place.name}',
				   latlng: new kakao.maps.LatLng(${place.latitude},${place.longitude}),
				   address: '${place.address1}',
				   tel: '${place.tel}',
				   place_id : '${place.place_id}'
			   },
		   </c:forEach>
		];
		
		for(let i=0; i < positions.length; i++){
		    var data = positions[i];
		    displayMarker(data);
		}
		
		
		// 지도에 마커를 표시하는 함수입니다    
		function displayMarker(data) { 
			 // 마커를 생성합니다
		   var marker = new kakao.maps.Marker({
	        	map: map,
	        	position: data.latlng
    		});
			 
		    var overlay = new kakao.maps.CustomOverlay({
		        yAnchor: 1,
		        position: marker.getPosition()
		    });
		    
		    var content = document.createElement('div');
		    content.innerHTML =  data.title;
		    content.style.cssText = 'background: white; border: 1px solid black';
		    
		    var address = document.createElement('div');
		    address.innerHTML =  data.address;
		    address.style.cssText = 'background: white; border: 1px solid black';
		    
		    var tel = document.createElement('div');
		    tel.innerHTML =  data.tel;
		    tel.style.cssText = 'background: white; border: 1px solid black';
		    
		    var btnGroup = document.createElement('div');
		    btnGroup.style.cssText = 'background: white; border: 1px solid black';
		    
		    var addBtn = document.createElement('button');
		    addBtn.innerHTML = '상세보기';
		    addBtn.onclick = function () {
		    	var place_id = data.place_id;
		    	location.href='<%=request.getContextPath()%>/place/detail?place_id=' +place_id;
		    };
		   
		    
		    var closeBtn = document.createElement('button');
		    closeBtn.innerHTML = '닫기';
		    closeBtn.onclick = function () {
		        overlay.setMap(null);
		    };
		    
		    content.appendChild(address);
		    address.appendChild(tel);
		    tel.appendChild(btnGroup);
		    btnGroup.appendChild(addBtn);
		    btnGroup.appendChild(closeBtn);
		    
		    overlay.setContent(content);
		    kakao.maps.event.addListener(marker, 'click', function() {
		        overlay.setMap(map);
		    });
		}
		
		
	
	</script>
</body>
</html>