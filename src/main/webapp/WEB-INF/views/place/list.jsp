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
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
  
<style>
h1{text-align: center;}
.stretched-link{ position: absolute; bottom: 30px;}
.card-body{height: 260px; width: 350px;}
.pagination{margin-top: 15px}
.btn-filter{margin-bottom: 20px;}
.btn-group{ position:absoulte; }
.cards-box {
            display: flex;
            height: 260px; 
            width: 350px;
            margin: 0 70px;
            margin-top: 65px;
            flex-wrap: wrap;
            float: left;
        }


</style>
</head>
<body>
<div class="body">
	<div class="container">
	<h1>${pm.criteria.typeTitle}</h1>
	<!-- 검색 -->
	 <form  class="input-group mt-3 mb-3" action="<%=request.getContextPath()%>/place/list">
		    <div class="input-group mt-3 mb-3">
		      <input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요." value="${pm.criteria.search}">
		      <div class="input-group-append">
		    		<button class="btn btn-info" type="submit">검색</button>
		  	  </div>
		  	  <input type="hidden" name="main_id" value="${pm.criteria.main_id }">
	 		</div>
	</form>	
	<!-- 상단 버튼 -->
	<div class="btn-filter">	
	  	<div class="btn-group">
		  		<a href="<%=request.getContextPath()%>/place/map?main_id=${pm.criteria.main_id }">
		    	<button type="button" class="btn btn-outline-info" id="map-button">지도 보기</button>
		    	</a>
	  	</div>	
	 </div>
	 
	 <!-- 컨텐츠 리스트 -->
			<div id="contents">
				 <div class="card-columns">
				 		<c:forEach items="${list}" var="place">
						<div class="card-box">
							  <div class="card" style="margin-bottom: 20px;">
									  <!--<c:if test="${pm.criteria.main_id == 3}">
									    <img class="card-img-top" src="${place.img }" alt="Card image" style="width:100%; height: 200px" >
									  </c:if>
									  -->
								    <div class="card-body">
								    	<span>${place.area}</span>
								    	<h4>${place.name}</h4>
								    	<ul class="card-body-ul">
									      <li class="address1">${place.address1}</li>
									      <c:if test="${place.tel != null}">
									      	<li class="tel">${place.tel}</li>      
									      </c:if>
									      <!-- test 조건 수정하기 -->
									      <c:choose>
										      <c:when test="${place.menu != null}">
										      <li class="menu">메뉴: ${place.menu}</li>
									      </c:when>
									      </c:choose>
								      </ul>
								      <a href="<%=request.getContextPath()%>/place/detail?place_id=${place.place_id}&main_id=${place.main_id}" class="btn btn-info stretched-link">상세 보기</a>
								    </div>
							  </div>
						</div>
					</c:forEach>
				</div>
			</div>	
			
			
			<!-- 페이지네이션 --> 
		 <c:if test="${pm.criteria.page == i}">active</c:if>
		  <ul class="pagination justify-content-center">
		    <li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/place/list?main_id=${pm.criteria.main_id }&page=${pm.startPage-1}&search=${pm.criteria.search}">이전</a>
		   	</li>
		   	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			    <li class="page-item <c:if test="${pm.criteria.page == i}">active</c:if>">
			    	<a class="page-link" href="<%=request.getContextPath()%>/place/list?main_id=${pm.criteria.main_id }&page=${i}&search=${pm.criteria.search}">${i}</a>
			   	</li>
		   	</c:forEach>
		    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
		    	<a class="page-link" href="<%=request.getContextPath()%>/place/list?main_id=${pm.criteria.main_id }&page=${pm.endPage+1}&search=${pm.criteria.search}">다음</a>
		   	</li>
		  </ul>
	</div>
</div>
<script>

	
</script>
</body>
</html>