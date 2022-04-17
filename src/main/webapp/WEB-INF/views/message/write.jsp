<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!-- 화면 왼쪽 부분-->
h1{text-align: center;}
.body{padding: 10px;}
.left-box, .right-box{height: 580px;	box-sizing: border-box;	
			width: 50%; float: left;}
.option{list-style: none; padding-left: 10px; padding-top: 10px;}
.left-box{width: 195px; background-color: lavender; margin-right: 0px; }
.right-box{width: 915px;  float: right;}
.body::after{
			clear: both; content: ''; display: block;
		}
.btn{margin:auto; display:block;}
.label{font-weight: bold; margin-left: 30px;  }
.send-btn{margin-left: 328px;}
</style>
</head>
<body>
<div class="body">
	<h1>쪽지 쓰기</h1>
	<div class="left-box">
		<ul class="option">
			<li><i class="bi bi-envelope-fill"></i><i class="bi bi-arrow-left-short"></i> <a href="<%=request.getContextPath()%>/message/list">받은 편지함</a></li>
			<li><i class="bi bi-envelope-fill"></i><i class="bi bi-arrow-right-short"></i> <a href="<%=request.getContextPath()%>/message/sendList">보낸 편지함</a></li>
		</ul>
		<a href="<%=request.getContextPath()%>/message/write">
		  	<button class="btn btn-info btn-sm" id="reg-button">쪽지쓰기</button>
		 </a>
	</div>
	<div class="right-box">
	<form action="<%=request.getContextPath()%>/message/write" method="post">
		<div class="form-group">
			<label class="label" for="receiver_id" style="font-weight: bold; margin-left: 30px;">받는이</label>
			<input type="text" class="form-control"  name="receiver_id" style="width: 700px; margin-left: 30px;">
			<!-- 답장 시 받는 이 
			<input type="text" class="form-control"  name="receiver_id" style="width: 700px; margin-left: 30px;" value="${message.sender_id}" readonly>
			 -->		
		</div>
		<div class="form-group">
			<label class="label" for="title">제목</label>
			<input type="text" class="form-control"  name="title"  style="width: 700px; margin-left: 30px; ">
		</div>
		<div class="form-group">
			<label class="label" for="title">내용</label>
			<textarea  class="form-control" name="content"  rows="13" style="width: 700px; margin-left: 30px;"></textarea>
		</div>
		<button class="btn btn-outline-info send-btn">보내기</button>
	</form>
	</div>
</div>
</body>
<script>

//예외 처리 하기
$('.send-btn').click(function(){
	alert('발송을 완료했습니다.')
});
</script>
</html>