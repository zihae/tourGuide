<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
  
<style>
h1{text-align: center;}
.btn-group{margin-right: 5px;}
</style>
</head>
<body>
<div class="body">
	<div class="container">
	<h1>${pm.criteria.typeTitle}</h1>
	 <form>
		    <div class="input-group mt-3 mb-3">
		      <div class="input-group-prepend">
			        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
			          지역
			        </button>
			        <div class="dropdown-menu">
			         <a class="dropdown-item" href="#">Link 1</a>
    				   <a class="dropdown-item" href="#">Link 2</a>
               <a class="dropdown-item" href="#">Link 3</a>
			        </div>
		      </div>
		      <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
		      <div class="input-group-append">
		    		<button class="btn btn-success" type="submit">검색</button>
		  		</div>
	 		</div>
	</form>	
	<div class="btn-filter" style="margin-bottom: 15px;">
			<div class="btn-group">
	    	<button type="button" class="btn btn-outline-success">전체</button>
	  	</div>	
	  	<div class="btn-group">
	    	<button type="button" class="btn btn-outline-success">인기순</button>
	  	</div>	
	  	<div class="btn-group">
	    	<button type="button" class="btn btn-outline-success">지도 보기</button>
	  	</div>	
	 </div>
	 <div class="card-box">
			 <div class="card-columns">
			 		<c:forEach items="${list}" var="place">
					<div class="card-deck">
						  <div class="card" style="width:50px">
						    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
						    <div class="card-body">
						    	<span>${place.area}</span>
						    	<h4>${place.name}</h4>
						    	<ul class="card-body-ul">
							      <li class="address1">${place.address1}</li>
							      <li class="tel">${place.tel}</li>      
							      <!-- test 조건 수정하기 -->
							      <c:choose>
							      <c:when test="${place.menu != null}">
							      <li class="menu">메뉴: ${place.menu}</li>
							      </c:when>
							      </c:choose>
						      </ul>
						      <a href="#" class="btn btn-primary stretched-link">상세 보기</a>
						    </div>
						  </div>
					</div>
				</c:forEach>
			</div>	
		</div> 
		 <c:if test="${pm.criteria.page == i}">active</c:if>
		  <ul class="pagination justify-content-center">
		    <li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/place/list?page=${pm.startPage-1}&search=${pm.criteria.search}">이전</a>
		   	</li>
		   	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			    <li class="page-item <c:if test="${pm.criteria.page == i}">active</c:if>">
			    	<a class="page-link" href="<%=request.getContextPath()%>/place/list?page=${i}&search=${pm.criteria.search}">${i}</a>
			   	</li>
		   	</c:forEach>
		    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/place/list?page=${pm.endPage+1}&search=${pm.criteria.search}">다음</a>
		   	</li>
		  </ul>
	</div>
</div>
</body>
</html>