<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<style>
		.label_title{font-weight: bold; font-size: 14px;
		}
		
		
	</style>
</head>
<body>
	<form class="container signup body" action="<%=request.getContextPath()%>/signup" method="post">
		<h1 class="title text-center">회원가입</h1>
		<div class="form-group">
			<label class="label_title"for="user_id">아이디</label>
			<input type="text" class="form-control "  name="user_id" >
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-outline-info form-control" id="idCheck">아이디 중복 체크</button>
		</div>
		<div class="form-group">
			<label class="label_title" for="password">비밀번호</label>
			<input type="password" class="form-control"  name="password" id="pw">
		</div>
		<div class="form-group">
			<label class="label_title" for="password_check">비밀번호 재확인</label>
			<input type="password" class="form-control"  name="password_check">
		</div>
		<div class="form-group">
			<label class="label_title" for="nickname">닉네임</label>
			<input type="text" class="form-control" name="nickname">
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-outline-info form-control" id="nicknameCheck">닉네임 중복 체크</button>
		</div>
		<div class="form-group">
			<label class="label_title" for="email">이메일</label>
			<input type="text" class="form-control" name="email">
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-outline-info form-control" id="emailCheck">이메일 중복 체크</button>
		</div>
		<div class="form-group">
			<label class="label_title" for="birth" >생년월일</label>
			<input type="text" class="form-control" name="birth" placeholder="예시) 2022-01-01">
		</div>
		
		<label class="label_title" for="gender">성별</label>
		<div class="form-group">
			<select name="gender" class="form-control select2 select2-hidden-accessible">
				<option value="default">성별</option>
				<option value="male">남자</option>
				<option value="female">여자</option>
				<option value="noe">선택안함</option>
			</select>
		</div>
		<button class="btn btn-outline-success col-12">회원가입</button>
	</form>
	<script>
			//아이디 중복 체크
			//아이디가 중복일 경우 false, 중복이 아닐경우 true
			let idCheck = false;
			
			$('#idCheck').click(function(){
				//user_id에 입력되는 값
				var id = $('[name=user_id]').val();
				
				$.ajax({
					async:false,
	        type:'get',
	        url:'<%=request.getContextPath()%>/idcheck?user_id='+id,
	        success : function(data){
	        	 if(data == 'true'){
	             	alert('사용 가능한 아이디입니다.');
	             	idCheck = true;
	             }
	             else{
	             	alert('사용할 수 없는 아이디입니다.');
	             	idCheck = false;
	             }
	        }
				});
			});
			
			//아이디가 변경되면 중복확인 다시하도록 처리
			$('[name=me_id]').change(function(){
				idCheck = false;
			});
	
	</script>
</body>