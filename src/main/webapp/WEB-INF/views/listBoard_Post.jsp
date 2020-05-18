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

		$("#btnSelect").click(function() {
	         var sel1 = document.getElementById("sel1").value;
	         var sel2 = document.getElementById("sel2").value;
	         var keyword2 = sel1+"@"+sel2;
	         location.href = "/listBoard_Post.do?search="+encodeURI(keyword2);
	      });
			
	});

</script>
</head>
<body>
	<h2>전체</h2>
	
	  <select id = "sel1">
      <option value = "1"> 전체 </option>
      <option value = "2"> 제목 </option>
      <option value = "3"> 내용 </option>
   </select>
   
   <input type = "TEXT" id = "sel2" size = '20'>
   <button id="btnSelect">조회</button>
	
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