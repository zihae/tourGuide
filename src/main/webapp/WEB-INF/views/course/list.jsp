<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
h2{text-align: center;}
.btn{margin:auto;
     display:block;
     margin-top: 30px;}
</style>
</head>
<body>
<div class="container">
  <h2>나만의 여행 지도</h2>          
  <!--  <div class="container">
  	<c:forEach items="${list}" var="course">
	  <div class="card">
	    <div class="card-body">
	      <h4 class="card-title">Card title</h4>
	      <p class="card-text">Some example text. Some example text.</p>
	      <a href="#" class="card-link">상세보기</a>
	    </div>
	  </div>
	  </c:forEach>
	</div>
	-->
	<div class="contents">
	  <div class="card">
	    <div class="card-body">
	      <h4 class="card-title">코스 이름</h4>
	      <p class="card-text">여행날짜</p>
	      <a href="#" class="card-link">상세보기</a>
	    </div>
	  </div>
</div>
  
  <a href="<%=request.getContextPath()%>/course/register">
  <button class="btn btn-outline-success" id="btn">여행지도 만들기</button>
  </a>
</div>
</body>
</html>