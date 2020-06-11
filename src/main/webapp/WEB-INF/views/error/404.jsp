<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾을 수 없습니다.</title>
</head>
<body>
	<div style="text-align:center;">
		<img src="${pageContext.request.contextPath}/notify_img/monitor_404.png" width="400" height="400"/>
	</div>
	<div class="panel panel-default">
<!-- 		<div class="panel-body"> -->
<!-- 			<div class="alert alert-warning"> -->
<!-- 				<span class=" glyphicon glyphicon-exclamation-sign"></span> -->
				<div style="text-align:center;" class="jumbotron">
					<h2>요청하신 페이지가 제거되었거나</h2>
					<h2>일시적으로 사용이 중단되었습니다.</h2>
					<br>
					<br>
					<a class="btn btn-default" href="/main.do">메인으로</a>
				</div>
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>
</layoutTag:layout>