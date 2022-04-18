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
	 <table class="table table-hover">
	    <thead>
	      <tr>
	       
	        <th>제목</th>
	        <th>여행기간</th>
	        <th>공개범위</th>
	        <th>작성일</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach items="${list}" var="course" varStatus="vs">
	      <tr>
				
	        <td><a href="<%=request.getContextPath()%>/course/detail?course_id=${course.course_id}">${course.course_title }</a></td>
	        <td>${course.duration}</td>
	        <td>${course.option}</td>
	        <td>${course.course_write_date_str}</td>
	      </tr>
	       </c:forEach>
	    </tbody>
	  </table>
		

</div>

  <a href="<%=request.getContextPath()%>/course/register">
  <button class="btn btn-outline-success" id="btn">여행지도 만들기</button>
  </a>

</body>
</html>