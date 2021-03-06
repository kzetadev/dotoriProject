<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//쪽지 답장하기 버튼 클릭
	$("#sendReply").click(function(){
		//쪽지 객체 만들기
		var message = {
			post_to:parseInt($("#historyModalLabel").attr('post_to'))
			, post_ref_no:parseInt($("#historyModalLabel").attr('post_ref_no'))
			, post_title:$("#post_title").val()
			, post_content:$("#post_content").val()
		};
		console.log(message);
		$.ajax({
			url:"/member/sendReplyMessage.do"
			, type:"post"
			, data:message
			, beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			}
			, success:function(result){
				alert("쪽지를 보냈습니다.");
				//버튼 클릭 후 모달창이 닫히지 않고 유지되고 있어서 닫기 버튼을 클릭시켜서 닫게 함.
				$("#close").click();
				location.href="/member/myPage_Message.do?msg_type=receive";	//수신쪽지함으로 새로고침
			}
		});
	});
});
</script>
</head>
<body>
	<div class="modal-header">
	    <h2 class="modal-title" id="historyModalLabel" post_to="${mem_no }" post_ref_no="${message.post_no }">${message.mem_nickname }</h2>
	    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">×</span>
	    </button>
	</div>
	<div class="modal-body">
	    <div class="table-responsive">
	        <div class="header">
				<h2>제목</h2>
				<div class="well well-sm">${message.post_title }</div>
				<h2>내용</h2>
				<div class="well well-lg">${message.post_content }</div>
			</div>
	    </div>
	    <%-- 수신 쪽지이고 답장하지 않는 쪽지만 답장란 표시 --%>
	    <c:if test="${msg_type eq 'receive' && message.post_reply ne 1}">
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">답장하기</button>
			<div id="demo" class="collapse">
	        	<div class="form-group">
		        	<label for=post_title>제목</label>
					<input class="form-control" type="text" id="post_title" name="post_title"><br>
					<label for=post_content>내용</label>
					<textarea class='form-control' rows="3" cols="30" id="post_content" name="post_content"></textarea>
	        	</div>
				<button id="sendReply" type="button" class="btn btn-default">답장</button>
			</div>
		</c:if>
	</div>
	<div class="modal-footer">
	    <button id="close" class="ui-button ui-widget ui-corner-all btn btn-info" type="button" data-dismiss="modal">닫기</button>
	</div>

	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>