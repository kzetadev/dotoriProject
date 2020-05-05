<%@ tag language="java" pageEncoding="UTF-8"%>

<!-- 상단 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="main.do" class="navbar-brand" style="font-size:25px"><span class="glyphicon glyphicon-plane"></span></a>
			</div>

			<div class="collapsed navbar-collapse" id="bs-example-navbar-collapse-1">
				<!-- 상단 메뉴바 -->
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">소개<span class="sr-only"></span></a></li>
					<li class="dropdown">
						<a href="listPlace_Info.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">정보 게시판<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="listPlace_Info.do?place_type=0">명소</a></li>
							<li><a href="listPlace_Info.do?place_type=1">음식점</a></li>
							<li><a href="listPlace_Info.do?place_type=2">숙소</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="listBoard_Post.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="listBoard_Post.do?board_kinds=0">자유 게시판</a></li>
							<li><a href="listBoard_Post.do?board_kinds=1">후기 게시판</a></li>
							<li><a href="listBoard_Post.do?board_kinds=2">동행 게시판</a></li>
						</ul>
					</li>
					<li><a href="youtube.do">컨텐츠</a></li> <!-- youtube -->
					<li><a href="faq.do">FAQ</a></li>
					<li><a href="qa.do">Q & A</a></li>
				</ul>
				
				<!-- sign, login -->
				<ul class="nav navbar-nav navbar-right"> 
					<li><a href="#.do"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
					<li><a href="joinForm.do"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
				</ul>
			</div>
		</div>
	</nav>