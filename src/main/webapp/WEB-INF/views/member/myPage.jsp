<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<c:if test="${other_mem_no eq null }">
								<a href="/member/myPage.do">마이페이지</a>
							</c:if>
							<c:if test="${other_mem_no ne null }">
								<a href="/member/myPage.do?mem_no=${other_mem_no }">마이페이지</a>
							</c:if>
						</h3>
					</div>
					<ul class="list-group">
						<c:if test="${other_mem_no eq null }">
							<li class="list-group-item"><a href="/member/myPage_Contents.do" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						</c:if>
						<c:if test="${other_mem_no ne null }">
							<li class="list-group-item"><a href="/member/myPage_Contents.do?mem_no=${other_mem_no }" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						</c:if>
						<%--other_mem_no가 null이면  로그인한 회원의 마이페이지로 간주. null이면 다른 회원의 마이페이지--%>
						<c:if test="${other_mem_no eq null }">
						<li class="list-group-item"><a href="/member/myPage_Favorite.do">찜목록</a></li>
						<li class="list-group-item"><a href="/member/myPage_Message.do">쪽지함</a></li>
						<li class="list-group-item"><a href="/member/myPage_updateMem.do">회원 수정</a></li>
						<li class="list-group-item"><a href="/member/pwd_update.do">비밀번호 변경</a></li>
						</c:if>
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
						<img src="${main.mem_img }" class="img-rounded" width="300" height="300">
						<table class="table" id="t">
							<tr>
								<th>이름</th>
								<td>${main.mem_name }</td>
							</tr>
							<%--아이디, 이메일은 로그인한 회원만 표시 --%>
							<c:if test="${other_mem_no eq null }">	
							<tr>
								<th>아이디</th>
								<td>${main.mem_id }</td>
							</tr>
							
							<tr>
								<th>이메일</th>
								<td>${main.mem_email }</td>
							</tr>
							</c:if>
							<tr>
								<th>닉네임</th>
								<td>${main.mem_nickname }</td>
							</tr>
							<tr>
								<th>자기소개</th>
								<td><textarea rows="5" cols="30" readonly="readonly">${main.mem_content }</textarea></td>
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