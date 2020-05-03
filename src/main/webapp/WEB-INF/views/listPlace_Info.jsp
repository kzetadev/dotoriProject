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
		.pagination pagination-lg{
			
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
	</style>
</head>
<body>
	<!-- 내용  -->
	<h1><strong>명소</strong></h1>
	<br>
	<img src="images/main.jpg" width="100%" height="500">
	<br><br><br><br>

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
	
	<c:if test="${startPage > 1}">
		<ul class="pager">
			<li><a href="listPlace_Info?pageNUM=${startPage-1 }">이전</a></li>
		</ul>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<ul class="pager">
			<li><a href="listPlace_Info?pageNUM=${i }">${i }</a></li>
		</ul>
	</c:forEach>
	
	<c:if test="${endPage < totalPage }">
		<ul class="pager">
			<li><a href="listPlace_Info?pageNUM=${endPage+1 }">다음</a></li>
		</ul>
	</c:if>

	<!-- 페이지 번호 -->
	<!-- <ul class="pager">
		<li><a href="#">Previous</a></li>
		<li class="active"><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">Next</a></li>
	</ul> -->
	

	<!-- 검색창 구현 -->
	<form class="navbar-form" action="/everywhere.do">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
			<div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>
	</form>
</body>
</html>