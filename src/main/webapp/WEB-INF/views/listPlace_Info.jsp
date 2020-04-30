<%@ page language="java" contentType="text/html; charset=UTF-8" xpageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>여행 목록</h2>
	<table border="1" width="80%">
		<tr>
			<td>번호</td>
			<td>이름</td>
		</tr>
		<c:forEach var="p" items="${list }">
			<tr>
				<td>${p.place_no }</td>
				<td>${p.place_name }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>