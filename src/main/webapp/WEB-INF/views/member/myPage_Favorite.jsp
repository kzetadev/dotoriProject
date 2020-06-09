<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>


<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
	<%-- Remove the navbar's default margin-bottom and rounded borders --%>
	.navbar {
		margin-bottom: 0;
		border-radius: 0;
	}
	
	<%-- Set height of the grid so .sidenav can be 100% (adjust as needed) --%>
	.row.content {
		height: 450px
	}
	
	<%-- Set gray background color and 100% height --%>
	.sidenav {
		padding-top: 20px;
		background-color: white;
		height: 100%;
	}
	
	<%-- On small screens, set height to 'auto' for sidenav and grid --%>
	@media screen and (max-width: 767px) {
		.sidenav {
			height: auto;
			padding: 15px;
		}
		.row.content {
			height: auto;
		}
	}
	a {
		color: #337ab7;
		text-decoration: none;
	}
	h1{
		text-align:center;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		$(".del").click(function(){
			console.log($(this).attr("favorite_no"))
			var favorite_no = $(this).attr("favorite_no")
			var a = confirm("정말로 삭제하시겠습니까?")
			if(a == true){
				$.ajax({url:"/member/deleteMember_Favorite.do", data:{favorite_no:favorite_no}, success:function(result){
					if(result == 1){
						alert("삭제되었습니다.")
						location.href = "/member/myPage_Favorite.do";
					}
				}})
			}
		})

		$("#${number}").addClass("active")
	})
</script>
</head>
<body>
	<div class="container-fluid text-center">
		<br>
		<div class="row content">
			<!-- 좌측 메뉴 -->
			<div class="col-sm-2 sidenav">
				<!-- 사이드바 메뉴목록 -->
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="/member/myPage.do">마이페이지</a>
						</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="/member/myPage_Contents.do" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						<c:if test="${other_mem_no eq null }">
						<li class="list-group-item"><a href="/member/myPage_Favorite.do">찜목록</a></li>
						<li class="list-group-item"><a href="/member/myPage_Message.do">쪽지함</a></li>
						<li class="list-group-item"><a href="/member/myPage_updateMem.do">회원 수정</a></li>
						<li class="list-group-item"><a href="/member/pwd_update.do">비밀번호 변경</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		
		
			<!-- 내용 -->
			<div class="col-sm-10 text-left">
				<h1>찜목록</h1>
				<hr>
				
				<!-- 탭 부분 (전체와 place_type으로 구분) -->
				<ul class="nav nav-tabs">
				  <li role="presentation" id="-1">
				  	<a href="/member/myPage_Favorite.do">전체</a>
				  </li>
				  <c:forEach var="p" items="${theme }">
					  <li role="presentation" id="${p.place_type }">
					  	<a href="/member/myPage_Favorite.do?place_type=${p.place_type }">${p.place_type_name }</a>
					  </li>
					  
				  </c:forEach>
				</ul>
				
				<script type="text/javascript">
					$(function(){
						$(".all").click(function(){
							
						})
					})
				</script>
				
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;총 ${AllCount }개를 찜하셨습니다.</h3>
					</div>
						
					<c:forEach var="f" items="${favorite_list }">
						<div class="panel-body">
							<div class="media">
								<div class="media-left">
									<a href="/place/detailPlace_Info.do?place_no=${f.place_no }&place_type=${f.place_type }"><img class="media-object" src="../img/${f.place_img }" width="100" height="100"></a>
								</div>
								<div class="media-body">
									<h4 class="media-heading"><a href="/place/detailPlace_Info.do?place_no=${f.place_no }&place_type=${f.place_type }">${f.place_name }</a></h4>
									<button class="del" favorite_no="${f.favorite_no }"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
								</div>
							</div>
						</div><hr>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

</layoutTag:layout>