<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>안녕하세요 ${param.mem_id }님 </h3><br>
<p>회원가입이 정상적으로 이루어졌습니다.</p><br>
<p>로그인 페이지로 이동하기</p><br>
<a href="${pageContext.request.contextPath}/login.do"></a>

</body>
</html>