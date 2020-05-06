<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 글 목록</title>
<script type="text/javascript">
	$(function() {
		$("#btnInsert").click(function() {
			location.href = "/insertBoard_Post"
		});
	});
</script>
</head>
<body>
	<h2>자유</h2>
	<table border="1" width="80%">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="v" items="${list}">
			<tr>
				<td>${v.board_no}</td>
 				<td>${v.mem_no}</td>	<%-- 수정필요 --%>
				<td>${v.board_date}</td>
				<td>${v.board_hit}</td>
			</tr>
		</c:forEach>
	</table>
	<button id="btnInsert">글쓰기</button>
</body>
</html>

</layoutTag:layout>