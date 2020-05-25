<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<style type="text/css">
	h2{
		text-align:center;
	}
</style>
</head>
<body>
	<h2>FAQ 수정</h2>
	<br>
	<form action="/faq/updateFaq.do" method="post">
		<input type="hidden" id="faq_no" name="faq_no" value="${f.faq_no }">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
		<table border="1">
			<tr>
				<td><label for="faq_question">질문을 추가해주세요 : </label></td>
				<td><input type="text" id="faq_question" name="faq_question" value="${f.faq_question }"></td>
			</tr>
			<tr>
				<td><label for="faq_answer">답변을 추가해주세요 : </label></td>
				<td><input type="text" id="faq_answer" name="faq_answer" value="${f.faq_answer }"></td>
			</tr>
		</table>
		<input type="submit" value="수정">
	</form>
</body>
</html>

</layoutTag:layout>