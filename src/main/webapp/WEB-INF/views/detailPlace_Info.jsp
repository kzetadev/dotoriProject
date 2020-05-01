<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명소 상세 게시판</title>
<meta name="viewport" content="width=device-width" initial-scale="1" minimum-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/coding.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
	h2{
		text-align:center;
	}
	img, dl{
		padding-right:200px;
		padding-left:200px;
	}
</style>
</head>
<body>
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
				<a href="html.html" class="navbar-brand" style="font-size:25px"><span class="glyphicon glyphicon-plane"></span></a>
			</div>

			<div class="collapsed navbar-collapse" id="bs-example-navbar-collapse-1">
				<!-- 상단 메뉴바 -->
				<ul class="nav navbar-nav">
					<li class="active"><a href="html.html">소개<span class="sr-only"></span></a></li>
					<li><a href="goods.html">상품</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ex1<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="place.html?placeName=sights">ex1. 명소</a></li>
							<li><a href="place.html?placeName=restaurant">ex1. 음식점</a></li>
							<li><a href="place.html?placeName=hotel">ex1. 숙소</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ex2<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="board.html?boardName=review">ex2 게시판</a></li>
							<li><a href="board.html?boardName=together">ex2 게시판</a></li>
							<li><a href="board.html?boardName=free">ex2 게시판</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">정보의 광장<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="place.html?placeName=sights">명소</a></li>
							<li><a href="place.html?placeName=restaurant">음식점</a></li>
							<li><a href="place.html?placeName=hotel">숙소</a></li>
						</ul>
					</li>
					<li><a href="youtube.html">참고자료</a></li>
				</ul>
				
				<!-- sign, login -->
				<ul class="nav navbar-nav navbar-right"> 
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<h2><b>명소 - ${p.place_name }</b></h2>
	<br>
	<img src="/img/${fn:split(p.place_img, '|')[0]}" width="100%" height="500">
	<hr>

	<div class="detail-map-infor first border">
		<dl>
			<dt>전화번호</dt>
			<dd>${p.place_tel }</dd>
		</dl>
		<dl>
			<dt>운영 요일 & 휴무일</dt>
			<dd>${p.place_open }</dd>
		</dl>
		<dl>
			<dt>이용요금</dt>
			<dd>${p.place_price }</dd>
		</dl>
		<dl>
			<dt>주소</dt>
			<dd>${p.place_addr }</dd>
		</dl>
		<dl>
			<dt>상세 설명</dt>
			<dd>${p.place_detail }</dd>
		</dl>
	</div>
	
	<div id="map" style="width:80%;height:350px;"></div>
	
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map); 
	</script>
	
	
	
	
	
	<!-- 하단 -->
	<footer style="background-color: #000000; color: #ffffff">
		<div class="container"><br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center;"><h5>Copyright &copy; 2020</h5><h5>박유철(Yuchul Park)</h5></div>
				<div class="col-sm-4"><h4>팀원 소개</h4><p>저희 도토리 팀원은 박유철, 전은진, 홍수지, 이동현, 김정규 이렇게 있습니다.</p></div>
				<div class="col-sm-2"><h4 style="text-align: center;">네비게이션</h4>
					<div class="list-group">
						<a href="html.html" class="list-group-item">소개</a>
						<a href="goods.html" class="list-group-item">상품</a>
						<a href="board.html" class="list-group-item">게시판 목록</a>	
					</div>
				</div>
				<div class="col-sm-2"><h4 style="text-align: center;">SNS</h4>
					<div class="list-group">
						<a href="https://www.facebook.com/" class="list-group-item">페이스북</a>
						<a href="https://www.instagram.com/" class="list-group-item">인스타그램</a>
						<a href="https://www.youtube.com/" class="list-group-item">유튜브</a>	
					</div>
				</div>
				<div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by 박유철</h4></div>
			</div>
		</div>
	</footer>
</body>
</html>