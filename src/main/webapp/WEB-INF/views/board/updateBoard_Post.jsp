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
						alert("수정되었습니다.");
						location.href = "/board/listBoard_Post.do";
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>수정</h2>
	<form id="f" action="/board/insertBoard_Post.do" method="post">
		<input type="hidden" id="board_no" name="board_no" value="${update.board_no}">
		
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title" id="board_title" size="80" placeholder="제목을 입력해주세요." required="required" value="${update.board_title}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="mem_nickname" readonly="readonly" value="${update.mem_nickname }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><div name="board_content" id="board_content" placeholder="내용을 입력해주세요."required="required" rows="30%" cols="80%" ></div></td>
			</tr>
		</table>
		<div style="width:650px; text-align: center;">
			<button type="submit" id="btnUpdate">수정</button>
			<button type="reset">취소</button>
			<a href="/board/listBoard_Post.do">목록으로</a>
		</div>
	</form>
</body>
</html>

</layoutTag:layout>