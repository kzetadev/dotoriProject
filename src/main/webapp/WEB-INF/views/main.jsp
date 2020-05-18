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
<title>Main</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<link rel="stylesheet" href="/css/slick-theme.css">
<link rel="stylesheet" href="/css/youtube.css">
<style type="text/css">
	.slick-track .slick-cloned .slick-slide .slick-active{
		height:400px;
	}
	.youtubebox{
		padding-left: 50px;
		
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
	
	<div class="row">
		<div class="col-md-4">
			<div class="youtubebox">
				<iframe width="380" height="240" 
						src="https://www.youtube.com/embed/DzMmEc8WW2w" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
			    </iframe>
				<p class="youtube_title">상경러들이 추천하는 서울 핫플 BEST5</p>
		    </div>
	    </div>
	    
	    <div class="col-md-4">
		    <div class="youtubebox">
	        	<iframe width="380" height="240"
						src="https://www.youtube.com/embed/5Lj8vLR_BTw" frameborder="0"
			    		allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			   			allowfullscreen>
		      	</iframe>
		        <p class="youtube_title">서울여행 추천명소 31</p>
	        </div>
	   	</div>
        
        <div class="col-md-4">
			<div class="youtubebox">
	        	<iframe width="380" height="240"
			            src="https://www.youtube.com/embed/HdXIFdmr-7U" frameborder="0"
			            allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			            allowfullscreen>
		        </iframe>
		    	<p class="youtube_title">서울여행 총정리</p>
	        </div>        
	    </div>
	</div>
	   
	    
	<!-- <div class="col-md-12">
		<script type="text/javascript">
			$(function(){
				var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+@@+"&appid="+@@;
				$.ajax({
					url: apiURI,
			        dataType: "json",
			       	type: "GET",
			        async: "false",
			        success: function(resp) {
			            console.log(resp);
			            console.log("현재온도 : "+ (resp.main.temp- 273.15) );
			            console.log("현재습도 : "+ resp.main.humidity);
			            console.log("날씨 : "+ resp.weather[0].main );
			            console.log("상세날씨설명 : "+ resp.weather[0].description );
			            console.log("날씨 이미지 : "+ resp.weather[0].icon );
			            console.log("바람   : "+ resp.wind.speed );
			            console.log("나라   : "+ resp.sys.country );
			            console.log("도시이름  : "+ resp.name );
			            console.log("구름  : "+ (resp.clouds.all) +"%" );
			            <p>var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
			              	$("html컴포넌트").attr("src", imgURL);
			            </p>     
			        }
				})
			})
		</script>
	</div> -->
    
    
  <div class="container text-center">    
  	<h3>인기 서울 장소 TOP 6</h3>
  	<br>
  	<div class="row">
    	<div class="col-sm-2">
	      	<img src="/img/SPAO_1.jpg" class="img-responsive">
  	    	<b>스파오</b>
   		</div>
   		
    	<div class="col-sm-2"> 
      		<img src="/img/${p.place_img}" class="img-responsive">
      		<b>${p.place_name }</b>
    	</div>
    	
    	<div class="col-sm-2"> 
      		<img src="/img/${p.place_img}" class="img-responsive">
      		<b>${p.place_name }</b>
    	</div>
    
    	<div class="col-sm-2"> 
      		<img src="/img/${p.place_img}" class="img-responsive">
      		<b>${p.place_name }</b>
    	</div> 
    	
    	<div class="col-sm-2"> 
      		<img src="/img/${p.place_img}" class="img-responsive">
      		<b>${p.place_name }</b>
    	</div>     
    
    	<div class="col-sm-2"> 
      		<img src="/img/${p.place_img}" class="img-responsive">
      		<b>${p.place_name }</b>
    	</div> 
  </div>
</div><br>
</body>
</html>
</layoutTag:layout>