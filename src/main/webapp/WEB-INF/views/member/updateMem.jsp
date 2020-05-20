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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#updateBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				document.form1.action = "${path}/member/updateMem.do";
				document.form1.submit();
			}
		}
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "${path}/member/delMem.do";
				document.form1.submit();
			}
		})
	})
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
			
			<div class="col-sm-10 text-left">
				<form name="form1" method="post">
					<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name = "mem_name" value="${vo.mem_name}" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td>아이디</td>
						<td><input type="text" name="mem-id" value="${vo.mem_id }" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td><input type="text" name="mem_email" value="${vo.mem_email}" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td>닉네임</td>
						<td><input type= "text" name="mem_nickname" value="${vo.mem_nickname }"></td>
					</tr>
					
					<!-- <input> 프로필 변경란 -->
					 <tr>
					 	<td colspan="2" align="center">
					 		<input type="button" value="수정 하기" id="updateBtn">
							<input type="button" value="회원 탈퇴" id="delBtn">
					 	
					 	</td>
					 
					 </tr>
					
					
					
				<!-- 	<input> 자기소개란 -->
					
				
					<!-- <input type= "text" name="password" value="${login.mem_password }"> -->
					</table>
				</form>
				
		
				
			</div>
		</div>
	</div>
</body>
</html>

</layoutTag:layout>