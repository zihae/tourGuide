<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{text-align:center;}
</style>
</head>
<body>
<div class="body container">
		<h1>여행 후기</h1>
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