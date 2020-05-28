<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>
	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#checkId{
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#form").submit(
				function(event) {
					event.preventDefault();
					$.ajax({
						url : "/member/pwdCheck.do",
						type : "post",
						data : {
							mem_pwd : $("#mem_pwd").val()
						},
						beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(re) {
							if (re != 1) { //비밀번호가 틀렸을 경우
								alert("비밀번호를 다시 입력해주세요")
							} else {
								location.href = "/member/updateMemForm.do"
							}
						}
					})
				})
	})
</script>
</head>
<body>

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

	<form id="form"><br>
	<h3 id="checkId" style="border-bottom: 2px double #dddddd;">비밀번호 확인</h3><br>
	<table>
		<tr >
			<td>
				비밀번호 <input type="password" name="mem_pwd" id="mem_pwd">
				<button type="submit" id="btn">회원정보 수정하기</button>
			</td>
		</tr>
	</table>
	</form>
</body>
	</html>
</layoutTag:layout>