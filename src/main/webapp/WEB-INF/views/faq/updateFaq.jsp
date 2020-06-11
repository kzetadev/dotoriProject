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
	body{
		padding:0px;
		margin:0px;
	}
	#container{
		text-align:center;
	}
	#f{
		padding-left:200px;
		padding-right:200px;
	}
</style>
</head>
<body>
	<h2>FAQ 수정</h2>
	<br>
	
	<div id="container">
		<form action="/faq/updateFaq.do" method="post" id="f" name="f" class="navbar-form" class="text-align">
			<input type="hidden" id="faq_no" name="faq_no" value="${f.faq_no }">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			
			<label for="faq_question">질문 : </label>
			<input type="text" id="faq_question" class="form-control" name="faq_question" value="${f.faq_question }" style="width:500px;">
			<br>
		
			<label for="faq_answer">답변 : </label>
			<input type="text" id="faq_answer" class="form-control" name="faq_answer" value="${f.faq_answer }" style="width:500px;">
			<br>
			<br>
		
			<button type="submit" class="btn btn-default" id="insert" aria-label="Left Align">
			  	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
			</button>
		</form>
	</div>
</body>
</html>

</layoutTag:layout>