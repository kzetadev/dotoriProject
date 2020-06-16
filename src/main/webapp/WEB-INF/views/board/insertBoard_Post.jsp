<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link href="/css/summernote-lite.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/js/summernote-lite.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<style type="text/css">
	h2{
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
		//글작성 버튼을 클릭한 게시글 목록의 게시판 종류로 클릭시킴
		$("#board_kinds").val("${board_kinds}").prop("selected", true);
		$("#board_content").summernote({
			height:300
			, minHeight:null
			, maxHeight:null
			, focus:true
			, lang:'ko-KR'
// 			, placeholder:'최대 500자까지 작성 가능합니다.'
			, tabsize:2
// 			, airMode:true
		});
		$.ajaxPrefilter(function(options, originalOptions, jqXHR){
			var token = "${_csrf.token}";
			jqXHR.setRequestHeader('X-CSRF-Token', token);
		});
		//게시판 종류 클릭에 따른 말머리 목록 가져오기
		function showHeadTag(idx){
			$.ajax({
				url:'/board/listHead_Tag.do/' + idx
				, type:'get'
				, dataType:'JSON'
				, success:function(result){
					//말머리 콤보박스 내용 초기화
					$("#head_tag_div").empty();
					var select = $("<select id='head_tag_no' class='form-control' name='head_tag_no' />");
					$.each(result, function(idx, headtag){
						//클릭한 게시판에 해당하는 말머리 목록 만들기
						var option = $("<option/>").val(headtag['head_tag_no']).text(headtag['head_tag_name']);
						$(select).append(option);
					});
					$("#head_tag_div").append(select);
				}
			})
		}
		//페이지가 처음 로드될 때 선택되어있는 게시판으로 말머리 목록 만들기
		showHeadTag($("#board_kinds").val());
		//게시판 클릭할 떄 마다 말머리 목록 새로고침
		$("#board_kinds").change(function(){
			showHeadTag($(this).val());
		});
		
		$("#f").submit(function(event){
			event.preventDefault();
			var board_title = $("#board_title").val();
			//썸머노트 함수를 사용해서 본문에 있는 태그들을 가져옴. 글 상세보기, 글 수정에서 바로 사용할 수 있도록 해당 구문으로 사용.
			var board_content = $("#board_content").summernote('code');
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
// 			var board = $("#f").serialize();
// 			console.log(board);
			//본문에 포함된 평문(board_content는 태그들과 같이 저장) 내용 만드는 부분. 글 검색할 때 사용.
			var board_plain_content = "";
			$(".note-editing-area p").each(function(idx, item){		//보통 p 태그로 감싸져 있으므로 p 태그만 다 가져와서 텍스트만 추출
				board_plain_content = board_plain_content + $(item).text() + '\n';		//$(item).text() -> p 태그의 텍스트		\n -> 줄바꿈
			});
			console.log(board_plain_content);
			var board = {
				board_no:$("#board_no").val()
				, mem_no:$("#mem_no").val()
				, board_kinds:$("#board_kinds").val()
				, board_title:$("#board_title").val()
				, board_content:board_content
				, head_tag_no:$("#head_tag_no").val()
				, board_plain_content:board_plain_content
			};
			$.ajax({
				url:"/board/insertBoard_Post.do"
				, type:"post"
				, data:board
				, error:function(jqXHR, textStatus, errorThrown){
				}
				, success:function(data, jqXHR, textStatus){
					if(data == 1){
						alert("글이 등록되었습니다.");
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

// 		// 복사기능 체크
// 		function CheckCopy("form") {
// 			//'확인' 버튼을 클릭했을 때 실행되는 메서드
// 	        var msg = "";

// 	        if(form.c.checked)
// 		        msg += form.c.value + "\n";
// 	        alert(msg);
// 		}

		$("#btnList").click(function(){
			location.href="/board/listBoard_Post.do?str=3"
		})
		
		$("#btnReset").click(function(){
			
		})
	});
</script>
</head>
<body>
	<h2>글쓰기</h2>
	
	<div class="container">
		<form id="f" name="f" class="navbar-form" action="/board/insertBoard_Post.do" method="post" class="text-align">
			<input type="hidden" id="mem_no" name="mem_no" value="${member.mem_no }">
			
			<table class="table">
				<tr>
					<td><label for="board_kinds">게시판  : </label></td>
					<td>
						<select class="form-control" id="board_kinds" name="board_kinds">
							<option value="1">자유</option>
							<option value="2">후기</option>
							<option value="3">동행</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label for="head_tag_no">말머리 : </label></td>
					<td>
						<div id="head_tag_div" id="head_tag">
						</div>
					</td>
				</tr>
		
				<tr>
					<td><label for="board_title">제목 : </label></td>
					<td><input type="text" class="form-control" name="board_title" id="board_title" size="80" placeholder="제목을 입력해주세요." required="required"></td>
				</tr>
		
				<tr>
					<td><label for="mem_nickname">작성자 : </label></td>
					<td><input type="text" class="form-control" name="mem_nickname" id="mem_nickname" readonly="readonly" value="${member.mem_nickname }"></td>
				</tr>
		
				<tr>
					<td><label for="board_content">내용 : </label></td>
					<td>
						<div name="board_content" id="board_content" placeholder="내용을 입력해주세요." required="required">
						</div>
					</td>
				</tr>
			</table>
			
			<div class="button-group" role="group" class="text-align" id="btnGroup">
				<button type="submit" id="btnSave" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default" class="btnReset">취소</button>
				<button type="button" class="btn btn-default" id="btnList">글목록</button> 
			</div>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>

</layoutTag:layout>