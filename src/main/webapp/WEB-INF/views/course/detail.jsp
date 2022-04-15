<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.bottom{width: 1000px; height: 600px; border: 2px solid lavender;}
.clicked{backgroud-color: gold;}
</style>
<body>
<div class="container">
	<h1>${detail.course_title }</h1>
	<div class="top">
		<p>${detail.duration }</p>
		<p>${detail.option }</p>
	</div>
	<c:forEach var="i" begin="1" end="${detail.course_detail_count}">
	    <button class="days" data-target="${i}"><c:out value="${i}" />일차</button>
	</c:forEach>
	<div class="bottom">
	</div>
</div>
</body>
<script>

$('.days').click(function(){
	var course_id = '${detail.course_id}';
	var course_detail_date = $(this).data('target');
	
	var obj = {
			cd_course_id : course_id,
			course_detail_date : course_detail_date
	}
	$.ajax({
		async:false,
		type:'POST',
		data: JSON.stringify(obj),
		url: "<%=request.getContextPath()%>/course/info",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(res){
			console.log(res)
			var str = '<div class="place">';
			for(i = 0; i<res.length; i++){
				str += '<div>'+ res[i].course_order + '</div>'
				str += '<div>'+ res[i].name + '</div>'
			}
			str += '</div>'
			$('.bottom').html(str);
		}
	});
});








</script>
</html>