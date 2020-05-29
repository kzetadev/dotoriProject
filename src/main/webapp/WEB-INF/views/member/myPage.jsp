<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style type="text/css">
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
	
	h1{
		text-align:center;
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
							<a href="/member/myPage.do">마이페이지</a>
						</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="/member/myPage_Contents.do" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						<li class="list-group-item"><a href="/member/myPage_Favorite.do">찜목록</a></li>
						<li class="list-group-item"><a href="/member/myPage_Message.do">쪽지함</a></li>
						<li class="list-group-item"><a href="/member/myPage_updateMem.do">회원 수정</a></li>
						<li class="list-group-item"><a href="/member/pwd_update.do">비밀번호 변경</a></li>
					</ul>
				</div>
			</div>

			<!-- 내용 -->
			<div class="col-sm-10 text-left">
				<h1>${main.mem_nickname }님의 마이페이지</h1>
				<hr>
				<div class="media">
					<div class="media-left media-middle">
						<table>
							
						</table>
					</div>
					<div class="media-body">
						<table>
						<tr>
								<td>
									<img src="../img/basic.png" width="50" height="50">
								</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${main.mem_name }</td>
							</tr>	
							<tr>
								<td>아이디</td>
								<td>${main.mem_id }</td>
							</tr>
							
							<tr>
								<td>이메일</td>
								<td>${main.mem_email }</td>
							</tr>
							
							<tr>
								<td>닉네임</td>
								<td>${main.mem_nickname }</td>
							</tr>
							<tr>
							<td>자기소개</td>
							<td><textarea rows="20" cols="30" readonly="readonly">${main.mem_content }</textarea></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

</layoutTag:layout>