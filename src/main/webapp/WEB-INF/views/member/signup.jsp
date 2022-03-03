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
		.error{color : red }
		
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
		<label id = "me_gender-error" class="error" for="me_gender"></label>
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
			
			//이메일 중복 체크
					let emailCheck = false;
					
					$('#emailCheck').click(function(){
						var email = $('[name=email]').val();
						
						$.ajax({
							async:false,
			        type:'get',
			        url:'<%=request.getContextPath()%>/emailCheck?email='+email,
			        success : function(data){
			        	 if(data == 'true'){
			             	alert('사용 가능한 이메일입니다.');
			             	emailCheck = true;
			             }
			             else{
			             	alert('이미 가입된 이메일입니다.');
			             	emailCheck = false;
			             }
			        }
						});
					});
					$('[name=email]').change(function(){
						emailCheck = false;
					});
					
			//유효성 검사
					
					$("form").validate({
		        rules: {
		          user_id: {
		        	  //4~10 자의 영문 소문자, 숫자, 특수기호(_),(-)만 사용 가능합니다.
		        	  //단, 첫글자는 영문 소문자만 올 수 있다.
		            required : true,
		            regex : /^[a-z][a-z0-9_-]{3,9}$/
		          },
		          //8~16자의 영문 대 소문자, 숫자, 특수문자를 사용하세요.
		          password: {
		        	  required : true,
		            regex : /^[A-Za-z0-9-_!@#$%]{8,16}$/
		          },
		          password_check:{
		        	  equalTo : pw
		          },
		          //2~10자의 영문 대 소문자, 한글을 사용하세요.
		          nickname : {
		        	  required : true,
		        	  regex : /^[가-힣A-z]{2,10}$/
		          },
		          
		          email : {
		        	  required: true,
		        	  regex : /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/
		          }
		          
		        
		          
		        },
		        //규칙체크 실패시 출력될 메시지
		        messages : {
		          user_id: {
		              required : "필수 정보입니다.",
		              regex : "4~10 자의 영문 소문자, 숫자, 특수기호(_),(-)만 사용 가능합니다."
		          },
		          //
		          password: {
		        	  required : "필수 정보입니다.",
		            regex : '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.'
		          },
		          password_check:{
		        	  equalTo : '비밀번호가 일치하지 않습니다.'
		          },
		          nickname : {
		        	  required : "필수 정보입니다.",
		        	  regex : "2~10자의 영문 대 소문자, 한글을 사용하세요."
		          },
		         
		          email : {
		        	  required : "필수 정보입니다.",
		        	  regex : "잘못된 이메일 형식입니다."
		          }
		         
		        }
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