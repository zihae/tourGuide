<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>뚜벅이 안내서</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
    <tiles:insertAttribute name="header"/>
    <div class="container" style="margin-top:96px;">
    <tiles:insertAttribute name="body" />     
    </div>                                  
    <tiles:insertAttribute name="footer" />
</body>
</html>



