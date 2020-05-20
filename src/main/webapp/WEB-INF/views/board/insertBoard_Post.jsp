<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
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

//		// select-option 변경 function 예시
// 	function itemChange(){
		 
// 		var keyboard = ["갈축","청축","적축"];
// 		var mouse = ["광마우스","유선마우스","비싼마우스","미키마우스"];
// 		var monitor = ["17인치","22인치","24인치","26인치"];
		 
// 		var selectItem = $("#select1").val();
		 
// 		var changeItem;
		  
// 		if(selectItem == "키보드"){
// 		  changeItem = keyboard;
// 		}
// 		else if(selectItem == "마우스"){
// 		  changeItem = mouse;
// 		}
// 		else if(selectItem == "모니터"){
// 		  changeItem =  monitor;
// 		}
		 
// 		$('#select2').empty();
		 
// 		for(var count = 0; count < changeItem.size(); count++){                
// 		                var option = $("<option>"+changeItem[count]+"</option>");
// 		                $('#select2').append(option);
// 		            }
		 
// 		}

		$("#btnSave").click(function() {
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
		});

// 		// 복사기능 체크
// 		function CheckCopy("form") {
// 			//'확인' 버튼을 클릭했을 때 실행되는 메서드
// 	        var msg = "";

// 	        if(form.c.checked)
// 		        msg += form.c.value + "\n";
// 	        alert(msg);
// 		}
	});
</script>
</head>
<body>
	<h2>글쓰기</h2>
	<form name="f" action="/board/insertBoard_Post.do" method="post">
	<input type="hidden" name="board_no" value="${board_no }">
	<table border="1">
<!-- 		select-option 변경 예시 -->
<!-- 		<select id="select1" onchange="itemChange()"> -->
<!-- 			<option>키보드</option> -->
<!-- 			<option>마우스</option> -->
<!-- 			<option></option> -->
<!-- 		</select> -->
		 
<!-- 		<select id="select2"> -->
<!-- 		</select> -->

		<tr>
			<select name="board_kinds">
				<option value="${board_kinds=1}">자유</option>
				<option value="${board_kinds=2}">후기</option>
				<option value="${board_kinds=3}">동행</option>
			</select>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="board_title" id="board_title" size="80" placeholder="제목을 입력해주세요." required="required"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="mem_no" id="mem_no" readonly="readonly" value="1"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="board_content" id="board_content" placeholder="내용을 입력해주세요." required="required"></textarea></td>
<%-- 		<textarea name="editordata" id="summernote" value="${board_content }"></textarea><br> --%>
<!-- 		<form name="cc"> -->
<!-- 			복사 가능<input type="checkbox" name="c" value="복사 가능"><br> -->
<!-- 		</form> -->
		</tr>
	</table>
		<div style="width:650px; text-align: center;">
			<button type="submit" id="btnSave">등록</button>
			<button type="reset">취소</button>
			<a href="/board/listBoard_Post.do">목록으로</a>
		</div>
	</form>
</body>
</html>

</layoutTag:layout>