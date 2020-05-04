<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명소 정보 게시판</title>
<meta name="viewport" content="width=device-width" initial-scale="1" minimum-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/coding.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d24b45a0cda3b0e29fc1ea1a3fa5d8f1"></script>
<style type="text/css">
		h1{
			text-align:center;
		}
		.row{
			padding:30px;
		}
		b{
			font-size:15px;
		}
		p{
			color:grey;
			font-size:11px;
		}
	/* Hide the carousel text when the screen is less than 600 pixels wide */
		@media (max-width: 600px) {
		    .carousel-caption {
		      	display: none; 
		    }
		}/*
		.carousel-inner img {
      		width: 100%; 
      		margin: auto;
      		height:200px;
  		}*/
  		.pager{
  			display:inline-block;
			
  		}
	</style>
</head>
<script type="text/javascript">
$(function(){
	$("#form").on("submit", function(event){
		event.preventDefault();
		var searchCondition = $("#form").serialize();
		console.log(searchCondition);
		location.href = "/listPlace_Info?" + searchCondition;
	});
});
</script>
<body>
	<!-- 내용  -->
	<h1><strong>명소</strong></h1>
	<br>
	<img src="images/main.jpg" width="100%" height="500">
	<br><br><br><br>
	
	<a href="faq">자주 묻는 질문들</a>

	<div class="row">
		<c:forEach var="p" items="${list }">
			<div class="col-md-3">
				<div class="thumbnail">
					<a href="detailPlace_Info?place_no=${p.place_no}">
						<img src="/img/${fn:split(p.place_img, '|')[0]}" width="300" height="300"> 
						<div class="caption">
							<b>${p.place_name}</b>
							<br>
							<p>aaaaaaaaaaaaaaaaaa</p>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	
	<!-- 페이징 처리 -->
	<c:if test="${startPage > 1}">
		<ul class="pager">
			<li><a href="listPlace_Info?place_type=${place_type }&pageNUM=${startPage-1 }">이전</a></li>
		</ul>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<ul class="pager">
			<li><a href="listPlace_Info?place_type=${place_type }&pageNUM=${i }">${i }</a></li>
		</ul>
	</c:forEach>
	
	<c:if test="${endPage < totalPage }">
		<ul class="pager">
			<li><a href="listPlace_Info?place_type=${place_type }&pageNUM=${endPage+1 }">다음</a></li>
		</ul>
	</c:if>
		

	<!-- 검색창 구현 -->
	<form id="form" class="navbar-form" action="/listPlace_Info" method="post">
		<div class="input-group">
			<select name="searchColumn">
				<option value="place_name">장소명</option>
				<option value="place_detail">내용</option>
			</select>
				<input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요.">
			<div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>
	</form>
</body>
</html>