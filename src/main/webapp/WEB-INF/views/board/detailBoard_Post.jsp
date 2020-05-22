<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>게시글 상세</title>
<link href="/css/summernote-lite.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/summernote-lite.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<style type="text/css">
	.comment_box{

	}
	#container, .form-comment-group{
		padding-left: 100px;
		padding-right: 100px;
	}
	h2{
		text-align:center;
	}
	.comment_li{
		list-style: none;
	}
	#btnUpdate, btnDelete {
		position: relative;
		margin-left: 500px;
	}
	.note-editor.note-frame .note-editing-area .note-editable[contenteditable="false"], .note-editor.note-airframe .note-editing-area .note-editable[contenteditable="false"] {
		background-color: #ffffff;
	}
	.comment{
		border:1px solid gray;
		border-radius: 2px;
	}
	.commentDetail{
		display:inline-block;
	}
	li{
		list-style: none;
	}
</style>
<script type="text/javascript">
	$(function() {
		var comments;
		$("#content").summernote({
//	 		height:300
//	 		, 
			minHeight:null
			, maxHeight:null
			, focus:true
			, lang:'ko-KR'
			, placeholder:'최대 500자까지 작성 가능합니다.'
			, tabsize:2
			, backColor:'white'
			, toolbar:[]
		});
		var content = '${detail.board_content}';
		$("#content").summernote('code', content);
		$("#content").next().find(".note-editable").attr("contenteditable", false);
		var board_no = $("#board_no").val();
		$("#btnUpdate").click(function() {
			location.href = "/board/updateBoard_Post.do?board_no="+board_no;
		});
		$.ajaxPrefilter(function(options, originalOptions, jqXHR){
			var token = "${_csrf.token}";
			jqXHR.setRequestHeader('X-CSRF-Token', token);
		});
		$("#btnDelete").click(function() {
			console.log(board_no);
			var re = confirm("삭제하시겠습니까?");
			location.href = "/board/deleteBoard_Post.do?board_no="+board_no;
			alert("삭제했습니다!");
		});
		//댓글 목록 새로고침
		function refreshComments(){
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
						var div = $("<div class='comment'/>");
						var divNickname = $("<div class='commentDetail' width='50'/>").text(comment['mem_nickname']);
						var divContent = $("<div class='commentDetail' width='200'/>").text(comment['comment_content']);
						var divDate = $("<div class='commentDetail' width='100'/>").text(comment['comment_date']);
						$(div).append(divNickname, divContent, divDate);
						$(li).append(div);
						$(ul).append(li);
						$("#commentList").append(ul);
					});
				}
			});
		}
		refreshComments();
		$("#btnList").click(function() {
			location.href="/board/listBoard_Post.do";
		});
		$("#btnAnswer").click(function() {
			var comment = {
				mem_no:${mem_no}
				, board_no:$("#board_no").val()
				, comment_content:$("#comment_content").val()
			}
			$.ajax({
				url:"/board/insertBoard_Comment.do"
				, type:'post'
				, data:comment
				, success:function(result){
					if(result == 1){
						alert("댓글이 등록되었습니다.");
						refreshComments();
					}
				}
			});
		});
		
	});
</script>
</head>
<body>
	<h2>상세 보기</h2>
	<form name="f" method="post">
		<input type="hidden" id="board_no" name="board_no" value="${detail.board_no }">
		<div id="container">
			<div>
			 	<label for="write">작성자 : </label>
			 	<a href="/myPage/myPage.do">
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
			
			<div>
				<label for="title">제목 : </label>
				${detail.board_title}
			</div>
			
			<div class="form-group">
				<div>
					<label for="comment">내용 : </label>
					<textarea id="content" class="form-control" rows="10" readonly="readonly" style="background-color: white"></textarea><br>
				</div>
			</div>
		</div>
		
	</form>
	<button id="btnUpdate">수정</button>
	<button id="btnDelete">삭제</button>
	
	<hr>
	
	<!-- 댓글 -->
	<div class="form-comment-group">
		<div>
			<label for="comment_content">댓글</label>
			<textarea id="comment_content" class="form-control" rows="3" placeholder="댓글을 적어주세요." style="background-color: white"></textarea><br>
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
		<button class="btn btn-default" id="btnAnswer">답글</button>	
		<button class="btn btn-default" id="btnList">글목록</button>			
	</div>
</body>
</html>
</layoutTag:layout>

