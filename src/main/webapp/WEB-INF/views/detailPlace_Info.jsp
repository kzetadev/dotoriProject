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
<link rel="stylesheet" href="css/owl.carousel.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d24b45a0cda3b0e29fc1ea1a3fa5d8f1"></script>
<style type="text/css">
	h2{
		text-align:center;
	}
	img, dl{
		padding-right:200px;
		padding-left:200px;
	}
	.glyphicon glyphicon-star-empty, .glyphicon glyphicon-star{
		display: black;
		text-align: center;
	}
	.glyphicon glyphicon-star{
		visible: hidden;
	}
</style>
</head>
<body>
	<h2><b>명소 - ${p.place_name }</b></h2>
	<span class="glyphicon glyphicon-star-empty"></span>
	<span class="glyphicon glyphicon-star"></span>
	
	<script type="text/javascript">
		$(function(){
			$(".glyphicon glyphicon-star-empty").click(function(){
				alert("찜목록에 추가되었습니다.")
				$(this).css("visibility", "hidden")
				$(".glyphicon glyphicon-star").css("visibility", "visible")
			})
			$(".glyphicon glyphicon-star").click(function(){
				alert("찜목록에서 제거되었습니다.")
				$(this).css("visibility", "hidden")
				$(".glyphicon glyphicon-star-empty").css("visibility", "visible")
			})
		})
	</script>

 	<!-- <div class="wide-slide-element">
		<div class="wide-slide owl-carousel owl-loaded owl-drag">
			<div class="owl-stage-outer">
				<div class="owl-stage" style="transform: translate3d(-2804px, 0px, 0px); transition: all 0s ease 0s; width: 10515px;">
					<div class="owl-item cloned" style="width: 94px; margin-right: 1px;">
						<div class="item">
							<img src="/img/${fn:split(p.place_img, '|')[0]}">
						</div>
					</div>
					<div class="owl-item active" style="width: 94px; margin-right: 1px;">
						<div class="item">
							<img src="/img/${fn:split(p.place_img, '|')[0]}">
						</div>
					</div>
					<div class="owl-item" style="width: 94px; margin-right: 1px;">
						<div class="item">
							<img src="/img/${fn:split(p.place_img, '|')[0]}">
						</div>
					</div>
					<div class="owl-item cloned" style="width: 94px; margin-right: 1px;">
						<div class="item">
							<img src="/img/${fn:split(p.place_img, '|')[0]}">
						</div>
					</div>
				</div>
			</div>
													
			<div class="owl-nav disabled">
				<button type="button" role="presentation" class="owl-prev">
					<span aria-label="Previous">‹</span>
				</button>
				<button type="button" role="presentation" class="owl-next">
					<span aria-label="Next">›</span>
				</button>
			</div>
			
			<div class="owl-dots">
				<button role="button" class="owl-dot active">
					<span></span>
				</button>
				<button role="button" class="owl-dot">
					<span></span>
				</button>
				<button role="button" class="owl-dot">
					<span></span>
				</button>
				<button role="button" class="owl-dot">
					<span></span>
				</button>
				<button role="button" class="owl-dot">
					<span></span>
				</button>
				<button role="button" class="owl-dot">
					<span></span>
				</button>
				<button role="button" class="owl-dot">
					<span></span>
				</button>
			</div>
		</div>
	</div> -->
	
	<br><br>
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
	
		<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:100%;height:350px;"></div>
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		//마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
		
		//마커를 생성합니다
		var marker = new kakao.maps.Marker({
		position: markerPosition
		});
		
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
</body>
</html>