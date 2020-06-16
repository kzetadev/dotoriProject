<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 상단 -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> -->
<style>
.container, .row.content{
	min-height: 576px;
}
</style>
<script>
$(document).ready(function(){
	$("#btnUnifiedSearch").click(function(event){
		event.preventDefault();
		if($("#keyword").val() == ''){
			alert("검색어를 입력해 주세요.");
			return false;
		}
		location.href = "/unifiedSearch.do/" + $("#keyword").val();
	});

	//시큐리티에 설정된 logoutUrl로 post 요청
	var logoutFunction = function (){
		$.ajax({
			url:"/member/logout.do"
			, type:'post'
			, beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			}
			, success:function(){
				location.href = '/main.do';
			}
		});
	}
	$("#logout").click(logoutFunction);
});
</script>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="/main.do" class="navbar-brand" style="font-size:25px"><span class="glyphicon glyphicon-plane"></span></a>
			</div>

			<div class="collapsed navbar-collapse" id="bs-example-navbar-collapse-1">
				<!-- 상단 메뉴바 -->
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="listPlace_Info.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">여행 정보<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/place/listPlace_Info.do?place_type=0&sortColumn=place_no">명소</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=1&sortColumn=place_no">음식</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=2&sortColumn=place_no">호텔</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=3&sortColumn=place_no">축제와 행사</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=4&sortColumn=place_no">쇼핑</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=5&sortColumn=place_no">자연과 공원</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=6&sortColumn=place_no">박물관과 미술관</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=7&sortColumn=place_no">엔터테인먼트</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=8&sortColumn=place_no">공연</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="listBoard_Post.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/board/listBoard_Post.do?str=1">자유게시판</a></li>
							<li><a href="/board/listBoard_Post.do?str=2">후기게시판</a></li>
							<li><a href="/board/listBoard_Post.do?str=3">동행게시판</a></li>
							<li><a href="/board/listBoard_Gallery.do">갤러리</a></li>
						</ul>
					</li>
					<li><a href="/faq/listFaq.do">FAQ</a></li>
				</ul>
				<!-- 검색창 구현 -->
				<form class="navbar-form navbar-left" action="/detailPlace_Info.do?">
					<div class="input-group">
						<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력해주세요.">
						<div class="input-group-btn">
							<button id="btnUnifiedSearch" class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
				
				<!-- sign, login -->
				<ul class="nav navbar-nav navbar-right"> 
					<sec:authorize access="isAuthenticated()">
						<li><a href="/member/myPage.do"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
						<li><a id="logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="/member/joinForm.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
						<li><a href="/member/login.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>