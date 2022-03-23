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
        .map{width: 900px;}
        .contents{
            border-color:#0f0; width:210px; float: right;
        }
        .box1::after{
            clear: both; content: ''; display: block;
        }
        .contents-top{
        	 width: 210px; height:300px; background-color: yellow;
        }
    </style>
</head>
<body>
    <div class="box1">
        <div class="map">
        </div>
        <div class="contents">
        	<div class="contents-top">
	            <input id="title" type="text" name="courseName" placeholder="코스 제목을 입력해주세요.">
	            <div class="form-group">
	            <select name="option" class="select box">
					<option value="default">공개범위</option>
					<option value="public">전체공개</option>
					<option value="private">비공개</option>
				</select>
				</div>
				<select name="area" class="select box">
					<option value="default">전체지역</option>
					<option value="public">광양시</option>
					<option value="private">비공개</option>
				</select>
				<select name="type" class="select box">
					<option value="default">전체분야</option>
					<option value="public">관광지</option>
					<option value="private">음식점</option>
					<option value="private">숙소</option>
				</select>
				<div class="form-group">
					<label>여행 기간</label>
		            <input type="text" name="daterange" id="date">
	            </div>
	            <div class="btn-group">
	            <div class="mate">함께할 친구 추가</div>
	            <div class="recruit">함께할 친구 모집</div>
	            </div>
			</div>
        </div>
        
    </div>
<script>

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
</script>
</body>
</html>