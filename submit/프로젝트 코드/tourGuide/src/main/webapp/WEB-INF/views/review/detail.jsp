<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{text-align:center;}
.btn-group{margin-right: 5px; position:absoulte;}
.btn-top{margin-bottom: 20px; float:right;}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/comment.js"></script>
</head>
<body>
<div class="body container">
		<h1>여행 후기</h1>
		<div class="btn-top">
			<c:if test="${user != null && user.user_id == review.review_member_id}">
				<div class="btn-group">
					<a href="<%=request.getContextPath()%>/review/modify?review_id=${review.review_id}">
							<button class="btn btn-outline-success">수정</button>
					</a>
				</div>
				<div class="btn-group">
					<a href="<%=request.getContextPath()%>/review/delete?review_id=${review.review_id}">
						<button class="btn btn-outline-success">삭제</button>
					</a>
				</div>
			</c:if>
				<div class="btn-group" id="btn-list">
					<a href="<%=request.getContextPath()%>/review/list">
		    			<button type="button" class="btn btn-outline-info">목록 보기</button>
		    	 	</a>
		    	</div>
		</div>
		<div class="form-group">
		  <input type="text" class="form-control" name="title" readonly value="${review.title}">
		</div>
		<div class="form-group">
		  <input type="text" class="form-control" name="review_member_id" readonly value="${review.review_member_id}">
		</div>
		<div class="form-group">
		  <input type="text" class="form-control" name="create_date" readonly value="${review.create_date_str}">
		</div>
		<div class="form-group">
		  <div class="form-control" style="min-height:300px; height:auto;">${review.contents}</div>
		</div>
		
	<div class="comment-list">
				
			</div>
			<div class="comment-pagination">
				
			</div>
			
			<div class="input-group mb-3 mt-3">
			  <textarea class="form-control co_contents" rows="3"></textarea>
			  <div class="input-group-append">
			    <button class="btn btn-success btn-comment-insert">등록</button>
			  </div>
			</div>
		
		
		
