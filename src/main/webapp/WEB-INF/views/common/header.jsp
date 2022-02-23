<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<head>
<style>
        *{padding: 0px; margin:0px;}
        ul,li{list-style: none;}
        a{text-decoration: none; color: #000;}
        .nav{position:absoulte;}
        .menu{
            height: 10px;  box-sizing: border-box;  
        }
        .ham-menu{
            position: absolute; top: 20px; bottom: 0; right: 100px; width: 100px; box-sizing: border-box; border: 2px solid red; text-align: left; border-radius: 18px;
            background-color: #fff
        }
        .ham-menu>i{
            font-size: 30px; line-height: 65px; color: red; padding-left: 10px;
        }
        .main-menu{
            position: fixed; top: 90px; bottom: 0; right: 100px; width: 200px; background-color: #fff; border: 2px solid red; display: none; height: fit-content; border-radius: 18px; 
        }

        .main-menu>.menu-item:nth-child(2){
            border-bottom: none;
        }
        .main-menu>.menu-item{
            height: 50px; margin-top: -2px; box-sizing: border-box; border-top: 2px solid red; border-bottom: 2px solid red; line-height: 46px; text-align: center;
        }
    
        .main-menu>.menu-item>.menu-link{
            display: block; height: 100%;
        }
    </style>

</head>

<!--================Header Area =================-->
        <header class="header_area">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <a class="navbar-brand logo_h" href="<%=request.getContextPath()%>/home"><i class="bi bi-book" style="margin-right:4px;"></i>뚜벅이 안내서</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto">
                            <li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/home">Home</a></li> 
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">숙소</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="blog.html">숙소 검색</a></li>
                                </ul>
                            </li> 
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">추천여행</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="blog.html">여행지</a></li>
                                    <li class="nav-item"><a class="nav-link" href="blog-single.html">음식점</a></li>
                                </ul>
                            </li> 
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="blog.html">나만의 여행지도 만들기</a></li>
                                    <li class="nav-item"><a class="nav-link" href="blog-single.html">여행 코스 공유</a></li>
                                </ul>
                            </li>     	
                        </ul>	
                    </div> 
                </nav>
               <nav class="nav">
				        <div class="menu">
				            <a href="#" class="ham-menu">
				                <i class="fas fa-bars"></i>
				                <i class="bi bi-person-circle"></i>
				            </a>
				            <ul class="main-menu">
				                <li class="menu-item">
				                    <a class="menu-link" href="<%=request.getContextPath()%>/signup">회원가입</a>
				                </li>
				                <li class="menu-item">
				                    <a href="#" class="menu-link">로그인</a>
				                </li>
				            </ul>
				        </div>
   				 		</nav>
            </div>
        </header>
        
        <script>
  
   
    $('.ham-menu').click(function(){
            $('.main-menu').toggle();
        });
	
    </script>
      