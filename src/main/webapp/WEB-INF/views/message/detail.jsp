<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{text-align: center;}
.body{border: 2px solid red;	padding: 10px;}
.left-box, .right-box{height: 500px;	box-sizing: border-box;	
			width: 50%; float: left;}
.option{list-style: none; padding-left: 10px; padding-top: 10px;}
.left-box{width: 195px; background-color: lavender; margin-right: 0px;}
.right-box{ width: 915px; height: 500px; float: right;}
.body::after{
			clear: both; content: ''; display: block;
		}
.btn{margin:auto; display:block;}
</style>
</head>
<body>
<div class="body">
	<div class="left-box">
		<ul class="option">
			<li><i class="bi bi-envelope-fill"></i><i class="bi bi-arrow-left-short"></i> <a href="<%=request.getContextPath()%>/message/list">받은 편지함</a></li>
			<li><i class="bi bi-envelope-fill"></i><i class="bi bi-arrow-right-short"></i> <a href="<%=request.getContextPath()%>/message/sendList">보낸 편지함</a></li>
			<li><i class="bi bi-trash-fill"></i><a href="#"> 휴지통</a></li>
		</ul>
			<a href="<%=request.getContextPath()%>/message/write">
		  	<button class="btn btn-info btn-sm" id="reg-button">쪽지쓰기</button>
		  </a>
	</div>
	<div class="right-box">
		<c:if test="${message.receiver_id == user.user_id}">
			<div class="form-group">
				<input type="text" class="form-control"  name="receiver_id" style="width: 700px; margin:auto;" readonly value="${message.receiver_id}">
			</div>
		</c:if>
		<c:if test="${message.sender_id == user.user_id }">
			<div class="form-group">
				<input type="text" class="form-control"  name="sender_id" style="width: 700px; margin:auto;" readonly value="${message.sender_id}">
			</div>
		</c:if>
		<div class="form-group">
			<input type="text" class="form-control"  name="title"  style="width: 700px; margin:auto;" readonly value="${message.title}">
		</div>
		<div class="form-group">
			<div class="form-control" style=" min-height:300px; height:auto;">${message.content}</div>
		</div>
		<button class="btn btn-outline-info send-btn">보내기</button>
	
	
	</div>
</div>
</body>
</html>