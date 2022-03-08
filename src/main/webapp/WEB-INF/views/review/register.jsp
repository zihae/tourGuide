<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="body container">
<form action="<%=request.getContextPath()%>/review/register" method="post" enctype="multipart/form-data">
<div class="form-group">
		  	<label>제목</label>
		  	<input type="text" class="form-control" name="title">
			</div>
			<div class="form-group">
		  	<label>내용</label>
		  	<textarea class="form-control" rows="10" name="contents"></textarea>
			</div>
</form>
<button class="btn btn-outline-success col-12">등록</button>
</div>

</body>
</html>