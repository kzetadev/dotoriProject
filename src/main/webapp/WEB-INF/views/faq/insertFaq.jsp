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
	#container{
		text-align: center;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#insert").click(function(){
			jAlert("등록 되었습니다.", "등록", function(){
				location.href = "/faq/listFaq.do"
			})
		})
	})
</script>
</head>
<body>
	<h2>FAQ 추가</h2>
	<br>
	<div id="container">	
		<form action="/faq/insertFaq.do" method="post">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			<table border="1">
				<tr>
					<td><label for="faq_question">질문 : &nbsp;</label></td>
					<td><textarea rows="2" cols="80" id="faq_question" name="faq_question"></textarea></td>
				</tr>
				<tr>
					<td><label for="faq_answer">답변 : &nbsp;</label></td>
					<td><textarea rows="2" cols="80" type="text" id="faq_answer" name="faq_answer"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="등록" id="insert">
		</form>
	</div>
</body>
</html>

</layoutTag:layout>