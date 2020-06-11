<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="/css/summernote-lite.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/summernote-lite.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<style type="text/css">
	h2, #text-align{
		text-align:center;
	}
	
	body{
		padding:0px;
		margin:0px;
	}
	
	#f{
		padding-left:100px;
		padding-right:100px;
	}
	#btnGroup{
		padding-left:82px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$("#board_content").summernote({
			height:400
			, minHeight:null
			, maxHeight:null
			, focus:true
			, lang:'ko-KR'
// 			, placeholder:'최대 500자까지 작성 가능합니다.'
			, tabsize:2
// 			, airMode:true
		});

// 		// 써머노트
// 		$("#content").summernote({
// 			disableDragAndDrop : true,
// 			height: 700,
// 			minHeight: null,
// 			maxHeight: null,
// 			focus: true,
// 			lang: "ko-KR",
// 			placeholder: "본문 내용을 입력해주세요.",
// 			toolbar: [
// 			    ['style', ['style']],
// 			    ['font', ['fontsize','bold', 'italic', 'underline', 'clear']],
// 			    ['color', ['color']],
// 			    ['insert', ['picture','video']],
// 			    ['para', ['ul', 'ol', 'paragraph']],
// 			    ['table', ['table']]
			    
// 			 ],
// 			callbacks: {
// 				onImageUpload : function(files){
// 					console.log(files);
// 					$.each(files, function(idx, file){
// 						uploadSummernoteImageFile(file, $("#content"));
// 						console.log(file);
// 					});
// 				}	
// 			}
// 		})
		$.ajaxPrefilter(function(options, originalOptions, jqXHR){
			var token = "${_csrf.token}";
			jqXHR.setRequestHeader('X-CSRF-Token', token);
		});
		//var content에 jstl로 board_content를 저장 시 스크립트에 해당 내용이 노출되어
		//ajax 방식으로 변경
		$.ajax({
			url:"/board/getBoardPost.do/" + $("#board_no").val()
			, type:'get'
			, dataType:'json'
			, success:function(result){
				$("#board_content").summernote('code', result['board_content']);
			}
		});
		
// 		$("#btnUpdate").click(function() {
		$("#f").submit(function(event){
			event.preventDefault();
			var board_title = $("#board_title").val();
			var board_content = $("#board_content").summernote('code');
			if(board_title == "") {
				alert("제목을 입력하세요.");
				document.f.board_title.focus();
				return false;
			};
			if(board_content == "") {
				alert("내용을 입력하세요.");
				document.f.board_content.focus();
				return false;
			};
// 			var board = $("#f").serialize();
// 			console.log($("#board_content").val());
// 			board['board_content'] = $("#board_content").val();
// 			console.log(board);
			var board_plain_content = "";
			$(".note-editing-area p").each(function(idx, item){
				board_plain_content = board_plain_content + $(item).text() + '\n';
			});
			var board = {
				board_no:$("#board_no").val()
				, board_title:$("#board_title").val()
				, board_content:board_content
				, board_plain_content:board_plain_content
			};
			console.log(board);
			//board_plain_text:$(".note-editing-area").text()
			$.ajax({
				url:"/board/updateBoard_Post.do"
				, type:"post"
				, data:board
				, error:function(jqXHR, textStatus, errorThrown){
					
				}
				, success:function(data, jqXHR, textStatus){
					if(data == 1){
						alert("글이 수정되었습니다.");
						var boardKinds = $("#board_kinds").val();
						if(boardKinds == 1){
							location.href = "/board/listBoard_Post.do?str=1";
						}else if(boardKinds == 2){
							location.href = "/board/listBoard_Post.do?str=2";
						}else{
							location.href = "/board/listBoard_Post.do?str=3";
						}
					}
				}
			});
		});

		$("#btnList").click(function(){
			location.href="/board/listBoard_Post.do?str=3"
		})
	});
</script>
</head>
<body>
	<h2>글수정</h2>
	
	<div class="container">
		<form id="f" name="f" class="navbar-form" action="/board/insertBoard_Post.do" method="post" class="text-align">
			<input type="hidden" id="board_no" name="board_no" value="${update.board_no}">
			
			<table class="table">
				<tr>
					<td><label for="board_title">제목 : </label></td>
					<td><input type="text" class="form-control" name="board_title" id="board_title" size="80" placeholder="제목을 입력해주세요." required="required" value="${update.board_title}"></td>
				<tr>
		
				<tr>
					<td><label for="mem_nickname">작성자 : </label></td>
					<td><input type="text" class="form-control" name="mem_nickname" readonly="readonly" value="${update.mem_nickname }"></td>
				</tr>
						
				<tr>
					<td><label for="board_content">내용 : </label></td>
					<td>
						<div name="board_content" id="board_content" placeholder="내용을 입력해주세요."required="required">
						</div>
					</td>
				</tr>
			</table>

			<div class="button-group" role="group" class="text-align" id="btnGroup">
				<button type="submit" id="btnUpdate" class="btn btn-default">수정</button>
				<button type="reset" class="btn btn-default" class="btnReset">취소</button>
				<button type="button" class="btn btn-default" id="btnList">글목록</button>
			</div>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>

</layoutTag:layout>