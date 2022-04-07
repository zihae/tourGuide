<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="body container">
		<h1>여행 후기</h1>
		<form action="<%=request.getContextPath()%>/review/modify" method="post">
			<div class="form-group">
			  <input type="text" class="form-control" name="title" value="${review.title }">
			</div>
			<div class="form-group">
			  <textarea class="form-control" name="contents" rows="10">${review.contents}</textarea>
			</div>
			<input type="hidden" name="review_id" value="${review.review_id }">
			<button class="btn btn-outline-success col-12">수정 완료</button>
		</form>
	</div>
	<script>
      $('[name=contents]').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 400
      });
    </script>
</body>