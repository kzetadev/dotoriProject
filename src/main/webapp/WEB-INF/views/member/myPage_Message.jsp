<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
*{
  margin:0; padding:0;
  font-size:15px; 
  line-height:1.3;
}
th,td {
	text-align: center;
}
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
<%-- Float the list items side by side --%>
.tab li {
	float: left;
}
<%-- Style the links inside the list items --%>
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
<%-- Style the tab content --%>
.tabcontent {
	display: none;
<%--	background-color: rgb(0, 154, 200); --%>
	padding: 6px 12px;
	color: #fff;
}

ul.tab li.current {
	<%--background-color: rgb(0, 154, 200); --%>
	color: #222;
	 display:  inline-block;
  width:20%; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
}

.tabcontent.current {
	display: block;
}
<%-- Remove the navbar's default margin-bottom and rounded borders --%>
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

<%-- Set height of the grid so .sidenav can be 100% (adjust as needed) --%>
.row.content {
	height: 450px
}

<%-- Set gray background color and 100% height --%>
.sidenav {
	padding-top: 20px;
	background-color: white;
	height: 100%;
}

<%-- On small screens, set height to 'auto' for sidenav and grid --%>
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

a {
	color: #337ab7;
	text-decoration: none;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#${msg_type}").addClass("active");
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})

		$(".message").click(function(){
			jQuery.noConflict();
			$("#modalMessage .modal-content")
				.load("/member/myPage_MessageDetail.do?post_no=" + parseInt($(this).attr('post_ref_no')) 
					+ "&mem_no=" + parseInt($(this).attr('mem_no'))
					+ "&msg_type=" + $(this).attr('msg_type'), function(){
				alert("load was performed");
				$("#modalMessage").modal();
// 				$("#modalMessage").modal('hide');
			});
// 			$.ajax({
// 				url:"/member/myPage_MessageDetail.do"
// 				, type:"post"
// 				, data:{
// 					post_no:parseInt($(this).attr('post_ref_no'))
// 				}
// 				, beforeSend:function(xhr){
// 					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 				}
// 				, success:function(result){
// 				}
// 			});
// 			jQuery.noConflict();
// 			$("#modalMessage .modal-content")
// 				.load("/member/sendReplyMessage.do?mem_no=" + $(this).attr('mem_no') 
// 					+ "&mem_nickname=" + $(this).attr('mem_nickname')
// 					+ "&post_ref_no=" + $(this).attr('post_ref_no'), function(){
// 				alert("load was performed");
// 				$("#modalMessage").modal();
// 			});
		});
	});
</script>
</head>
<body>
	<div class="container-fluid text-center">
		<br>
		<div class="row content">
			<!-- 좌측 메뉴 -->
			<div class="col-sm-2 sidenav">
				<!-- 사이드바 메뉴목록 -->
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="/member/myPage.do">마이페이지</a>
						</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="/member/myPage_Contents.do" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						<c:if test="${other_mem_no eq null }">
						<li class="list-group-item"><a href="/member/myPage_Favorite.do">찜목록</a></li>
						<li class="list-group-item"><a href="/member/myPage_Message.do">쪽지함</a></li>
						<li class="list-group-item"><a href="/member/myPage_update.do">회원 수정</a></li>
						<li class="list-group-item"><a href="/member/pwd_update.do">비밀번호 변경</a></li>
						</c:if>
					</ul>
				</div>
			</div>

			<!-- 내용 -->
			<div class="col-sm-10 text-left">
				<h1>나의 쪽지함</h1>
				<hr>
				<div class="col-sm-10 text-left">
					<hr>
					<!-- 탭 부분 (전체와 place_type으로 구분) -->
					<ul class="nav nav-tabs">
					  <li role="presentation" id="send">
					  	<a href="/member/myPage_Message.do">발신</a>
					  </li>
					  <li role="presentation" id="receive">
					  	<a href="/member/myPage_Message.do?msg_type=receive"">수신</a>
					  </li>
					</ul>
					
					
