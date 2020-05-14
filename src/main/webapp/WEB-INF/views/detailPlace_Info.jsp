<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>명소 상세 게시판</title>
	<link rel="stylesheet" href="css/slick.css">
	<link rel="stylesheet" href="css/slick-theme.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="js/slick.min.js"></script>
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d24b45a0cda3b0e29fc1ea1a3fa5d8f1"></script>
	<script type="text/javascript">
		$(function(){
			// 찜목록 구현
			// $("#h2").attr("place_no",place_no)
			$("#btn").toggle(function(){
				// Place_no는 속성으로 안보이게 처리
				/*var cartList = $("#img").attr("place_no",place_no)
				$.each(cartList, function(){
					var place_no = $("#h2").attr("place_no")
					var place = {place_no:place_no}
						$.ajax("/insertFavorite", {data:place, success:function(){
					}})
				})*/
				var re = confirm("찜목록에 추가되었습니다. 마이페이지로 이동하시겠습니까?")
				if(re == true){
					location.href="myPage_Favorite.do"
				}
			}, function(){
				
				alert("찜목록에서 제거되었습니다.")
			})

			/*$.getJSON("/detailPlace_Info.do", function(arr){
				$.each(arr, function(idx, place){
					var item = $("#item")
					var img = $(".your-class")
					var name = $("#h2")
					$("#item").append(item, img, name)
				})
			})*/

			// 이미지 슬라이더
			$(".your-class").slick({
				dots: true, infinite: true,
				speed: 500, fade: true, cssEase: 'linear'
			})
		})
	</script>
	<style type="text/css">
		h2{
			text-align:center;
		}
		dl, hr{
			padding-right:200px;
			padding-left:200px;
		}
	</style>
</head>
<body>
	<!-- 찜 버튼 -->
	<div class="b" align="center">
		<button type="button" class="btn btn-default btn-lg" id="btn">
	  		<span class="glyphicon glyphicon-check" aria-hidden="true"></span>
		</button>
	</div>
	<br>
	
	<h2 id="h2"><b>${p.place_name } (조회수 - ${p.place_hit })</b></h2>
	
	<!-- 이미지 슬라이더 -->
	<div class="your-class" align="center" id="img">
	    <!-- <div><img src="/img/${fn:split(p.place_img, '|')[1]}"></div>
	    <div><img src="/img/${fn:split(p.place_img, '|')[2]}"></div>
	    <div><img src="/img/${fn:split(p.place_img, '|')[3]}"></div>
	    <div><img src="/img/${fn:split(p.place_img, '|')[4]}"></div> -->
	    <c:set var="pSplits" value="${fn:split(p.place_img, '|')}"/>
	    <c:forEach var="i" items="${pSplits}" varStatus="status">
	    	<div><img src="/img/${fn:split(p.place_img, '|')[status.index]}" height="90%"></div>
	    </c:forEach> 
  	</div>
  	
  	
  	<!-- 상세 정보 -->
	<div class="detail-map-infor first border">
		<dl>
			<dt>전화번호</dt>
			<dd>${p.place_tel }</dd>
		</dl>
		<hr>
		<dl>
			<dt>운영 요일 & 휴무일</dt>
			<dd>${p.place_open }</dd>
		</dl>
		<hr>
		<dl>
			<dt>이용요금</dt>
			<dd>${p.place_price }</dd>
		</dl>
		<hr>
		<dl>
			<dt>주소</dt>
			<dd>${p.place_addr }</dd>
		</dl>
		<hr>
		<dl>
			<dt>상세 설명</dt>
			<dd>${p.place_detail }</dd>
		</dl>
	</div>
	
		<!-- 지도를 표시할 div 입니다 -->
	<div class="row">
		<div class="col-md-12">
			<div id="container" align="center">
				<div id="map" style="width:70%;height:80vh;"></div>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
			    center: new kakao.maps.LatLng(${p.place_row}, ${p.place_col}), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			//마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${p.place_row}, ${p.place_col}); 
			
			//마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position: markerPosition
			});
			
			//마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		})
	</script>
	<br>
	<br>
</body>
</html>

</layoutTag:layout>