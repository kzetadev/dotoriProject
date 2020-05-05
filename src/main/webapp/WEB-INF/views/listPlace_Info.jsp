<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>명소 정보 게시판</title>
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
	  		.pagination{
	  			display:block;
				text-align: center;
	  		}
	  		.pagination > li > a{
	  			float: none;
	  			margin-left: -5px;
	  		}
	  		form { 
	        	margin: 0 auto; 
	       		width:250px;
	    	}    
			@using (Html.BeginForm("Index", "Join", FormMethod.Post, new { @style = "margin: 0 auto; width: 250px" }))
	</style>
	<script type="text/javascript">
		$(function(){
			$("#form").on("submit", function(event){
				event.preventDefault();
				var searchCondition = $("#form").serialize();
				console.log(searchCondition);
				location.href = "/listPlace_Info.do?" + searchCondition;
			});
		});
	</script>
</head>
<body>
	<!-- 내용  -->
	<h1><strong>명소</strong></h1>
	<br>
	<img src="images/main.jpg" width="100%" height="500">
	<br><br><br><br>


	<!-- 각 장소별 대표 이미지 리스트 -->
	<div class="row">
		<c:forEach var="p" items="${list }">
			<div class="col-md-3">
				<div class="thumbnail">
					<a href="detailPlace_Info.do?place_no=${p.place_no}">
						<img src="/img/${fn:split(p.place_img, '|')[0]}" width="300" height="300"> 
						<div class="caption">
							<b>${p.place_name}</b>
							<br>
							<p>
								${p.place_detail }
							</p>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	
	<!-- 페이징 처리 -->
	<ul class="pagination pagination-lg">
		<c:if test="${startPage > 1}">
			<li>
				<a href="listPlace_Info.do?place_type=${place_type }&pageNUM=${startPage-1 }" aria-label="이전">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<li><a href="listPlace_Info.do?place_type=${place_type }&pageNUM=${i }">${i }</a></li>
		</c:forEach>
		
		<c:if test="${endPage < totalPage }">
			<li>
				<a href="listPlace_Info.do?place_type=${place_type }&pageNUM=${endPage+1 }" aria-label="다음">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	</ul>	


	<!-- 검색창 구현 -->
	<form id="form" action="/listPlace_Info.do" method="post">
		<div class="input-group">
			<div class="form-group">
				<label for="sel"></label>
				<select class="form-control" name="searchColumn" id="sel">
					<option value="place_name">장소명</option>
					<option value="place_detail">내용</option>
				</select>
			</div>
			<input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요.">
			<div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>
	</form>
	<br><br>
</body>
</html>

</layoutTag:layout>