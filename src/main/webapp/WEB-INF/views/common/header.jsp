<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/vendors/linericon/style.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/css/style.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/css/responsive.css">
  
<style>
#ham-menu>i{
            font-size: 20px; line-height: center;  padding-right: 25px;
        }



</style>

</head>
<body>

<!--================Header Area =================-->
    <header class="header_area">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light">
                <!-- Brand and toggle get grouped for better mobile display -->
                <a class="navbar-brand logo_h" href="<%=request.getContextPath()%>/"><i class="bi bi-book" style="margin-right:4px;"></i>뚜벅이 안내서</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/">Home</a></li> 
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">추천 여행</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/place/list">관광지</a></li>
                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/place/list?main_id=2">음식점</a></li>
                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/place/list?main_id=3">숙소</a></li>
                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/place/public">공공데이터</a></li>
                            </ul>
                        </li> 
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">여행 지도</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="blog.html">나만의 여행지도 만들기</a></li>
                                
                            </ul>
                        </li> 
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="blog.html">여행 지도 공유</a></li>
                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/review/list">여행 후기</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                        		<a href="#" class="nav-link dropdown-toggle" id="ham-menu" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="bi bi-person-circle"></i></a>
                							<ul class="dropdown-menu">
                								<c:if test="${user == null}">
	                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/signup">회원가입</a></li>
	                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login">로그인</a></li>
                                </c:if>
                                <c:if test="${user != null}">
                                	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/mypage">메세지</a></li>
	                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/mypage">마이페이지</a></li>
	                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
                                </c:if>
                                
                            </ul>  
                        </li>     	
                    </ul>	
                </div> 
            </nav>
        </div>
    </header>
    
</body>
        
      
      