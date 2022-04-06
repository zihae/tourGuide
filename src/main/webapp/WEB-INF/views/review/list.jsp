<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
#reg-button{
        margin-top: 15px;
        margin-bottom: 25px;}
h2{text-align:center;}
.input-group{margin-top: 10px;}
</style>
</head>
<body>
<div class="body">
	<div class="container">
	  <h2>여행 후기</h2> 
	  <form class="input-group mb-3" action="<%=request.getContextPath()%>/review/list">       <!-- 검색어 유지 -->
		  <input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요" value="${pm.criteria.search }">
		  <div class="input-group-append">
		    <button class="btn btn-success" type="submit">검색</button>
		  </div>
  	  </form>         
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>작성일</th>
	        <th>조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach items="${list}" var="review" varStatus="vs">
	      <tr>
			<td>${pm.totalCount - pm.criteria.pageStart - vs.index}</td>
	        <td><a href="<%=request.getContextPath()%>/review/detail?review_id=${review.review_id}">${review.title}</a></td>
	        <td>${review.review_member_id }</td>
	        <td>${review.create_date_str}</td>
	        <td>${review.view }</td>
	      </tr>
	       </c:forEach>
	    </tbody>
	  </table>
	  <a href="<%=request.getContextPath()%>/review/register">
	  <button class="btn btn-outline-success" id="reg-button">글쓰기</button>
	  </a>
	  	<!-- 페이지네이션 --> 
		 <c:if test="${pm.criteria.page == i}">active</c:if>
		  <ul class="pagination justify-content-center">                                                       
		    <li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/review/list?page=${pm.startPage-1}&search=${pm.criteria.search}">이전</a>
		   	</li>
		   	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			    <li class="page-item <c:if test="${pm.criteria.page == i}">active</c:if>">
			    	<a class="page-link" href="<%=request.getContextPath()%>/review/list?page=${i}&search=${pm.criteria.search}">${i}</a>
			   	</li>
		   	</c:forEach>
		    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/review/list?page=${pm.endPage+1}&search=${pm.criteria.search}">다음</a>
		   	</li>
		  </ul>
	</div>
</div>
</body>
</html>