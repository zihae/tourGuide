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
.bottom{width: 500px; min-height:400px; max-height: fit-content;border: 2px solid rgba(61, 61, 167, 0.336) ; margin:auto;}
.clicked{backgroud-color: gold;}
.days{margin-bottom: 10px;}
.title{text-align: center;}
.top{text-align: center;}
.detail-info{ border: 2px solid lavender; height: fit-content; margin:auto;}
.order{ 
width: 30px; 
height: 30px; 
background-color: lavender; 
display: inline-block;
text-align: center;
  line-height: 30px;}
.name{font-size: 18px; display: inline-block; padding-left:5px; }
.clicked{background: rgba(61, 61, 167, 0.336); }

</style>
<body>
<div class="container">
	<h1 class="title">${detail.course_title }</h1>
	<div class="top">
		<p>여행기간: ${detail.duration }</p>
		<p>공개범위: ${detail.option }</p>
	
	<c:forEach var="i" begin="1" end="${detail.course_detail_count}">
	    <button class="days" data-target="${i}"><c:out value="${i}" />일차</button>
	</c:forEach>
	</div>
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
				str += '<div class="detail-info">'
				str += '<div class="order">' + res[i].course_order + '</div>' 
				str +=	'<div class="name">' + res[i].name + '</div>'
			}
			str += '</div>'
			$('.bottom').html(str);
		}
	}); //ajax end
	$('.days').removeClass('clicked');
	$(this).addClass('clicked');
	
}); //days click function end









</script>
</html>