<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btnSave").click(function() {
			var title = $("#title").val();
			var content = $("#content").val();
			if(title == "") {
				alert("제목을 입력하세요.");
				document.f.title.focus();
				return;
			}
			if(content == "") {
				alert("내용을 입력하세요.");
				document.f.content.focus();
				return;
			}
			document.f.submit();
		});
	});
</script>
</head>
<body>
	<h2>글쓰기</h2>
	<form name="f" action="/insertBoard_Post.do" method="post">
		글번호 <input type="hidden" name="no" value="${board_no }">
		<div>
			제목
			<input name="title" id="title" size="80" placeholder="제목을 입력해주세요.">
		</div>
		<div>
			내용
			<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요."></textarea><br>
		</div>
		<div style="width:650px; text-align: center;">
			<button type="button" id="btnSave">확인</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>

</layoutTag:layout>