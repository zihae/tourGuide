<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.tab-content{
	border:1px solid #dee2e6;
	height: 300px; 
}

</style>
<body>
<div class="container">
  <br>
  <!-- Nav pills -->
  <ul class="nav nav-pills" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="pill" href="#findid">아이디 찾기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#findpw">비밀번호 찾기</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="findid" class="container tab-pane active"><br>
      <h3>아이디 찾기</h3>
		   <div class="id-box mt-5">
					<div class="form-group">
				  	<input type="text" class="form-control" name="email" placeholder="이메일">
					</div>
				<div class="form-group">
				  <input type="text" class="form-control" name="nickname" placeholder="닉네임">
				</div>
				<button class="btn btn-outline-info btn-find-id col-12">아이디 찾기</button>
			</div>
    </div>
    <div id="findpw" class="container tab-pane fade"><br>
	      <h3>비밀번호 찾기</h3>
	      <div class="pw-box mt-5">
					<div class="form-group">
				  	<input type="text" class="form-control" name="email" placeholder="이메일">
					</div>
					<div class="form-group">
					  <input type="text" class="form-control" name="user_id" placeholder="아이디">
					</div>
					<button class="btn btn-outline-info btn-find-pw col-12">비밀번호 찾기</button>
				</div>
    </div>
  </div>
</div>
<script>
$('.btn-find-id').click(function(){
		var email = $('.id-box [name=email]').val();
		var nickname = $('.id-box [name=nickname]').val();
		var member ={
				email : email,
				nickname : nickname
		}
		$.ajax({
			async: false,
			type: 'POST',
			data: JSON.stringify(member),
			url: '<%=request.getContextPath()%>/member/find/id',
			contentType:"application/json; charset=UTF-8",
			success : function(res){
				if(res == ''){
					alert('일치하는 정보가 없습니다.'); 
				}else{
					alert('회원님의 아이디는 ' + res + '입니다.');
				}
			}
		});
});

$('.btn-find-pw').click(function(){
		var email = $('.pw-box [name=email]').val();
		var user_id = $('.pw-box [name=user_id]').val();
		var member = {
				email : email,
				user_id : user_id
		}
		$.ajax({
			async: false,
			type: 'POST',
			data: JSON.stringify(member),
			url: '<%=request.getContextPath()%>/member/find/pw',
			contentType:"application/json; charset=UTF-8",
			success : function(res){
				if(res == 'ok')
					alert('이메일로 임시 비밀번호를 발송하였습니다.')
				else if(res == 'fail')
					alert('일치하는 정보가 없습니다.')
				else if(res == 'erro')
					alert('메일 전송에 실패하였습니다. 관리자에게 문의해 주세요.')
			}
		});
		
});
</script>
</body>
</html>