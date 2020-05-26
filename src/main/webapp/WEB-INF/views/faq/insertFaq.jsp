<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 추가</title>
<style type="text/css">
	h2{
		text-align:center;
	}
	form { 
        margin: 0 auto; 
        width:250px;
    }
	@using (Html.BeginForm("Index", "Join", FormMethod.Post, new { @style = "margin: 0 auto; width: 250px" }))
</style>
</head>
<body>
	<h2>FAQ 추가</h2>
	<br>
	<form action="/faq/insertFaq.do" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
		<table border="1">
			<tr>
				<td><label for="faq_question">질문 : </label></td>
				<td><input type="text" id="faq_question" name="faq_question"></td>
			</tr>
			<tr>
				<td><label for="faq_answer">답변 : </label></td>
				<td><input type="text" id="faq_answer" name="faq_answer"></td>
			</tr>
		</table>
		<input type="submit" value="등록">
	</form>
</body>
</html>

</layoutTag:layout>