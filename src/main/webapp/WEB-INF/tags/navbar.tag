<%@ tag language="java" pageEncoding="UTF-8"%>

<!-- 상단 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$("#btnUnifiedSearch").click(function(event){
		event.preventDefault();
		location.href = "/unifiedSearch.do/" + $("#keyword").val();
	});
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
					<li class="active"><a href="#">소개<span class="sr-only"></span></a></li>
					<li class="dropdown">
						<a href="listPlace_Info.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">정보 게시판<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/place/listPlace_Info.do?place_type=0">명소</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=1">음식점</a></li>
							<li><a href="/place/listPlace_Info.do?place_type=2">숙소</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="listBoard_Post.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/board/listBoard_Post.do?board_kinds=0">자유 게시판</a></li>
							<li><a href="/board/listBoard_Post.do?board_kinds=1">후기 게시판</a></li>
							<li><a href="/board/listBoard_Post.do?board_kinds=2">동행 게시판</a></li>
						</ul>
					</li>
					<li><a href="/faq/listFaq.do">FAQ</a></li>
					<li><a href="/admin/adminListMember.do">관리자 페이지</a>
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
					<li><a href="/member/joinForm.do"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
					<li><a href="/member/login.do"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
				</ul>
			</div>
		</div>
	</nav>