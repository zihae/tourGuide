<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
  
<style>
h1{text-align: center;}
.btn-group{margin-right: 5px;}
</style>
</head>
<body>
<div class="body">
	<div class="container">
	<h1>${pm.criteria.typeTitle}</h1>
	 <form>
		    <div class="input-group mt-3 mb-3">
		      <div class="input-group-prepend">
			        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
			          지역
			        </button>
			        <div class="dropdown-menu">
			         <a class="dropdown-item" href="#">Link 1</a>
    				   <a class="dropdown-item" href="#">Link 2</a>
               <a class="dropdown-item" href="#">Link 3</a>
			        </div>
		      </div>
		      <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
		      <div class="input-group-append">
		    		<button class="btn btn-success" type="submit">검색</button>
		  		</div>
	 		</div>
	</form>	
	<div class="btn-filter" style="float:right; margin-bottom: 15px">
			<div class="btn-group">
	    	<button type="button" class="btn btn-outline-success">전체</button>
	  	</div>	
	  	<div class="btn-group">
	    	<button type="button" class="btn btn-outline-success">인기순</button>
	  	</div>	
	  	<div class="btn-group">
	    	<button type="button" class="btn btn-outline-success">지도 보기</button>
	  	</div>	
	 </div>
		<div class="container card-deck">
			  <div class="card" style="width:50px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">John Doe</h4>
			      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
			      <a href="#" class="btn btn-success stretched-link">See Profile</a>
			    </div>
			  </div>
			  <div class="card" style="width:50px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">John Doe</h4>
			      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
			      <a href="#" class="btn btn-success stretched-link">See Profile</a>
			    </div>
			  </div>
			  <div class="card" style="width:50px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">John Doe</h4>
			      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
			      <a href="#" class="btn btn-success stretched-link">See Profile</a>
			    </div>
			  </div>
			  <div class="card" style="width:50px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">John Doe</h4>
			      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
			      <a href="#" class="btn btn-success stretched-link">See Profile</a>
			    </div>
			  </div>
		</div>	  
	</div>
</div>
</body>
</html>