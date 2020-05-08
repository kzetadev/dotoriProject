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
		/* Remove the navbar's default margin-bottom and rounded borders */
		.navbar {
			margin-bottom: 0;
			border-radius: 0;
		}
		
		/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
		.row.content {
			height: 450px
		}
		
		/* Set gray background color and 100% height */
		.sidenav {
			padding-top: 20px;
			background-color: white;
			height: 100%;
		}
		
		/* On small screens, set height to 'auto' for sidenav and grid */
		@media screen and (max-width: 767px) {
			.sidenav {
				height: auto;
				padding: 15px;
			}
			.row.content {
				height: auto;
			}
		}
		a{
			color: #337ab7;
	    	text-decoration: none;
		}
	</style>
	<script type="text/javascript">
		
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
						<h3 class="panel-title">마이페이지</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="myPage.do" id="updateAccount">회원정보 수정</a></li>
						<li class="list-group-item"><a href="myPage.do" id="jjim">내가 쓴 글 & 댓글</a></li>
						<li class="list-group-item"><a href="myPage.do">찜목록</a></li>
						<li class="list-group-item"><a href="myPage.do">쪽지함</a></li>
					</ul>
				</div>
			</div>

			<!-- 내용 -->
			<div class="col-sm-10 text-left">
				<h2 id="h2">11111111111</h2>
			</div>
			<div class="col-sm-10 text-left">
				<h4 id="h4">찜</h4>
			</div>
		</div>
	</div>
</body>
</html>

</layoutTag:layout>