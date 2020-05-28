<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체게시판 글 목록</title>
<style type="text/css">
	ul {
		list-style: none;
	}
	h2{
		text-align:center;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
   $(function() {
      $("#btnInsert").click(function() {
         location.href = "/board/insertBoard_Post.do";
      });
   });

   $(function() {
      $("#btnSelect").click(function() {
         var sel1 = document.getElementById("sel1").value;
         var sel2 = document.getElementById("sel2").value;
         var keyword = sel1+"@"+sel2;
         location.href = "/board/listBoard_Post.do?str="+encodeURI(keyword);
      });
   });

   // 이전페이지
   function moveLeft(curPage){
      if(curPage < 1){
         alert("페이지가 없습니다");
      }else{
         movePage(curPage);
      }
   }

	// 다음페이지
   function moveRight(curPage){
      var endChk = $('input[name=totalPage]').val();
      if(curPage > endChk){
         alert("페이지가 없습니다");
      }else{
         movePage(curPage);
      }            
   }   
   function movePage(i){
      var numberChk = i;
      var totalPage = $("#totalPage").val();
      var totalRecord = $('input[name=totalRecord]').val();
      var totalPage = $('input[name=totalPage]').val();
      var sel1 = document.getElementById("sel1").value;
      var sel2 = document.getElementById("sel2").value;
      var keyword = sel1+"@"+sel2+"@"+numberChk;
      location.href = "/board/listBoard_Post.do?str="+encodeURI(keyword);
//      var totalPage = document.getElementById("totalPage").value;
//      var tdTT = totalPage.innerText | totalPage.textContent;
   }   
</script>
</head>
<body>
	<h2>전체</h2>
	
	<div class="container">
		<form id="form" action="/board/listBoard_Info.do">
			<div class="row">
				<div class="col-sm-5">
					<div class="input-group">
						<label for="sel1"></label> 
						<select id="sel1" class="form-control">
							<option value="1">전체</option>
							<option value="2">제목</option>
							<option value="3">내용</option>
						</select>
					</div>
				</div>
	
				<div class="col-sm-5">
					<input type="text" size="20" id="sel2" class="form-control">
				</div>
	
				<div class="col-sm-2">
					<button class="btn btn-default" id="btnSelect" type="submit">
						<i class="glyphicon glyphicon-search"></i> 검색
					</button>
				</div>
			</div>
		</form>
	
		<table  class="table table-hover">
			<tr>
				<th>글번호</th>
				<th>말머리</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="v" items="${list}">
				<tr>
					<td>${v.board_no}</td>
					<td>${v.head_tag_name}</td>
					<td><a href="detailBoard_Post.do?board_no=${v.board_no}">${v.board_title}</a>
					</td>
					<td>${v.mem_nickname}</td>
					<td>${v.board_date}</td>
					<td>${v.board_hit}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<input type="hidden" name="totalPage" value=${totalPage}>
	<input type="hidden" name="totalRecord" value=${totalRecord}>
	<input type="hidden" name="curPage" value=&{curPage}>
	<input type="hidden" name="end" value=${end}>
    
	<div style='text-align: center'>
		<c:if test="${totalPage != null}">
			<div style='display: inline-block'>
				<ul>
					<!--맨 첫페이지로 이동기능-->
					<li list-style-type:none-style><a href="#"
						onclick='moveLeft(1)'> <span> << </span>
					</a> <!--이전페이지 기능--> <a onclick="moveLeft(${curPage-1})"> <span>
								< </span>
					</a> <!--페이지 선택--> <c:forEach var="i" begin="${start}" end="${end}"
							step="1">
							<a onclick="movePage(${i})">${i}</a>
						</c:forEach> <!--다음페이지 기능--> <a href="#" onclick='moveRight(${curPage+1})'>
							<span>></span>
					</a> <!--맨 마지막 페이지로 이동기능--> <a href="#"
						onclick='moveRight(${totalPage})'> <span>>></span>
					</a></li>
				</ul>
			</div>
		</c:if>
		<br>
		<button type="button" class="btn btn-default btn-lg" id="btnInsert">
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 글작성
		</button>
	</div> 
</body>
</html>

</layoutTag:layout>