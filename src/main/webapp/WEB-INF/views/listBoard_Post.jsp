<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

</script>
</head>
<body>
	<h2>전체</h2>
	
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
				<td>
					<fmt:formatDate value="${v.board_date}" pattern="yyyy-MM-dd" />
				</td>
				<td>${v.board_hit}</td>
			</tr>
		</c:forEach>
	</table>
	<button id="btnInsert">글쓰기</button>
</body>
</html>

</layoutTag:layout>