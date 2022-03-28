<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<style>
        .box1{
            border: 2px solid red; padding: 10px;
        }
        .map, .contents{
            height: 700px; box-sizing: border-box; border: 2px solid blue; width: calc((100% - 5px) / 2); float: left;
        }
        .map{width: 870px;}
        .contents{
            border-color:#0f0; width:210px; float: right;
        }
        .box1::after{
            clear: both; content: ''; display: block;
        }
        .contents-top{
        	 width: 210px; height:fit-context; background-color: yellow; height:
        }
        .day{
        magin-right: 3px;}
    </style>
</head>
<body>
    <div class="box1">
        <div class="map" id="map-section">
        <%@ include file="map.jsp" %>
        </div>
        <form class="input" action="<%=request.getContextPath()%>/course/register" method="post" enctype="multipart/form-data">
	        <!-- 상세설정 -->
	        <div class="contents">
	        	<div class="contents-top">
		            <input id="title" type="text" name="course_title" placeholder="코스 제목을 입력해주세요.">
		            <div class="form-group">
		            <select name="option" class="select box">
						<option value="default">공개범위</option>
						<option value="public">전체공개</option>
						<option value="private">비공개</option>
					</select>
					</div>
					<!-- 메인 카테고리 예제 했던것 처럼 구현하기 -->
					<select class="city">
						<option>전체지역</option>
					</select>
					<select name="type" class="select box">
						<option value="default">전체분야</option>
						<option value="public">관광지</option>
						<option value="private">음식점</option>
						<option value="private">숙소</option>
					</select>
					<div class="daterange">
						<label>여행 기간</label>
			            <input type="text" name="duration" id="date">
		            </div>
		            	<label>함께할 친구 추가</label>
		            	<div id="mate-box">
		            	<input type="text"> 
		            	</div>
		            	<div id="recruit-box">
			             <input type="checkbox" value="" id="defaultCheck1">
  						 	<label class="check-label" for="defaultCheck1">
						    친구 모집
						  	</label>
			            </div>
		           <label>세부 일정</label>
		            <div id="btn-group-day">
		            	<div id="control-btn">
			            <button type="button"  id="add-day">추가</button>
			            <button type="button"  id="remove-day">삭제</button>
			            </div>
			            <div id="day-btn">
			            <button type="button" id="first-day" class="added-day">1일차</button>
			            </div>
		            </div>  
				</div>
	        </div>
	        <!-- 장소 추가 되는 곳 -->
	        	<div class="contents-bottom">
	        	
	        	</div>
	       <button class="btn btn-outline-success" id="btn">등록</button>
	     </form>
        
    </div>
    
<script>


//date range picker
$(function () {
    $('#date').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate": new Date(),
        "endDate": new Date(),
        "drops": "down"
    }, 
    function (start, end, label) {
        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
});


$(document).ready(function() {
	//일 추가
  $("#add-day").click(function() {
    $("#day-btn").append("<button class='added-day days' type='button'>"+i+"일차"+"</button>");
    numbering();
  });
	
	//일 삭제
  	$("#remove-day").click(function() {
	    $(".days:last-child").remove();
	    numbering();
	});
	

function numbering(){
	$('.added-day').each(function(index){
		$(this).text(index+1+'일차');
	})  
}

setCity();
//지역 설정
function setCity(){
	var str = '<option value="0">전체지역</option>';
	$.ajax({
		async:false,
		type:'get',
		url: '<%=request.getContextPath()%>/city',
		dataType:"json",
		success : function(res){
			console.log(res)
			var list = res.list;
			for(city of list){
			str +=  '<option value="'+city.city_id+'">'+city.city_name+'</option>'
			}
			$('.city').html(str);
		}
	});
}

});




</script>
</body>
</html>