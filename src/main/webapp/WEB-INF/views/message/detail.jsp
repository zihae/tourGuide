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
.body{	padding: 10px;}
.left-box, .right-box{height: 560px;	box-sizing: border-box;	
			width: 50%; float: left;}
.option{list-style: none; padding-left: 10px; padding-top: 10px;}
.left-box{width: 195px; background-color: lavender; margin-right: 0px;}
.right-box{ width: 915px; height: 510px; float: right;}
.body::after{
			clear: both; content: ''; display: block;
		}
.btn{margin:auto; display:block;}
.info-box{margin: auto;}
.label{font-weight: bold; margin-left: 30px;  }
.form-control{margin-left: 30px;}
.btn-option{margin-left: 330px; position:absoulte;}
.friend-btn{margin-left: 30px; margin-bottom: 5px; margin-top: 5px;}

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
	 <c:if test="${message.sender_id != user.user_id}">
			<div class="form-group">
				<label class="label" for="sender_id">보낸이</label>
				<input type="text" class="form-control"  name="sender_id" style="width: 700px; " readonly value="${message.sender_id}">
			</div>
		
			<button class="btn btn-info friend-btn">친구추가</button>
				
		</c:if>
		<c:if test="${message.sender_id == user.user_id }">
			<div class="form-group" >
				<label class="label" for="receiver_id">받는이</label>
				<input type="text" class="form-control"  name="receiver_id" style="width: 700px; " readonly value="${message.receiver_id}">
			</div>
		</c:if>
		<div class="form-group">
		<label class="label" for="title">제목</label>
			<input type="text" class="form-control"  name="title"  style="width: 700px;" readonly value="${message.title}">
		</div>
		<div class="form-group">
			<label class="label" for="title">내용</label>
			<div class="form-control" style=" min-height:300px; height:auto; width:700px; ">${message.content}</div>
		</div>
		<div class="btn-option">
				<div class="btn-group">
				<!-- 받은 메세지 삭제 -->
				<c:if test="${message.sender_id != user.user_id}">
					<a href="<%=request.getContextPath()%>/message/delete?message_id=${message.message_id}">
					<button class="btn btn-outline-info send-btn">삭제</button>
					</a>
				</c:if>
				<!-- 보낸 메세지 삭제 -->
					<c:if test="${message.sender_id == user.user_id}">
					<a href="<%=request.getContextPath()%>/message/delete?message_id=${message.message_id}">
					<button class="btn btn-outline-info send-btn">삭제</button>
					</a>
				</c:if>
				</div>
				<div class="btn-group">
					<c:if test="${message.sender_id != user.user_id}">
					<a href="<%=request.getContextPath()%>/message/write?message.sender_id=${message.sender_id}">
						<button class="btn btn-outline-info send-btn">답장</button>
						</a>
					</c:if>
				</div>
		</div>
	</div>
</div>
</body>
</html>