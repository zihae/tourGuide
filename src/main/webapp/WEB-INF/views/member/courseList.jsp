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
	        <th>번호</th>
	        <th>제목</th>
	        <th>여행기간</th>
	        <th>공개범위</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach items="${list}" var="course" varStatus="vs">
	      <tr>
					<td>${pm.totalCount - pm.criteria.pageStart - vs.index}</td>
	        <td>${course.course_title }</td>
	        <td>${course.duration}</td>
	        <td>${course.option}</td>
	      </tr>
	       </c:forEach>
	    </tbody>
	  </table>
		<!-- 페이지네이션 --> 
		 <c:if test="${pm.criteria.page == i}">active</c:if>
		  <ul class="pagination justify-content-center">                                                       
		    <li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/member/courseList?page=${pm.startPage-1}">이전</a>
		   	</li>
		   	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			    <li class="page-item <c:if test="${pm.criteria.page == i}">active</c:if>">
			    	<a class="page-link" href="<%=request.getContextPath()%>/member/courseList?page=${i}">${i}</a>
			   	</li>
		   	</c:forEach>
		    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/member/courseList?page=${pm.endPage+1}">다음</a>
		   	</li>
		  </ul>

</div>

  <a href="<%=request.getContextPath()%>/course/register">
  <button class="btn btn-outline-success" id="btn">여행지도 만들기</button>
  </a>

</body>
</html>