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
	#t{
		margin-left:420px;
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
			<table border="1" id="t">
				<tr>
					<td><label for="q">질문 : </label></td>
					<td><input type="text" id="faq_question" name="faq_question" width="500"></td>
				</tr>
					
				<tr>
					<td><label for="a">답변 : </label></td>
					<td><input type="text" id="faq_answer" name="faq_answer" width="500"></td>
				</tr>
				
			</table>
			
			<br>
			<button type="submit" class="btn btn-default" id="insert" aria-label="Left Align">
			  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			</button>
		</form>
	</div>
</body>
</html>

</layoutTag:layout>