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
<title>Insert title here</title>
	<style type="text/css">
		.comment_box{
	
		}
		#container, .form-comment-group{
			padding-left: 200px;
			padding-right: 200px;
		}
		h2{
			text-align:center;
		}
		.comment_li{
			list-style: none;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#btnUpdate").click(function(){
				location.href = "updateBoard_Post?board_no="+board_no;
			})
			$("#btnDelete").click(function(){
// 				location.href = "/deleteBoard_Post.do";
			})
		})
	</script>
</head>
<body>
	<h2>상세 보기</h2>
	<form name="f" method="post">
		<div id="container">
			<input type="hidden" name="board_no" value="${detail.board_no }">
			<div>
			 	<label for="write">작성자 : </label>
			 	<a href="/myPage.do">
					<!-- ${detail.mem_nickname} --> 홍길동  <!-- 회원 프로필 사진 아이콘 넣기 -->
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
					<textarea class="form-control" rows="10" readonly="readonly" style="background-color: white">${detail.board_content }</textarea><br>
				</div>
			</div>
		<button id="btnUpdate">수정</button>
		<button id="btnDelete">삭제</button>
		</div>
		
	</form>
	
	<hr>
	
	<!-- 댓글 목록 보이게 추가해야 함 -->
	
	<!-- 댓글 -->
	<div class="form-comment-group">
		<div>
			<label for="comment">댓글</label>
			<textarea class="form-control" rows="3" placeholder="댓글을 적어주세요." style="background-color: white"></textarea><br>
		</div>
		<button class="btn btn-default" id="btnWrite">글쓰기</button>
		<button class="btn btn-default" id="btnAnswer">답글</button>	
		<button class="btn btn-default" id="btnList">글목록</button>			
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#btnList").click(function(){
				location.href="/listBoard_Post.do"
			})
			$("#btnAnswer").click(function(){
				var comment = {
					
				}
				$.post("/insertBoard_Comment.do", data:comment, {success:function(){
					location.href="detailBoard_Post.do
				}})
			})
		})
	</script>
</body>
</html>

</layoutTag:layout>