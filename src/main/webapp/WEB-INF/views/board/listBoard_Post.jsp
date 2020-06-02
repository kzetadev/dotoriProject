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
// 	   var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
// 	   $.fn.bootstrapBtn = bootstrapButton            // give $().bootstrapBtn the Bootstrap functionality
	   //레이어
	    var login_mem_no = ${login_mem_no};
		var divContainer = $("<div id='popup_layer' class='container'/>").css({
			'position':'absolute'
			, 'top':100
			, 'left':100
			, 'z-index':1
			, 'visibility':'hidden'
		});
		//버튼 그룹
		var divBtnGroup = $("<div id='btnGroup' class='btn-group-vertical'/>");
		//쪽지보내기 버튼
		var btnMsg = $("<button type='button' class='btn btn-default'/>").text("쪽지보내기");
		// 프로필보기 버튼
		var btnProfile = $("<button type='button' class='btn btn-default'/>").text("마이페이지");
		$(btnMsg).click(function(){
// 			window.open("/member/sendMessage.do", "_blank", "width=400, height=300, menubar=no, toolbar=no, status=no").focus();
			jQuery.noConflict();
			$("#modalMessage .modal-content")
				.load("/member/sendMessage.do?mem_no=" + $(this).parent().attr('mem_no') 
					+ "&mem_nickname=" + $(this).parent().attr('mem_nickname'), function(){
				alert("load was performed");
				$("#modalMessage").modal();
			});
		});
		$(btnProfile).click(function(){
			location.href = "/member/myPage.do?mem_no=" + $(this).parent().attr('mem_no');
		});
		$(divBtnGroup).append(btnMsg, btnProfile);
		$(divContainer).append(divBtnGroup);
		$('body').append(divContainer);
		$("#btnInsert").click(function() {
			location.href = "/board/insertBoard_Post.do";
		});
		//https://chobokkiri.tistory.com/67
		//화면 내 특정영역(닉네임)을 제외한 부분 클릭 시 레이어 숨김
		$('html').click(function(e){
			if(!$(e.target).hasClass('nickname')){
				$("#popup_layer").css({
					'visibility':'hidden'
				});
				$("#btnGroup").attr('mem_no', '');
			}
		});
		//https://zzznara2.tistory.com/621
		//닉네임 클릭 시 레이어 표시
		$(".nickname").click(function(e){
// 			var sWidth = window.innerWidth;
// 			var sHeight = window.innerHeight;
			if (login_mem_no == $(this).attr('mem_no')){
				return;
			}
			$("#btnGroup").attr('mem_no', $(this).attr('mem_no'));
			$("#btnGroup").attr('mem_nickname', $(this).text());
			var oWidth = $("#popup_layer").width();
			var oHeight = $("#popup_layer").height();
			
			var divLeft = e.clientX + 10;
			var divTop = e.clientY;
			
// 			if(divLeft + oWidth > sWidth) divLeft -= oWidth;
// 			if(divTop + oHeight > sHeight) divTop -= oHeight;
			
// 			if(divLeft < 0) divLeft = 0;
// 			if(divTop < 0) divTop = 0;
		
			$("#popup_layer").css({
			    "top":divTop
			    , "left":divLeft
			    , "position":"absolute"
				, 'visibility':'visible'
			});
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
					<td><a class="nickname" mem_no="${v.mem_no }">${v.mem_nickname}</a></td>
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
				<ul class="pagination">
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
	<!-- https://badstorage.tistory.com/18 -->
	<div class="modal fade" id="modalMessage" tabindex="-1" role="dialog"
		aria-labelledby="historyModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content"></div>
		</div>
	</div>
</body>
</html>

</layoutTag:layout>