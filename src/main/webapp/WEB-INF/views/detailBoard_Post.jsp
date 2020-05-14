<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btnUpdate").click(function() {
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
			document.f.action="/updateBoard_Post.do";
			document.f.submit();
		});
		
		$("#btnDelete").click(function() {
			if(confirm("삭제하시겠습니까?")) {
				document.f.action = "/deleteBoard_Post.do";
				document.f.submit();
			}
		});
	});
</script>
</head>
<body>
	<h2>게시글 상세</h2>
	<form name="f" method="post">
		<div>
			글번호
			${detail.board_no }
			말머리
			${detail.head_tag_name }
		</div>
		<div>
			글제목
			<input name="title" size="80" value="${detail.title }" placeholder="제목을 입력해주세요">
		</div>
		<div>
			작성자
			${detail.mem_nickname }
		</div>
		<div>
			작성일 <fmt:formatDate value="${detail.regdate }" pattern="yyyy-MM-dd a HH:mm:ss" />
		</div>
	</form>
	글내용 : <br>
	<textarea rows="10" cols="80" readonly="readonly">${b.content }</textarea><br>
	<button type="button" id="btnUpdate">수정</button>
	<button type="button" id="btnDelete">삭제</button>
</body>
</html>

</layoutTag:layout>