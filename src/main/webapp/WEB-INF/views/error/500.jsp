<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 이용중 문제가 발생하였습니다.</title>
</head>
<body>
	<div style="text-align:center;">
		<img src="${pageContext.request.contextPath}/notify_img/monitor_500.png" width="400" height="400"/>
	</div>
	<div class="panel panel-default">
		<div style="text-align:center;" class="jumbotron">
			<h2>죄송합니다.</h2>
			<h2>기술상의 문제로 해당 서비스 이용에</h2>
			<h2>문제가 발생하였습니다.</h2>
			<h2>동일한 증상이 반복될 경우 </h2>
			<h2>관리자에게 문의하여 주시기 바랍니다.</h2>
			<br>
			<br>
			<a class="btn btn-default" href="/main.do">메인으로</a>
		</div>
	</div>
<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>
</layoutTag:layout>