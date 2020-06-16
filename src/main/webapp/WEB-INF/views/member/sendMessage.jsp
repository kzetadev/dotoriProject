<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".container").css({"min-height": "100px"});
	$("#send").click(function(){
		var message = {
			post_to:parseInt($("#historyModalLabel").attr('post_to'))
			, post_title:$("#post_title").val()
			, post_content:$("#post_content").val()
		};
		console.log(message);
		$.ajax({
			url:"/member/sendMessage.do"
			, type:"post"
			, data:message
			, beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			}
			, success:function(result){
				alert("쪽지를 보냈습니다.");
// 				$(".modal-header").hide();
			}
		});
	});
});
</script>
</head>
<body>
	<div class="modal-header">
	    <h2 class="modal-title" id="historyModalLabel" post_to="${mem_no}">${sendNick } 님에게 쪽지 보내기</h2>
	    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">×</span>
	    </button>
	</div>
	<div class="modal-body">
	    <div class="table-responsive">
	        <div class="container">
	        </div>
	        <form id="form" action="" method="post">
	        	<div class="form-group">
		        	<label for=post_title>제목</label>
					<input class="form-control" type="text" id="post_title" name="post_title"><br>
					<label for=post_content>내용</label>
					<textarea class='form-control' rows="3" cols="30" id="post_content" name="post_content"></textarea>
	        	</div>
			</form>
	    </div>
	
	</div>
	<div class="modal-footer">
	    <button class="ui-button ui-widget ui-corner-all btn btn-info" id="send" type="button" data-dismiss="modal">보내기</button>
	    <button class="ui-button ui-widget ui-corner-all btn btn-info" type="button" data-dismiss="modal">취소</button>
	</div>
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>