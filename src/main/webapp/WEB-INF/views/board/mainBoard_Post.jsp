<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btnAdd").click(function(){
			location.href = "/board/listBoard_Post.do"
			})
		})
</script>
</head>
<body>
<h2>커뮤니티 메인</h2>
<div>
	<h5>최신글</h5>
	<button id="btnAdd">더 보기</button>
	<ul>
		<c:forEach var="v" items="${mlist1}">
			<li>${v.board_content }</li>
		</c:forEach>
	</ul>
</div>
<div>
	<h5>인기글</h5>
	<button id="btnAdd">더 보기</button>
	<ul>
		<c:forEach var="v" items="${mlist2}">
			<li>${v.board_content }</li>
		</c:forEach>
	</ul>
</div>
<div>
	<h5>후기 게시판</h5>
	<button id="btnAdd">더 보기</button>
	<ul>
		<c:forEach var="v" items="${mlist3}">
			<li>${v.board_content }</li>
		</c:forEach>
	</ul>
</div>
<div>
	<h5>동행 게시판</h5>
	<button id="btnAdd">더 보기</button>
	<ul>
		<c:forEach var="v" items="${mlist4}">
			<li>${v.board_content }</li>
		</c:forEach>
	</ul>
</div>

<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>

</layoutTag:layout>