<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#send").click(function(){
		var message = {
			post_to:parseInt($("#historyModalLabel").attr('post_to'))
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
	    <h2 class="modal-title" id="historyModalLabel" post_to="${mem_no}">${sendNick } 님에게 쪽지 보내기</h5>
	    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">×</span>
	    </button>
	</div>
	<div class="modal-body">
	    <div class="table-responsive">
	        <div class="container">
	        </div>
	        <form id="form" action="" method="post">
				<h3 style=>내용</h3>
				<textarea rows="3" cols="30" id="post_content" name="post_content"></textarea>
<!-- 				<input id="submit" type="submit" value="Submit"> -->
			</form>
<!-- 	        <table class="table table-hover"> -->
<!-- 	            <thead class="text-center"> -->
<!-- 	            <tr class="content"> -->
<!-- 	                <th class="text-center"> -->
<!-- 	                    ID -->
<!-- 	                </th> -->
<!-- 	                <th class="text-center"> -->
<!-- 	                    PassWord -->
<!-- 	                </th> -->
<!-- 	            </tr> -->
<!-- 	            </thead> -->
<!-- 	            <tbody class="text-center"> -->
<%--  	            <c:forEach items="${Moa}" var="Moa"> --%> 
<!--  	                <tr class="content" style="font-size: 12px;"> --> 
<%--  	                    <td class="text-center">${Moa.id }</td> --%> 
<%--  	                    <td class="text-center">${Moa.password}</td> --%> 
<!--  	                </tr> --> 
<!--  	            </c:forEach> --> 
<!-- 	            </tbody> -->
<!-- 	        </table> -->
	    </div>
	
	</div>
	<div class="modal-footer">
	    <button class="ui-button ui-widget ui-corner-all" id="send" type="button" data-dismiss="modal">보내기</button>
	    <button class="ui-button ui-widget ui-corner-all" type="button" data-dismiss="modal">취소</button>
	</div>
</body>
</html>