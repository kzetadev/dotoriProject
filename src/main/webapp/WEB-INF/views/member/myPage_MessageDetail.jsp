<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header">
	    <h2 class="modal-title" id="historyModalLabel" post_ref_no="${message.post_no }">${message.mem_nickname }</h2>
	    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">×</span>
	    </button>
	</div>
	<div class="modal-body">
	    <div class="table-responsive">
	        <div class="container">
				<h2>제목</h2>
				<div class="well well-sm">${message.post_title }</div>
				<h2>내용</h2>
				<div class="well well-lg">${message.post_content }</div>
			</div>
	    </div>
		<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">Simple collapsible</button>
		<div id="demo" class="collapse">
		  Lorem ipsum dolor sit amet, consectetur adipisicing elit,
		  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
		  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
		</div>
	</div>
	<div class="modal-footer">
	    <button class="ui-button ui-widget ui-corner-all" id="send" type="button" data-dismiss="modal">보내기</button>
	    <button class="ui-button ui-widget ui-corner-all" type="button" data-dismiss="modal">취소</button>
	</div>
	<form>
		
		<!-- 		<div class="form-group"> -->
		<!-- 			<label for="mem_nickname">발신자</label>  -->
		<%-- 			<input type="text" class="form-control" id="mem_nickname" name="mem_nickname" value="${message.mem_nickname }" readonly="readonly"> --%>
		<!-- 		</div> -->
		<!-- 		<div class="form-group"> -->
		<!-- 			<label for="post_regidate">발신일</label>  -->
		<%-- 			<input type="text" class="form-control" id="post_regidate" name="post_regidate" value="${message.post_regidate }" readonly="readonly"> --%>
		<!-- 		</div> -->
		<!-- 		<div class="form-group"> -->
		<!-- 			<label for="pwd">제목</label> -->
		<%-- 			<input type="text" class="form-control" id="post_title" name="post_title" value="${message.post_title }" readonly="readonly"> --%>
		<!-- 		</div> -->
		<!-- 		<div class="checkbox"> -->
		<!-- 			<label><input type="checkbox"> Remember me</label> -->
		<!-- 		</div> -->
		<!-- 		<button type="submit" class="btn btn-default">Submit</button> -->
	</form>
</body>
</html>