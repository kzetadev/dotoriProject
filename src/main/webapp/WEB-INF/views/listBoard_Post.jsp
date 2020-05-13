<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체게시판 글 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btnInsert").click(function() {
			location.href = "/insertBoard_Post.do";
		});
	});

// 	//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해
// 	function list(page){
// 		location.href = "${path}/listBoard_Post?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
// 	}
</script>
</head>
<body>
	<h2>전체</h2>
	
<%-- 	<form name="form1" method="post" action="${path}/listBoard_Post"> --%>
<!-- 		<select name="searchOption"> -->
<%-- 			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+내용</option> --%>
<%-- 			<option value="mem_nickname" <c:out value="${map.searchOption == 'mem_nickname'?'selected':''}"/> >이름</option> --%>
<%-- 			<option value="board_content" <c:out value="${map.searchOption == 'board_content'?'selected':''}"/> >내용</option> --%>
<%-- 			<option value="board_title" <c:out value="${map.searchOption == 'board_title'?'selected':''}"/> >제목</option> --%>
<!-- 		</select> -->
<%-- 		<input name="keyword" value="${map.keyword}"> --%>
<!-- 		<input type="submit" value="조회"> -->
<!-- 	</form> -->

	<table border="1" width="80%">
		<tr>
			<th>글번호</th>
			<th>말머리</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="v" items="${list}">
			<tr>
				<td>${v.board_no}</td>
 				<td>${v.head_tag_name}</td>
				<td>
					<a href="detailBoard_Post.do?board_no=${v.board_no}">${v.board_title}</a>
				</td>
				<td>${v.mem_nickname}</td>
				<td>${v.board_date}</td>
				<td>${v.board_hit}</td>
			</tr>
		</c:forEach>
	</table>
	<button id="btnInsert">글쓰기</button>
</body>
</html>

</layoutTag:layout>