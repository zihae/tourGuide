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
		.error{ color: red}
	</style>
</head>
<body>
	<form class="container signup body" action="<%=request.getContextPath()%>/signup" method="post">
		<h1 class="title text-center">회원가입</h1>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="아이디" name="user_id" >
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-outline-info form-control" id="idCheck">아이디 중복 체크</button>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" placeholder="비밀번호" name="password" id="pw">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" placeholder="비밀번호확인" name="password_check">
		</div>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="닉네임" name="nickname">
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-outline-info form-control" id="idCheck">닉네임 중복 체크</button>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="이메일" name="email">
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-outline-info form-control" id="idCheck">이메일 중복 체크</button>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="생년월일" name="birth" id="birth">
		</div>
		
		<div class="form-group">
			<select name="gender" class="form-control select2 select2-hidden-accessible">
				<option value="default">성별</option>
				<option value="male">남자</option>
				<option value="female">여자</option>
				<option value="noe">선택안함</option>
			</select>
			<div>
				<label class="error" id="me_gender-error" for="gender"></label>
			</div>
		</div>
		<button class="btn btn-outline-success col-12">회원가입</button>
	</form>
	<script>
		let idCheck = false;
		$('form').submit(function(){
		//아이디 중복 체크
		$('#idCheck').click(function(){
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
            	alert('이미 가입된 아이디입니다.');
            	idCheck = false;
            }
        }
			});
		});
		
		$('[name=user_id]').change(function(){
			idCheck = false;
		});
		
		
		$(function(){
			
			$("form").validate({
        rules: {
          user_id: {
        		//2~10자의 영문 소문자, 숫자, 특수기호(_)만 사용 가능합니다.
        	  //단, 첫글자는 특수기호가 올수 없습니다.
            required : true,
            regex : /^[a-z0-9][a-z0-9_]{1,9}$/
          },
          //8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.
          password: {
        	  required : true,
            regex : /^[A-Za-z0-9-_!@#$%]{8,16}$/
          },
          password_check:{
        	  equalTo : password
          },
          
          nickname : {
        	  required : true
        	  regex : /^[가-힣0-9]{1,8}$/
        	  
          },
          gender : {
        	  required : true
          },
          birth : {
        	  required : true,
        	  regex : /^\d{4}-\d{2}-\d{2}$/
          }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
          user_id: {
              required : "필수 정보입니다.",
              regex : '2~10자의 영문 소문자, 숫자, 특수기호(_)만 사용 가능합니다. 단 첫글자는 특수 기호가 올 수 없습니다.'
            	  
          },
          password: {
        	  required : "필수 정보입니다.",
            regex : '8~16자의 영문 대 소문자, 숫자, 특수문자(_)(-)(!)(#)($)(%)만 사용 가능합니다.'
          },
          password_check:{
        	  equalTo : '비밀번호가 일치하지 않습니다.'
          },
          nickname : {
        	  required : "필수 정보입니다.",
          },
          gender : {
        	  required : "필수 정보입니다.",
          },
          birth : {
        	  required : "필수 정보입니다.",
        	  regex : '태어난 년도 4자리를 정확하게 입력하세요.'
          }
         
        }
	    });
		});
		$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
	    },
	    "Please check your input."
		);
	</script>
</body>