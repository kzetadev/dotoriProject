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
<script src="/js/summernote-lite.js"></script>
<script src="/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote-lite.css">
<script type="text/javascript">
	$(function() {
		$("#btnSave").click(function() {
			var title = $("#title").val();
			var content = $("#summernote").val();
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

		// 써머노트 에디터
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});

		// 복사기능 체크
		function CheckCopy("form") {
			//'확인' 버튼을 클릭했을 때 실행되는 메서드
	        var msg = "";

	        if(form.c.checked)
		        msg += form.c.value + "\n";

	        alert(msg);
		}		
	});
</script>
</head>
<body>
	<h2>글쓰기</h2>
	<form name="f" action="/insertBoard_Post.do" method="post">
		글번호<input type="hidden" name="no" value="${board_no }">
		<select name="selectBox" id="selectBox">
			<c:forEach var="b" items="${list }">
				게시판 <option value=${b.board_kinds }>
				말머리 <option value="${b.head_tag_name }">
			</c:forEach>
		</select>
		<div>
			제목
			<input name="title" id="title" size="80" value="${board_title }" placeholder="제목을 입력해주세요.">
		</div>
		<div>
			내용
			<textarea name="editordata" id="summernote" value="${board_content }"></textarea><br>
		</div>
		<form name="cc">
			<input type="checkbox" name="c" value="복사 가능"><br>
		</form>
		<div style="width:650px; text-align: center;">
			<button type="button" id="btnSave">확인</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>

</layoutTag:layout>