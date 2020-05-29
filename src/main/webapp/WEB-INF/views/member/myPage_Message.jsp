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
<script type="text/javascript">
	$(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
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
						<li class="list-group-item"><a href="/member/myPage_Favorite.do">찜목록</a></li>
						<li class="list-group-item"><a href="/member/myPage_Message.do">쪽지함</a></li>
						<li class="list-group-item"><a href="/member/myPage_update.do">회원 수정</a></li>
						<li class="list-group-item"><a href="/member/pwd_update.do">비밀번호 변경</a></li>
					</ul>
				</div>
			</div>

			<!-- 내용 -->
			<div class="col-sm-10 text-left">
				<h1>나의 쪽지함</h1>
				<hr>
				<h3>나의 쪽지함</h3>
				<div class="col-sm-10 text-left">
		
				<hr>

				<ul class="tab">
					<li data-tab="tab2"><a href="#">발신함</a></li>
					<li data-tab="tab3"><a href="#">수신함</a></li>
				</ul>

				<div id="tab2" class="tabcontent">
					<div class="container">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr  style="border-bottom: 2px double #dddddd;">
										<th>제목</th>
										<th>내용</th>
										<th>닉네임</th>
										<th>읽음</th>
										<th>발신일</th>
									</tr>
									
								</thead>

									<c:forEach var="send" items="${sendMsg}">
				 						<tr style="border-bottom: 1px double #dddddd;">
											<td><c:out value="${send.post_title}"/></td>
											<td><c:out value="${send.post_content}"/></td>
											<td><c:out value="${send.mem_nickname}"/></td>
											<td><c:out value="${send.post_read }"/></td>
											<td><c:out value="${send.post_regidate}"/></td>
											
										</tr>
								</c:forEach>
										
							</table>
						</div>
					</div>
				</div>
				<div id="tab3" class="tabcontent">
					<div class="container">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr  style="border-bottom: 2px double #dddddd;">
										<th>제목</th>
										<th>내용</th>
										<th>닉네임</th>
										<th>읽음</th>
										<th>발신일</th>
									</tr>
									
								</thead>

									<c:forEach var="receive" items="${receiveMsg}">
				 						<tr style="border-bottom: 1px double #dddddd;">
											<td><c:out value="${receive.post_title}"/></td>
											<td><c:out value="${receive.post_content}"/></td>
											<td><c:out value="${receive.mem_nickname}"/></td>
											<td><c:out value="${receive.post_read }"/></td>
											<td><c:out value="${receive.post_regidate}"/></td>
											
										</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>

</layoutTag:layout>