<!-- 					<div class="panel panel-primary"> -->
						<div class="container">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr style="border-bottom: 2px double #dddddd;">
											<th>제목</th>
											<th>내용</th>
											<th>닉네임</th>
											<th>읽음</th>
											<th>발신일</th>
										</tr>
									</thead>
									<c:forEach var="msg" items="${msgList}">
										<tr mem_no="${msg.mem_no }"
											mem_nickname="${msg.mem_nickname }" 
											post_ref_no="${msg.post_no }" class="message"
											msg_type="${msg_type }"
											style="border-bottom: 1px double #dddddd;">
											<td><c:out value="${msg.post_title}" /></td>
											<td><c:out value="${msg.post_content}" /></td>
											<td><c:out value="${msg.mem_nickname}" /></td>
											<td><c:out value="${msg.post_read }" /></td>
											<td><c:out value="${msg.post_regidate}" /></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						
						<!-- 페이징 처리 -->
						<ul class="pagination pagination-lg">
							<c:if test="${start_page > 1}">
								<li>
									<a href="/member/myPage_Message.do?${msg_type_str}${other_mem_no_str}&pageNum=${start_page - 1}" aria-label="이전">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							<c:forEach var="i" begin="${start_page }" end="${end_page }">
								<li><a href="/member/myPage_Message.do?${msg_type_str}${other_mem_no_str}&pageNum=${i}">${i }</a></li>
							</c:forEach>
							
							<c:if test="${end_page < total_page }">
								<li>
									<a href="/member/myPage_Message.do?${msg_type_str}${other_mem_no_str}&pageNum=${end_page + 1}" aria-label="다음">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
<!-- 					</div> -->

<!-- 					<div id="tab2" class="tabcontent"> -->
<!-- 						<div class="container"> -->
<!-- 							<div class="table-responsive"> -->
<!-- 								<table class="table"> -->
<!-- 									<thead> -->
<!-- 										<tr style="border-bottom: 2px double #dddddd;"> -->
<!-- 											<th>제목</th> -->
<!-- 											<th>내용</th> -->
<!-- 											<th>닉네임</th> -->
<!-- 											<th>읽음</th> -->
<!-- 											<th>발신일</th> -->
<!-- 										</tr> -->

<!-- 									</thead> -->

<%-- 									<c:forEach var="send" items="${sendMsg}"> --%>
<!-- 										<tr style="border-bottom: 1px double #dddddd;"> -->
<%-- 											<td><c:out value="${send.post_title}" /></td> --%>
<%-- 											<td><c:out value="${send.post_content}" /></td> --%>
<%-- 											<td><c:out value="${send.mem_nickname}" /></td> --%>
<%-- 											<td><c:out value="${send.post_read }" /></td> --%>
<%-- 											<td><c:out value="${send.post_regidate}" /></td> --%>

<!-- 										</tr> -->
<%-- 									</c:forEach> --%>

<!-- 								</table> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div id="tab3" class="tabcontent"> -->
<!-- 						<div class="container"> -->
<!-- 							<div class="table-responsive"> -->
<!-- 								<table class="table"> -->
<!-- 									<thead> -->
<!-- 										<tr style="border-bottom: 2px double #dddddd;"> -->
<!-- 											<th>제목</th> -->
<!-- 											<th>내용</th> -->
<!-- 											<th>닉네임</th> -->
<!-- 											<th>읽음</th> -->
<!-- 											<th>발신일</th> -->
<!-- 										</tr> -->

<!-- 									</thead> -->

<%-- 									<c:forEach var="receive" items="${receiveMsg}"> --%>
<%-- 										<tr mem_no="${receive.mem_no }" --%>
<%-- 											mem_nickname="${receive.mem_nickname }"  --%>
<%-- 											post_ref_no="${receive.post_no }" class='receiveMsg' --%>
<!-- 											style="border-bottom: 1px double #dddddd;"> -->
<%-- 											<td><c:out value="${receive.post_title}" /></td> --%>
<%-- 											<td><c:out value="${receive.post_content}" /></td> --%>
<%-- 											<td><c:out value="${receive.mem_nickname}" /></td> --%>
<%-- 											<td><c:out value="${receive.post_read }" /></td> --%>
<%-- 											<td><c:out value="${receive.post_regidate}" /></td> --%>

<!-- 										</tr> -->
<%-- 									</c:forEach> --%>
<!-- 								</table> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
			
			<!-- https://badstorage.tistory.com/18 -->
			<div class="modal fade" id="modalMessage" tabindex="-1" role="dialog"
				aria-labelledby="historyModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl" role="document">
					<div class="modal-content"></div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>

</layoutTag:layout>