</div>

	<script type="text/javascript">
			var contextPath = '<%=request.getContextPath()%>';
			commentService.setContextPath(contextPath);
			console.log(commentService.contextPath);
			$(function(){
				$('.btn-comment-insert').click(function(){
						var co_me_id ='${user.user_id}';
						if(co_me_id == ''){
							alert('댓글은 로그인한 회원만 작성 가능합니다.');
							return;
						}
						//input, textarea, select 처럼 입력 가능한 정보만 val() 쓸 수 있음
						var co_contents = $('textarea.co_contents').val();
						var co_bd_num = '${review.review_id}';
						//하나의 객체로 묶음
						var comment = {
								co_me_id : co_me_id,
								co_contents : co_contents,
								co_bd_num : co_bd_num
						};
						
						if(co_contents == ''){
							alert('댓글을 입력하세요.');
							return;
						}
						commentService.insert(comment, '/comment/insert', insertSuccess);
						});
				
				$(document).on('click', '.comment-pagination .page-item',function(){
						
						if($(this).hasClass('disabled')){
								return;
						}
					
					var page = $(this).data('page');
					//댓글 새로고침
					var listUrl = '/comment/list?page='+page+'&review_id='+ '${review.review_id}';
					 commentService.list(listUrl,listSuccess);
				});
				
				$(document).on('click','.btn-del-comment',function(){
					
					var co_num = $(this).data('num');
					//위에랑 같은 코드 var co_num = $(this).attr('data-num');
					var deleteUrl = '/comment/delete?co_num=' + co_num;
					commentService.delete(deleteUrl, deleteSuccess);
				});
				
				
				$(document).on('click','.btn-mod-comment',function(){
					//댓글 초기화
					commentInit();
					$(this).parent().children('button').hide();
					$(this).siblings('.co_contents').hide();
					var text = $(this).siblings('.co_contents').text();
					var textarea 
					= '<textarea class="form-control co_contents2">'+text+'</textarea>';
					$(this).siblings('.co_contents').after(textarea);
					var co_num = $(this).data('num');
					var button
					= '<button class="btn btn-outline-info btn-mod-insert" data-num="'+co_num+'">댓글 수정</button>'
					$(this).siblings('.co_reg_date').after(button);
				});
				//댓글 수정 등록 버튼 클릭 이벤트
				$(document).on('click','.btn-mod-insert',function(){
					//댓글 번호
					var co_num = $(this).data('num');
					//댓글 내용
					var co_contents = $('.co_contents2').val();
					var comment = {
							co_num : co_num,
							co_contents : co_contents
					}
					commentService.modify(comment,'/comment/modify',modifySuccess);
				});
				
				$(document).on('click','.btn-rep-comment',function(){
					commentInit();
					var str = '<textarea class="form-control co_contents2" rows="3"></textarea>';
					var buttonStr = '<button class="btn btn-success btn-rep-insert" data-num="'+$(this).data('num')+'">답글 등록</button>';
					$(this).parent().children('button').hide();
					$(this).parent().append(str);
					$(this).parent().append(buttonStr);
				});
				
				$(document).on('click','.btn-rep-insert',function(){
					var co_bd_num = '${review.review_id}';
					var co_contents = $('.co_contents2').val();
					var co_ori_num = $(this).data('num');
					var co_me_id = '${user.user_id}'
					var comment = {
							co_bd_num : co_bd_num,
							co_contents : co_contents,
							co_ori_num : co_ori_num,
							co_me_id : co_me_id
					}
					commentService.insert(comment, '/comment/insert', insertSuccess);
				});
				
				
				
				//화면 로딩 준비가 끝나면 댓글 불러옴
				var listUrl = '/comment/list?page=1&review_id=' + '${review.review_id}';
				 commentService.list(listUrl,listSuccess);
				
				});
			
		
			function modifySuccess(res){
				if(res){
				var page = $('.comment-pagination .active').data('page');
				var listUrl = '/comment/list?page='+page+'&review_id=' + '${review.review_id}';
				 commentService.list(listUrl,listSuccess);
				 alert('댓글 수정이 완료되었습니다.');
			}else {
					alert('댓글 수정에 실패했습니다.')
				}
			}
			function getDateToString(date){
				return "" + 
				date.getFullYear() + "-" + 
				(date.getMonth()+1) + "-" +
				date.getDate() + " " +
				date.getHours() + ":" +
				date.getMinutes();
			}
			
			function commentInit(){
				$('.comment-box').each(function(){
					$(this).find('.co_contents2').remove();
					$(this).find('.btn-mod-insert').remove();
					$(this).find('.btn-rep-insert').remove();
					$(this).find('button').show();
					$(this).find('.co_contents').show();
				});
			}
			
			function deleteSuccess(res){
				if(res){
					alert('댓글을 삭제했습니다.')
					var listUrl = '/comment/list?page=1&review_id=' + '${review.review_id}';
					 commentService.list(listUrl,listSuccess);
				}else{
					alert('댓글 삭제에 실패했습니다.')
				}
				}
			
				function listSuccess(res){
							 var str = '';
			         var me_id = '${user.user_id}';
			         //댓글 목록이 없으면 페이지네이션이 안 보이게
			         if(res.list.length == 0){
			        	 $('.comment-list').html('');
			        	 $('.comment-pagination').html('');
			        	 return;
			         }
			         for(tmp of res.list){
			        	 str += createComment(tmp,me_id);
			         }
			         $('.comment-list').html(str);
			         //페이지 메이커
			         var paginationStr = createPagenation(res.pm);
			         $('.comment-pagination').html(paginationStr);
				}
			function insertSuccess(res){
				if(res){
       	   alert('댓글 등록이 완료 되었습니다.');
       	   $('.co_contents').val(''); //댓글이 등록되면 contents 비움
		       
       	   var listUrl = '/comment/list?page=1&review_id='+'${review.review_id}';
       	   commentService.list(listUrl,listSuccess);
				}else{
        	   alert('댓글 등록에 실패 했습니다.');
           }
				}
			function createComment(comment, me_id){
				var co_reg_date = getDateToString(new Date(comment.co_reg_date));
				var str = '';
				str+=	'<div class="comment-box clearfix">'
				
				if(comment.co_ori_num != comment.co_num){
				str+=		'<div class="float-left" style="width:24px">└</div>'
				str+=		'<div class="float-left" style="width: calc(100% - 24px)">'
				}else{
				str+=		'<div class="float-left" style="width: 100%">'
				}
				str+=			'<div class="co_me_id">'+comment.co_me_id+'</div>'
				str+=			'<div class="co_contents">'+comment.co_contents+'</div>'
				str+=			'<div class="co_reg_date">'+co_reg_date+'</div>'
				if(comment.co_ori_num == comment.co_num)
				str+=			'<button class="btn btn-outline-success btn-rep-comment mr-2" data-num="'+comment.co_num+'">답글</button>'
				if(comment.co_me_id == me_id){
				str+=			'<button class="btn btn-outline-warning btn-mod-comment mr-2" data-num="'+comment.co_num+'">수정</button>'
				str+=			'<button class="btn btn-outline-danger btn-del-comment" data-num="'+comment.co_num+'">삭제</button>'
				}
				str+=		'</div>'
				str+=		'<hr class="float-left" style="width:100%">'
				str+=	'</div>'
				return str;
			}
			function createPagenation(pm){
				var str = '';
				var prevDisabled = pm.prev ? '' : 'disabled';
				var nextDisabled = pm.next ? '' : 'disabled';
				var page = pm.criteria.page;
				
				str+= '<ul class="pagination justify-content-center">'
				str+= '<li class="page-item '+prevDisabled+'" data-page="'+(pm.startPage -1)+'"><a class="page-link" href="javascript:;">이전</a></li>'
				for(i = pm.startPage; i<=pm.endPage; i++){
					var active = page == i ? 'active' : ''; //내가 찍으려는 숫자가 현재 페이지면 active가 들어가도록
					str+= '<li class="page-item '+ active +'" data-page="'+i+'"><a class="page-link" href="javascript:;">'+i+'</a></li>'
				}
				str+= '<li class="page-item '+nextDisabled+'" data-page="'+(pm.endPage +1)+'"><a class="page-link" href="javascript:;">다음</a></li>'
				str+= '</ul>'
				return str;
			}
			</script>
</body>
</html>