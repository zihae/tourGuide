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
.right-box{border: 2px solid red; width: 915px; height: 500px; float: right;}
.body::after{
			clear: both; content: ''; display: block;
		}
.btn{margin:auto; display:block;}
</style>
</head>
<body>
<div class="body">
	<h1>보낸 쪽지함</h1>
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
	<table class="table table-hover">
	    <thead>
	      <tr>
	        <th><input type="checkbox"></th>
	        <th>받는사람</th>
	        <th>제목</th>
	        <th>날짜</th>
	        <th>수신여부</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list}" var="message"> 
	      <tr>
	      	<td><input type="checkbox"></td>
					<td>${message.receiver_id }</td>
	        <td>${message.title}</td>
	        <td>${message.send_date_str}</td>
	        <td>${message.read}</td>
	      </tr> 
	      </c:forEach>  
	    </tbody>
	  </table>
	</div>
</div>
</body>
</html>