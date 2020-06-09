<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#${board_kinds}").addClass("active");
});
</script>
</head>
<body>
	<h2 style="text-align:center;">갤러리</h2>
	<div id="boards" class="container">
		<ul class="nav nav-tabs">
			<li class="boards" id="1">
				<a class="board" type="1" href="/board/listBoard_Gallery.do?board_kinds=1">자유게시판</a>
			</li>
			<li class="boards" id="2">
				<a class="board" type="2" href="/board/listBoard_Gallery.do?board_kinds=2">후기게시판</a>
			</li>
			<li class="boards" id="3">
				<a class="board" type="3" href="/board/listBoard_Gallery.do?board_kinds=3">동행게시판</a>
			</li>
		</ul>
		<div class="container">
			<div class="row">
				<c:forEach var="img" items="${imgList }">
					<div class="col-md-4">
						<div class="thumbnail" style="width:300px;height:300px;">
							<a href="/board/detailBoard_Post.do?board_no=${img.board_no }">
								<img src="${img.board_content }" style="width:250px;height:250px;">
								<div class="caption" style="text-align:center;">
									<p><b>${img.board_title }</b></p>
								</div>
							</a> 
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
		<!-- 페이징 처리 -->
		<ul class="pagination pagination-lg">
			<c:if test="${start_page > 1}">
				<li>
					<a href="/board/listBoard_Gallery.do?${board_kinds_str}&pageNum=${start_page - 1}" aria-label="이전">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${start_page }" end="${end_page }">
				<li><a href="/board/listBoard_Gallery.do?${board_kinds_str}&pageNum=${i}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${end_page < total_page }">
				<li>
					<a href="/board/listBoard_Gallery.do?${board_kinds_str}&pageNum=${end_page + 1}" aria-label="다음">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
<%-- 		<c:forEach var="board" items="${boards }"> --%>
<!-- 			<li class="boards"> -->
<%-- 				<a class="board" type="${board.board_kinds }">${board.board_kinds_str }</a> --%>
<!-- 			</li> -->
<%-- 		</c:forEach> --%>
	</div>
</body>
</html>
</layoutTag:layout>