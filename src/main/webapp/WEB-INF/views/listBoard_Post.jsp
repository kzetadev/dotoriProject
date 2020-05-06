<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#btnInsert").click(function(){
		location.href="/insertBoard_Post"
	})
})
</script>
</head>
<body>
<h2>커뮤니티 글 목록</h2>
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
			<td>${v.mem_no}</td>
			<td>${v.board_date}</td>
			<td>${v.board_hit}</td>
		</tr>
		</c:forEach>
	</table>
	<button id="btnInsert">글쓰기</button>
</body>
</html>