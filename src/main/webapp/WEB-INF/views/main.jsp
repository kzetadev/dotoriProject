<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<link rel="stylesheet" href="css/slick-theme.css">
<style type="text/css">
	.slick-track .slick-cloned .slick-slide .slick-active{
		height:400px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".slider").slick({
		dots: true
        , infinite: true
        , centerMode: true
        , slidesToShow: 5
		, slidesToScroll: 1
		, autoplay: true
		, arrows: true
		, autoplaySpeed: 1000
	});
});
</script>
</head>
<body>
	<!-- 중단 이미지 슬라이드 -->
	<div class="slider autoplay slick-slider slick-dotted" role="toolbar">
		<c:forEach var="p" items="${list }">
			<div><img src="img/${fn:split(p.place_img, '|')[0]}" height="30%"></div>
		</c:forEach>
	</div>
	<div>
	</div>
</body>
</html>
</layoutTag:layout>