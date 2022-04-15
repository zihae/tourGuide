<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
 <!-- sortable -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<!-- date range picker -->
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
.added-day{
  background-color: white;
} 
.clicked{
	background-color: gold;
}
</style>
</head>
<body>
<div class="box1">
 	<div class="map" id="map-section">
     <%@ include file="map.jsp" %>
  </div>
        
  <!-- 상세설정 -->
  <div class="contents">
      <div class="contents-top">
	        <input id="title" type="text" name="course_title" placeholder="코스 제목을 입력해주세요." class="course_title">
		      <div class="scope">
			      <select name="option" class="select box option" >
							<option value="전체공개" selected>전체공개</option>
							<option value="비공개">비공개</option>
					  </select>
					</div>
					<select class="city">
						<option>전체지역</option>
					</select>
					<form>
						<select  class="type" name="main_id">
							<option value="-1" selected>전체분야</option>
							<option value="1">관광지</option>
							<option value="2">음식점</option>
							<option value="3">숙소</option>
						</select>
					</form>
					<form>
						<div class="daterange">
							<label>여행 기간</label>
					   		<input type="text" name="duration" id="date" class="duration">
				     </div>
	           	<label>함께할 친구 추가</label>
		           	<div id="mate-box">
		           		<input type="text" name="course_mate"> 
		           	</div>
	           	<div id="recruit-box">
		           <input type="checkbox" name="recruit" class="recruit-check recruit" value="Y" >
							 	<label class="check-label" for="recruit-check">
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
		           		 	<button type="button" class="added-day clicked" data-index="1">1일차</button>
		            </div>
	           	</div>  			
						</form>
				</div>
      <!-- 장소 추가 되는 곳 -->
      <div class="bottoms">
      	<div class="contents-bottom" id="bottom1"></div>
      </div>
   </div>
   		<!-- 등록 버튼 -->
      <a href="<%=request.getContextPath()%>/member/courseList">
     		<button class="register-btn btn btn-outline-success " id="btn" type="button">등록</button> 
     	</a>
</div> 

<script>
//등록 버튼 클릭 시
$('.register-btn').click(function(){
	var user = '${user.user_id}';
	if(user == ''){
		alert('로그인 후 나만의 여행지도 등록이 가능합니다.')
		return;
	}	else{
		alert('등록이 완료 되었습니다. 마이페이지 나만의 여행지도로 이동합니다.')
	}
});


//친구 모집
var checkedValue = $('.recruit-check:checked').val();

$(function () {
	//지역, 분야 설정
	$('.type, .city').change(function(){
		var city = $('.city').val();
		var main_id = $('.type').val();
		maker(city, main_id)
	});
	
	//date range picker
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
		  var index = $('.added-day').length+1;
	    $("#day-btn").append("<button class='added-day days' type='button' data-index='"+index+"'>일차"+"</button>");
	    $('.bottoms').append('<div class="contents-bottom" id="bottom'+index+'"></div>');
	    numbering();
	  });
		
		//일 삭제
	  	$("#remove-day").click(function() {
		    $(".days:last-child").remove();
		    $('.bottoms').children().last().remove();
		    numbering();
		});
		
	
	function numbering(){
		$('.added-day').each(function(index){
			$(this).text(index+1+'일차');
		})  
	}
	
	//일 선택시 버튼 색깔 바꾸기
	$(document).on('click','.added-day',function(){
		$('.added-day').removeClass('clicked');
		$(this).addClass('clicked');
		$('.bottoms').children().hide();
		var index = $(this).data('index');
		$('#bottom'+index).show();
	});
	
	//DB에 있는 지역 불러오기
	setCity();
	function setCity(){
		var str = '<option value="0">전체지역</option>';
		$.ajax({
			async:false,
			type:'get',
			url: '<%=request.getContextPath()%>/course/city',
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
	
	//bottoms sortable
	$( function() { 
	    $( ".contents-bottom" ).sortable();
	    $( ".contents-bottom" ).disableSelection();
	  } );

	$('#btn').click(function(){
		var course = {
				course_title : $('.course_title').val(),
				duration     : $('.duration').val(),
				option       : $('.option').val(),
				recruit      : $('.recruit').is(':checked') ? 'Y' : 'N'
		}
		console.log(course);
		//코스 등록
		$.ajax({
			async:false,
			type:'post',
			url: '<%=request.getContextPath()%>/course/insert',
			contentType:"application/json; charset=UTF-8",
			data:JSON.stringify(course),
			dataType:"json",
			success : function(res){
				console.log(res);
				course_id = res;
				count = $('.bottoms .place_id').length;
				//일차별로
				$('.bottoms').children().each(function(index){
					
					//각 일차별 장소
					$(this).children().each(function (idx) {
						
						var cd = {
								place_id            : $(this).find('.place_id').val(),
								order               : idx+1,
								name                : $(this).find('.name').text(),
								course_detail_date  : index+1,
								course_id           : course_id
						}
						$.ajax({
							async:false,
							type:'post',
							url: '<%=request.getContextPath()%>/course/detail/insert',
							contentType:"application/json; charset=UTF-8",
							data:JSON.stringify(cd),
							dataType:"json",
							success : function(res){
								console.log(res);
								sendCount++;
								console.log(count + " , " + sendCount);
							}
						});
					});
				})
			}
		});
	});
}); //document ready end

var count = 0;
var sendCount = 0
</script>
</body>
</html>