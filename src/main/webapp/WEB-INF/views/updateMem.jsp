<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
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
							<a href="myPage.do">마이페이지</a>
						</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="myPage_Content.do" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						<li class="list-group-item"><a href="myPage_Favorite.do">찜목록</a></li>
						<li class="list-group-item"><a href="myPage_Message.do">쪽지함</a></li>
						<li class="list-group-item"><a href="myPage_update.do">회원 수정</a></li>
						<li class="list-group-item"><a href="pwd_update.do">비밀번호 변경</a></li>
					</ul>
				</div>
			</div>

			<!-- 내용 -->
			<!--  수정 필요
			<div class="col-sm-10 text-left">
				<form method="post">
					<!-- <input> 프로필 변경란 
					<input type="text" name = "mem_name" value="${login.mem_name}" readonly="readonly"> 
					<input type="text" name="mem-id" value="${login.mem_id }" readonly="readonly">
					<input type="text" name="mem_email" value="${login.mem_email}" readonly="readonly">
					<input type= "text" name="mem_nickname" value="${login.mem_nickname }">
				<!-- 	<input> 자기소개란 
					<button type="submit" id="updateBtn">수정 하기</button>
				
				
					<input type= "text" name="password" value="${login.mem_password }">
					<button type="submit" name="delBtn">회원 탈퇴</button>
				</form>
				
				 -->
				
			</div>
		</div>
	</div>
</body>
</html>

</layoutTag:layout>