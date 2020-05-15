<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			$.ajax("/insertBoard_Comment.do", success:function(){
				alert("댓글이 추가됨")
			})
		})
	})
</script>
<meta charset="UTF-8">
<title>댓글 추가</title>
</head>
<body>
	<h2>댓글 목록</h2>
	<hr>
	<textarea rows="10" cols="80" id="textarea"></textarea>
	<button id="btn">댓글 추가</button>
</body>
</html>

</layoutTag:layout>