<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/demos/style.css">
</head>
<body>

	<div id="map" style="width: 870px; height: 700px;"></div>

  	<!-- map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44e185ba8590a8162cff60db78eccad0&libraries=services,clusterer,drawing"></script>
	<script>
	let markers = [];
	let map;
	maker(0,-1);
	var clickedOverlay = null;
	function maker(city, main_id){
		$.ajax({
			async:false,
			type:'get',
			url:'<%=request.getContextPath()%>/course/maker?city_id='+city +'&main_id='+main_id,
			dataType : 'json',
			success : function(list){
				removeMarker();
				var positions = [];
				 for(place of list){
					 var obj = {
						   title: place.name,
						   latlng: new kakao.maps.LatLng(place.latitude,place.longitude),
						   address: place.address1,
						   tel: place.tel,
						   place_id : place.place_id
					   }
					 positions.push(obj);
				 }
				 drawMap(positions)
			}
		});
	
	}
	
	
		
		
	function drawMap(positions){

		var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var mapOption = {
			center: new kakao.maps.LatLng(35.1767651, 126.8087806), //지도의 중심좌표.
			level: 10 //지도의 레벨(확대, 축소 정도)
		};
		map = new kakao.maps.Map(mapContainer, mapOption);  //지도 생성 및 객체 리턴
		
		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		//샘플
		//ajax로 DB에 모든 관광지 정보를 가져옴
		//가져온 정보를 아래 positions에 넣어줌
		//var position = [];
		/*$.ajax({
			url : '',
			async : false, 질문이 하나 더 있어요!
			저기 미리 뿌려준 버튼은 색깔이 바뀌는데 추가한 버튼은 클릭해도 색까링 안 바껴요 
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
		   
			 	//오버레이를 생성합니다
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
		    btnGroup.style.cssText = 'background: white ';
		    
		    var addBtn = document.createElement('button');
		    addBtn.innerHTML = '추가';
		    addBtn.style.cssText = 'width: calc((100% - 5px) / 2); ';
		    addBtn.onclick = function () {
		    
			   	var index = $('.added-day.clicked').data('index'); 
			   	 console.log(index);
			 		var info = document.getElementById("bottom"+index);
		   	  // form 
		   	  var forms = document.createElement('form'); 
			   	forms.name = 'list'; 
			   	forms.method = 'post'; 
			   	forms.action = 'http://localhost:8080/tour/course/register'; 
			   	forms.target = '_self'; 
			   	//div
		    	var divs = document.createElement('div');
		    	//divs.innerHTML =  data.title;
		    	divs.style.cssText = 'background-color:lavender ; cursor: move';
		    	divs.style.marginBottom='5px';
		    	// 삭제 버튼
		    	var infoClose = document.createElement('button');
			  	infoClose.innerHTML = '삭제';
			  	infoClose.style.cssText = 'background: white;'
			  	infoClose.style.marginLeft='5px';
			  	infoClose.onclick = function() {
			  		divs.remove(divs.selectedIndex);
			  	}
			  	var name = document.createElement('span');
			  	name.classList = 'name';
			  	name.innerHTML =  data.title;
			  	name.style.cssText = 'font-weight: bold';
			  	var place_id = document.createElement('input');
			  	place_id.classList = 'place_id';
			  	place_id.value = data.place_id;
			  	place_id.type = 'hidden';
			  	info.appendChild(divs);
		    	//info.appendChild(forms);
		    	//forms.appendChild(divs);
		    	divs.appendChild(name);
		    	divs.appendChild(place_id);
		    	divs.appendChild(infoClose);
		    	
		    
		 
		    };
		    
		    var closeBtn = document.createElement('button');
		    closeBtn.innerHTML = '닫기';
		    closeBtn.style.cssText = 'width: calc((100% - 5px) / 2); ';
		    closeBtn.style.marginLeft='5px';
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
		     
		    	 if (clickedOverlay) {
		    	        clickedOverlay.setMap(null);
		    	    }
		    	 		overlay.setMap(map);
		    	    clickedOverlay = overlay;
		    });
		    		markers.push(marker); 
		}
	}
	
	

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	</script>
</body>
</html>