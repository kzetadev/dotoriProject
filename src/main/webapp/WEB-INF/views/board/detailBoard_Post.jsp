<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${detail.board_title }</title>
<link href="/css/summernote-lite.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/summernote-lite.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<style type="text/css">
	.comment_box{

	}
	#container, .form-comment-group{
		padding-left: 300px;
		padding-right: 300px;
	}
	h2{
		text-align:center;
	}
	.comment_li{
		list-style: none;
	}
	#btnUpdate, #btnDelete {
		position: relative;
	}
	.note-editor.note-frame .note-editing-area .note-editable[contenteditable="false"], .note-editor.note-airframe .note-editing-area .note-editable[contenteditable="false"] {
		background-color: #ffffff;
	}
	.comment{
		border:1px solid lightgray;
		border-radius: 5px;
		border-left-style: none;
		border-right-style: none;
	}
	.commentDetail{
		display:inline-block;
		padding: 10px;
	}
	li{
		list-style: none;
	}
</style>
<script type="text/javascript">
	$(function() {
		
		var login_mem_no = ${login_mem_no};
		var divContainer = $("<div id='popup_layer' class='container'/>").css({
			'position':'absolute'
			, 'top':100
			, 'left':100
			, 'z-index':1
			, 'visibility':'hidden'
		});
		//버튼 그룹
		var divBtnGroup = $("<div id='btnGroup' class='btn-group-vertical'/>");
		//쪽지보내기 버튼
		var btnMsg = $("<button type='button' class='btn btn-default'/>").text("쪽지보내기");
		// 마이페이지 버튼
		var btnMypage = $("<button type='button' class='btn btn-default'/>").text("마이페이지");
		$(btnMsg).click(function(){
// 			window.open("/member/sendMessage.do", "_blank", "width=400, height=300, menubar=no, toolbar=no, status=no").focus();
			jQuery.noConflict();
			$("#modalMessage .modal-content")
				.load("/member/sendMessage.do?mem_no=" + $(this).parent().attr('mem_no') 
					+ "&mem_nickname=" + $(this).parent().attr('mem_nickname'), function(){
				$("#modalMessage").modal();
			});
		});
		$(btnMypage).click(function(){
			location.href = "/member/myPage.do?mem_no=" + $(this).parent().attr('mem_no');
		});
		
		$(divBtnGroup).append(btnMsg, btnMypage);
		$(divContainer).append(divBtnGroup);
		$('body').append(divContainer);

		//닉네임 클릭 시 레이어 표시
		$(".nickname").click(function(e){
			if (login_mem_no == $(this).attr('mem_no')){
				return;
			}
			$("#btnGroup").attr('mem_no', $(this).attr('mem_no'));
			$("#btnGroup").attr('mem_nickname', $(this).text());
			var oWidth = $("#popup_layer").width();
			var oHeight = $("#popup_layer").height();
			
			var divLeft = e.clientX + 10;
			var divTop = e.clientY;
		
			$("#popup_layer").css({
			    "top":divTop
			    , "left":divLeft
			    , "position":"absolute"
				, 'visibility':'visible'
			});
		});
		//화면 내 특정영역(닉네임)을 제외한 부분 클릭 시 레이어 숨김
		$('html').click(function(e){
			if(!$(e.target).hasClass('nickname')){
				$("#popup_layer").css({
					'visibility':'hidden'
				});
				$("#btnGroup").attr('mem_no', '');
			}
		});
		var comments;
		$("#content").summernote({
	 		height:400
	 		, minHeight:null
			, maxHeight:null
			, focus:true
			, lang:'ko-KR'
			, placeholder:'최대 500자까지 작성 가능합니다.'
			, tabsize:2
			, backColor:'white'
			, toolbar:[]
			, disableDragAndDrop:true
		});
		//시큐리티에서 csrf 토큰이 필요하여 ajax 통신 전 csrf를 header에 포함. 
		$.ajaxPrefilter(function(options, originalOptions, jqXHR){
			var token = "${_csrf.token}";
			jqXHR.setRequestHeader('X-CSRF-Token', token);
		});
		//var content에 jstl로 board_content를 저장 시 스크립트에 해당 내용이 노출되어
		//ajax 방식으로 변경
		$.ajax({
			url:"/board/getBoardPost.do/" + $("#board_no").val()
			, type:'get'
			, dataType:'JSON'
			, success:function(result){
				//썸머노트 코드로 본문에 로드시킴.
				$("#content").summernote('code', result['board_content']);
				//편집 불가하게 변경.
				$("#content").next().find(".note-editable").attr("contenteditable", false);
			}
		});
		
		var board_no = $("#board_no").val();
		$("#btnUpdate").click(function() {
			location.href = "/board/updateBoard_Post.do?board_no="+board_no;
		});
		
		$("#btnDelete").click(function() {
			console.log(board_no);
			var re = confirm("삭제하시겠습니까?");
			if(re == true){
				location.href = "/board/deleteBoard_Post.do?board_no="+board_no;
// 				alert("삭제했습니다!");
			}
		});

		$("#btnWrite").click(function() {
			location.href = "/board/insertBoard_Post.do?board_kinds=${detail.board_kinds}";
		});
		
		//댓글 목록 새로고침
		function refreshComments(comment_changed){
			//댓글에 작성할 수 있는 댓글란
			var btnReplyAnswer = $("<button class='btn btn-default' id='btnReplyAnswer'>답글</button>"); 
			var commentReplyArea = $("<div id='commentReplyArea'/>")
				.append($("<label for='comment_reply_content'>댓글</label>"))
				.append($("<textarea id='comment_reply_content' class='form-control' rows='3' placeholder='댓글을 적어주세요.' style='background-color:white'/>"))
				.append(btnReplyAnswer);
			//댓글 작성 버튼 클릭
			$(btnReplyAnswer).click(function(){
				//상위 댓글의 board_ref, board_level을 가져와서 댓글 작성할 때 사용
				var board_ref = $(this).parent().attr('board_ref');
				var board_level = $(this).parent().attr('board_level');
				var board_step = $(this).parent().attr('board_step');
				console.log('commentReplyArea board_level : ' + board_level);
				console.log('commentReplyArea board_step : ' + board_step);
				//대댓글 객체 만들기
				var comment = {
					board_ref:board_ref
					, board_level:board_level
					, mem_no:login_mem_no
					, board_no:$("#board_no").val()
					, comment_content:$("#comment_reply_content").val()
				}
				console.log(comment);
				$.ajax({
					url:"/board/insertBoard_Comment.do"
					, type:"post"
					, data:comment
					, success:function(result){
// 						alert("댓글이 등록되었습니다.");
						refreshComments(true);
					}
				});
			});
			//해당 게시글에 대한 댓글 목록 가져오기
			$.ajax({
				url:'/board/listBoardComment.do/' + $("#board_no").val()
				, type:'get'
				, dataType:'JSON'
				, success:function(data){
					comments = data;
					$("#commentList").empty();
					var ul = $("<ul/>");
					$.each(comments, function(idx, comment){
						console.log(comment);
						var li = $("<li/>");
						//댓글 노드 만들기
						var div = $("<div class='comment' comment_del='" + comment['comment_del'] + "' board_no='" + $("#board_no").val() + "' comment_no='" + comment['comment_no'] + "' board_ref='" + comment['board_ref'] + "' board_level='" + comment['board_level'] + "'/>");
						var divNickname = $("<span class='commentDetail' width='50'/>");
						var imgMember = $("<img src='" + comment['mem_img'] + "' style='width:30px; height:30px;'/>");
						var aNickname = $("<a class='nickname' mem_no='" + comment['mem_no'] + "'/>").text(comment['mem_nickname']);
						var divBtn = $("<div class='text-right'/>");
						$(divNickname).append(imgMember, aNickname);
						$(aNickname).click(function(e){
							if (login_mem_no == $(this).attr('mem_no')){
								return;
							}
							$("#btnGroup").attr('mem_no', $(this).attr('mem_no'));
							$("#btnGroup").attr('mem_nickname', $(this).text());
							var oWidth = $("#popup_layer").width();
							var oHeight = $("#popup_layer").height();
							
							var divLeft = e.pageX + 10;
							var divTop = e.pageY;
						
							$("#popup_layer").css({
							    "top":divTop
							    , "left":divLeft
							    , "position":"absolute"
								, 'visibility':'visible'
							});
						});
						var btnEdit = $("<button type='button' class='btn btn-default reply-edit' edit-state='0'/>").text("수정");
						var btnDel = $("<button type='button' class='btn btn-default reply-del'/>").text("삭제");
						var divContent = $("<textarea readonly='readonly' class='form-control reply-content' rows='3' width='400'/>").text(comment['comment_content']);
						var spanDelComment = $("<span width='100'/>").text("삭제된 댓글입니다.");
						var divDate = $("<span class='commentDetail' width='100'/>").text(comment['comment_date']);
						//edit-state - 0 : 수정	1 : 수정완료		전환용도
						$(btnEdit).click(function(){
							if($(this).attr('edit-state') == 0){	//수정할 떄. textarea readonly를 해제하여 입력 가능하게 변경
								$(this).parent().parent().find(".reply-content").removeAttr('readonly');
								$(this).attr('edit-state', '1');
								$(this).text("수정완료");
							}else{									//수정완료 할 때. 댓글 테이블에 해당 내용으로 수정.
								var comment = {
									comment_no:$(this).parent().parent().attr('comment_no')
									, board_no:$("#board_no").val()
									, mem_no:login_mem_no
									, comment_content:$(this).parent().parent().find(".reply-content").val()
								}
								console.log(comment);
								$.ajax({
									url:"/board/updateBoard_Comment.do"
									, type:"post"
									, data:comment
									, success:function(result){
// 										if(result == 1){
// 											alert("댓글이 수정되었습니다.");
// 										}else{
// 											alert("댓글 수정에 실패하였습니다.");
// 										}
										refreshComments(true);
									}
								});
							}
							console.log($(this).parent().parent().attr('board_no'));
						});
						$(btnDel).click(function(){
							var comment = {
								comment_no:$(this).parent().parent().attr('comment_no')
								, board_no:$("#board_no").val()
								, mem_no:login_mem_no
							}
							console.log(comment);
							$.ajax({
								url:"/board/deleteBoard_Comment.do"
								, type:"post"
								, data:comment
								, success:function(result){
									if(confirm("해당 댓글을 삭제하시겠습니까?")){
// 										alert("댓글이 삭제되었습니다.");
										refreshComments(true);
									}
								}
							});
						});
						$(divBtn).append(btnEdit, btnDel);
						//해당 댓글 노드가 상위 노드(board_level == 1 이면 상위 댓글)이면
						//클릭 시 댓글 작성란을 하단에 표시 
						if(parseInt($(div).attr('board_level')) == 1){
							$(div).click(function(e){
								if(!$(e.target).hasClass('reply-edit') && !$(e.target).hasClass('reply-del') 
										&& $(this).attr('comment_del') == 0
										&& !$(e.target).hasClass('nickname')){

									//해당 댓글의 형제노드(댓글 작성란 노드)가 없으면, 댓글 작성란 노드를 해당 댓글 형제노드로 붙임. siblings : 형제노드들
									if($(this).siblings().length == 0){
										//댓글을 작성할 상위 댓글 노드의 참조 인덱스(board_ref)를 저장. board_level은 댓글들에 대한 계층 표현. 1 : 상위댓글	2 : 하위 댓글  
										$(commentReplyArea).attr('board_ref', $(this).attr('comment_no'));
										$(commentReplyArea).attr('board_level', parseInt($(this).attr('board_level')) + 1);
										$(commentReplyArea).attr('board_step', parseInt($(this).attr('board_level')) + 1);
										//다른 상위 댓글 노드를 클릭해서 댓글 작성란 노드가 표시되어 있을 수 있으므로
										//댓글 작성란 노드를 분리하여 숨김처리함. 
										var temp = $(commentReplyArea).detach();
										//현재 클릭된 상위 댓글 노드에 댓글 작성란 노드를 형제노드로 붙임.
										//append로 추가 시 commentReplyArea 클릭이 div 클릭에 포함되어 after로 변경
										$(this).after(temp);
									}else{	//현재 클릭된 상위 댓글 노드에 댓글 작성란 노드가 형제 노드로 붙어 있다고 간주. 숨김처리 해야 하므로 detach 시킴.
										$(commentReplyArea).detach();
									}
								}
							});
						}
						
						//댓글 노드 만들기
						if(comment['comment_del'] == 0){
							if(login_mem_no == comment['mem_no']){
								$(div).append(divNickname, divBtn, divContent, divDate);
							}else{
								$(div).append(divNickname, divContent, divDate);
							}
						}else{
							$(div).append(spanDelComment);
						}
						//해당 댓글 노드가 대댓글이면 이미지로 대댓글임을 표시/
						if(parseInt(comment['board_level']) > 1){
// 							var reply = $("<span/>").text("▶");
							var img = $("<img src='${pageContext.request.contextPath}/reply.png' width='15' height='15'/>");
							$(div).prepend(img);
						}
						//리스트에 댓글 노드 추가
						$(li).append(div);
						//ul에 리스트 추가
						$(ul).append(li);
					});
					//댓글란 노드에 ul 추가
					$("#commentList").append(ul);
					if(location.href.indexOf('commentList') > 0 || comment_changed){
						location.href = "#commentList";
					}
				}
			});
		}
		//처음 화면 로딩시  댓글 목록 가져오기 실행.
		refreshComments(false);
		
		$("#btnList").click(function() {
			location.href="/board/listBoard_Post.do?str=${detail.board_kinds}";
		});
		$("#btnAnswer").click(function() {
			var comment = {
				mem_no:login_mem_no
				, board_no:$("#board_no").val()
				, board_level:1
				, board_step:1
				, comment_content:$("#comment_content").val()
			}
			$.ajax({
				url:"/board/insertBoard_Comment.do"
				, type:'post'
				, data:comment
				, success:function(result){
					if(result == 1){
// 						alert("댓글이 등록되었습니다.");
						refreshComments(true);
					}
				}
			});
		});
		
	});
