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
	    
		<div class="col-md-8">
			<!-- 날씨 api -->
	    </div>
    </div>
    
  <div class="container text-center">    
  	<h3>인기 서울 장소 TOP 6</h3>
  	<br>
  	<div class="row">
    	<div class="col-sm-2">
	      	<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
  	    	<p>Partner 1</p>
   		</div>
   		
    	<div class="col-sm-2"> 
      		<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      		<p>Partner 2</p>    
    	</div>
    	
    	<div class="col-sm-2"> 
      		<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      		<p>Partner 3</p>
    	</div>
    
    	<div class="col-sm-2"> 
      		<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      		<p>Partner 4</p>
    	</div> 
    	
    	<div class="col-sm-2"> 
      		<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      		<p>Partner 5</p>
    	</div>     
    
    	<div class="col-sm-2"> 
      		<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      		<p>Partner 6</p>
    	</div> 
  </div>
</div><br>
</body>
</html>
</layoutTag:layout>