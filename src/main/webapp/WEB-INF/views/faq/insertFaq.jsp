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
	body{
		padding:0px;
		margin:0px;
	}
	#container{
		text-align: center;
	}
	#f{
		padding-left:200px;
		padding-right:200px;
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
		<form action="/faq/insertFaq.do" method="post" id="f" name="f" class="navbar-form" class="text-align">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">

			<label for="faq_question">질문 : </label>
			<input type="text" id="faq_question" class="form-control" name="faq_question" style="width:500px;">
			<br>

			<label for="faq_answer">답변 : </label>
			<input type="text" id="faq_answer" class="form-control" name="faq_answer" style="width:500px;">
			<br>
			<br>
			
			<button type="submit" class="btn btn-default" id="insert" aria-label="Left Align">
			  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			</button>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>

</layoutTag:layout>