<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script src="/js/summernote-lite.js"></script> -->
<!-- <script src="/js/lang/summernote-ko-KR.js"></script> -->
<!-- <link rel="stylesheet" href="/css/summernote-lite.css"> -->
<script type="text/javascript">
	$(function() {
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
		
		$("#btnUpdate").click(function() {
			var board_title = $("#board_title").val();
			var board_content = $("#board_content").val();
			if(board_title == "") {
				alert("제목을 입력하세요.");
				document.f.board_title.focus();
				return;
			};
			if(board_content == "") {
				alert("내용을 입력하세요.");
				document.f.board_content.focus();
				return;
			};
			alert("수정되었습니다.");
		});
	});
</script>
</head>
<body>
	<h2>수정</h2>
	<form action="/insertBoard_Post.do" method="post">
	<input type="hidden" id="board_no" name="board_no" value="${update.board_no}">
	
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input type="text" name="board_title" id="board_title" size="80" placeholder="제목을 입력해주세요." required="required" value="${update.board_title}"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="mem_no" readonly="readonly" value="1"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="board_content" id="board_content" placeholder="내용을 입력해주세요." required="required" rows="30%" cols="80%">${update.board_content}</textarea></td>
		</tr>
	</table>
	<div style="width:650px; text-align: center;">
			<button type="submit" id="btnUpdate">수정</button>
			<button type="reset">취소</button>
			<a href="listBoard_Post.do">목록으로</a>
		</div>
	</form>
</body>
</html>

</layoutTag:layout>