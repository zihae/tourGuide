<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{text-align:center;}
.btn-group{margin-right: 5px; position:absoulte;}
.btn-top{margin-bottom: 20px; float:right;}
</style>
</head>
<body>
<div class="body container">
		<h1>여행 후기</h1>
		<div class="btn-top">
			<c:if test="${user != null && user.user_id == review.review_member_id}">
				<div class="btn-group">
					<a href="<%=request.getContextPath()%>/review/modify?review_id=${review.review_id}">
							<button class="btn btn-outline-success">수정</button>
					</a>
				</div>
				<div class="btn-group">
					<a href="<%=request.getContextPath()%>/review/delete?review_id=${review.review_id}">
						<button class="btn btn-outline-success">삭제</button>
					</a>
				</div>
			</c:if>
				<div class="btn-group" id="btn-list">
					<a href="<%=request.getContextPath()%>/review/list">
		    			<button type="button" class="btn btn-outline-info">목록 보기</button>
		    	 	</a>
		    	</div>
		</div>
		<div class="form-group">
		  <input type="text" class="form-control" name="title" readonly value="${review.title}">
		</div>
		<div class="form-group">
		  <input type="text" class="form-control" name="review_member_id" readonly value="${review.review_member_id}">
		</div>
		<div class="form-group">
		  <input type="text" class="form-control" name="create_date" readonly value="${review.create_date_str}">
		</div>
		<div class="form-group">
		  <div class="form-control" style="min-height:300px; height:auto;">${review.contents}</div>
		</div>
		
	</div>
</body>
</html>