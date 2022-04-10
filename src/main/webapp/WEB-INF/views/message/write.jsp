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
.body{border: 2px solid red;	padding: 10px;}
.left-box, .right-box{height: 500px;	box-sizing: border-box;	
			width: 50%; float: left;}
.option{list-style: none; padding-left: 10px; padding-top: 10px;}
.left-box{width: 195px; background-color: lavender; margin-right: 0px;}
.right-box{border: 2px solid red; width: 915px; height: 500px; float: right;}
.body::after{
			clear: both; content: ''; display: block;
		}
.btn{margin:auto; display:block;}
<!-- 화면 오른쪽 부분-->

</style>
</head>
<body>
<div class="body">
	<h1>쪽지함</h1>
	<div class="left-box">
		<ul class="option">
			<li><i class="bi bi-envelope-fill"></i><i class="bi bi-arrow-left-short"></i> <a href="<%=request.getContextPath()%>/message/list">받은 편지함</a></li>
			<li><i class="bi bi-envelope-fill"></i><i class="bi bi-arrow-right-short"></i> <a href="#">보낸 편지함</a></li>
			<li><i class="bi bi-trash-fill"></i><a href="#"> 휴지통</a></li>
		</ul>
			<a href="<%=request.getContextPath()%>/message/write">
		  	<button class="btn btn-info btn-sm" id="reg-button">쪽지쓰기</button>
		  </a>
	</div>
	<div class="right-box">
	<form action="<%=request.getContextPath()%>/message/write" method="post">
		<div class="form-group">
			<input type="text" class="form-control"  name="receiver_id" placeholder="받는 사람" style="width: 700px; margin:auto;">
		</div>
		<div class="form-group">
			<input type="text" class="form-control"  name="title" placeholder="제목" style="width: 700px; margin:auto; ">
		</div>
		<div class="form-group">
			<textarea  class="form-control" name="content" placeholder="내용" rows="13" style="width: 700px; margin:auto;"></textarea>
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