</script>
</head>
<body>
	<h2>${detail.board_title }</h2>
	<form name="f" method="post">
		<input type="hidden" id="board_no" name="board_no" value="${detail.board_no }">
		<div id="container">
			<div>
			 	<label for="headtag">말머리 : </label>
			 	<a href="#">${detail.head_tag_name }</a>
			</div>
			<div>
			 	<label for="write">작성자 : </label>
			 	<img src="${detail.mem_img }" style="width:30px; height:30px;"><a class="nickname" id="nickname" mem_no="${detail.mem_no }">
					${detail.mem_nickname}  
<!-- 					회원 프로필 사진 아이콘 넣기 -->
				</a>
			</div>
			
			<div>
				<label for="date">작성일자 : </label>
				<fmt:formatDate value="${detail.board_date}" pattern="yyyy-MM-dd a HH:mm:ss"/>
				&nbsp;&nbsp;&nbsp;&nbsp;
				
				<label for="hit">조회수 : </label> 
				${detail.board_hit}
			</div>
			
<!-- 			<div> -->
<!-- 				<label for="title">제목 : </label> -->
<%-- 				${detail.board_title} --%>
<!-- 			</div> -->
			
			<div class="form-group">
				<div>
					<label for="comment">내용 : </label>
					<textarea id="content" class="form-control" rows="10" readonly="readonly" style="background-color: white"></textarea><br>
				</div>
			</div>
		</div>
	</form>
	
	<c:if test="${login_mem_no eq detail.mem_no }">
		<div class="text-center" role="group">
	  		<button type="button" class="btn btn-default" id="btnUpdate">수정</button>
			<button type="button" class="btn btn-default" id="btnDelete">삭제</button>
		</div>
	</c:if>
	<hr>
	
	<!-- 댓글 -->
	<div class="form-comment-group">
		<div>
			<label for="comment_content">댓글</label>
			<textarea id="comment_content" class="form-control" rows="3" placeholder="댓글을 적어주세요." style="background-color: white"></textarea><br>
			<button class="btn btn-default" id="btnAnswer">댓글쓰기</button>	
		</div>
		<div class="commentList" id="commentList">
<!-- 			<ul> -->
<%-- 			<c:forEach var="v" items="${clist}"> --%>
<!-- 				<li> -->
<%-- 					<div class="commentDetail">${v.mem_nickname }</div> --%>
<%-- 					<div class="commentDetail">${v.comment_content }</div> --%>
<%-- 					<div class="commentDetail">${v.comment_date }</div> --%>
<!-- 				</li> -->
<%-- <%-- 					<li>${v.comment_content }</li> --%>
<%-- 			</c:forEach> --%>
<!-- 			</ul> -->
		</div>
		<button class="btn btn-default" id="btnWrite">글쓰기</button>
		
		<button class="btn btn-default" id="btnList">글목록</button>			
	</div>
	<br>
	<div class="modal fade" id="modalMessage" tabindex="-1" role="dialog"
		aria-labelledby="historyModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content"></div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>

</layoutTag:layout>