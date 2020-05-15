<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>상세 보기</h2>
	<form name="f" method="post">

		<input type="hidden" name="board_no" value="${detail.board_no }">
		<div>
			작성일자  : <fmt:formatDate value="${detail.board_date}" pattern="yyyy-MM-dd a HH:mm:ss"/>
		</div>
		<div>
			조회수 : ${detail.board_hit}
		</div>
		<div>
			제목 : ${detail.board_title}
		</div>
		<div>
			작성자 : ${detail.mem_nickname}
		</div>
		<div>
			내용 :
			<textarea rows="10" cols="80" readonly="readonly">${detail.board_content }</textarea><br>
		</div> 	
	</form>
</body>
</html>