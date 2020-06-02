<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 아이디 찾기 결과 페이지 -->
	<span style="color: green; font-weight: bold;">아이디 찾기 결과</span>

<body>
회원님의 아이디는 ${mem_id }입니다</body>
</html>
</layoutTag:layout>