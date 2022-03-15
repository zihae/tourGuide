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

</style>
</head>
<body>
<div class="body container">
	<h1>${pm.criteria.typeTitle}</h1>
	 <form>
		    <div class="input-group mt-3 mb-3">
		      <div class="input-group-prepend">
			        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
			          지역
			        </button>
			        <div class="dropdown-menu">
			          <a class="dropdown-item" href="#">고창군</a>
			          <a class="dropdown-item" href="#">군산시</a>
			          <a class="dropdown-item" href="#">김제시</a>
			          <a class="dropdown-item" href="#">남원시</a>
			          <a class="dropdown-item" href="#">무주군</a>
			          <a class="dropdown-item" href="#">부안군</a>
			          <a class="dropdown-item" href="#">순창군</a>
			          <a class="dropdown-item" href="#">완주군</a>
			          <a class="dropdown-item" href="#">익산시</a>
			          <a class="dropdown-item" href="#">임실군</a>
			          <a class="dropdown-item" href="#">장수군</a>
			          <a class="dropdown-item" href="#">전주시</a>
			          <a class="dropdown-item" href="#">정읍시</a>
			          <a class="dropdown-item" href="#">진안군</a>
			        </div>
		      </div>
		      <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
		      <div class="input-group-append">
		    		<button class="btn btn-success" type="submit">검색</button>
		  		</div>
	 		</div>
	</form>		
		<div class="container card-deck">
			  <div class="card" style="width:50px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">John Doe</h4>
			      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
			      <a href="#" class="btn btn-primary stretched-link">See Profile</a>
			    </div>
			  </div>
			  <div class="card" style="width:50px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">John Doe</h4>
			      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
			      <a href="#" class="btn btn-primary stretched-link">See Profile</a>
			    </div>
			  </div>
			  <div class="card" style="width:50px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">John Doe</h4>
			      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
			      <a href="#" class="btn btn-primary stretched-link">See Profile</a>
			    </div>
			  </div>
			  <div class="card" style="width:50px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">John Doe</h4>
			      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
			      <a href="#" class="btn btn-primary stretched-link">See Profile</a>
			    </div>
			  </div>
		</div>	  
		
</div>
</body>
</html>