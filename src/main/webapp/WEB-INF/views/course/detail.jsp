<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>몇일차 ${detail.course_detail_date }</p>
<div>코스 아이디 ${detail.course_id }</div>
<div>순서 ${detail.course_order }</div>
<div>이름 ${detail.name } </div>

<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>여행기간</th>
	        <th>공개범위</th>
	      </tr>
	    </thead>
 <c:forEach items="${list}" var="detail"> 
	      <tr>
					<td>일차 ${detail.course_detail_date }</td>
	        <td>코스 아이디 ${detail.course_id }</td>
	        <td>순서 ${detail.course_order }</td>
	        <td>이름 ${detail.name }</td>
	      </tr> 
	      </c:forEach>  
</table>

</body>
</html>