<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	div#themeArea, #boardArea{
		border: 2px solid lightgray;
		margin: 5px 5px 5px 5px;
		padding: 10px 10px 10px 10px;
	}
	div.theme, .column, .place_thumbnail, #placePageArea, .board{
		display:inline-block;
	}
	span.themeInfo, .place_column, .place_thumbnail, .place_page, .boardInfo, .board_column, .board_page{
/* 		display:inline-block; */
		border: 2px solid lightgray;
		border-radius: 3px;
		margin: 5px 5px 5px 5px;
		padding: 5px 5px 5px 5px;
	}
	div.place_thumbnail{
		width:150px;
		height:150px;
	}
	div#placeArea{
		border: 2px solid lightgray;
		margin: 5px 5px 5px 5px;
		padding: 10px 10px 10px 10px;
	}
	img.place_info{
		width:100px;
		height:100px;
	}
	span.place_info{
		width:200px;
		height:200px;
	}
</style>
<meta charset="UTF-8">
<title>${keyword } 검색 결과</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var totalRecord = 0;
	var pageSIZE = 8;
	var totalPage = 1;
	var pageGroup = 5;
	var startPage = 0;
	var endPage = 0;
	var currPage = 1;
	
	var keyword = '${keyword}';
	var type;
	var search_cnt;
	var column;

	var board_kinds;

	var clickedTheme;
// 	var clickedBoard;
	
	$(".themeInfo").click(function(){
		console.log($(this).attr('type'));
		type = $(this).attr('type');
		clickedTheme = $(this);
// 		$("#keywordArea")
		$.ajax({
			url:"/getCondition.do/" + keyword + "/" + $(this).attr('type')
			, type:'get'
			, dataType:'json'
			, success:function(result){
				console.log(result);
				$("#placeKeywordArea").empty();
				$("#placePageArea").empty();
				$("#placeArea").empty();
				//검색조건 출력
				$.each(result, function(idx, item){
					var div = $("<div class='column'/>");
					var span = $("<span class='place_column' column='" + item['condition_col'] + "' tot_cnt='" + item['search_cnt'] + "'/>").text(item['condition_kor']);
					$(div).append(span);
					$("#placeKeywordArea").append(div);
					//검색조건 클릭
					$(span).click(function(){
						column = parseInt($(this).attr('column'));
						showPlacePageList($(this), 1);
						$(".place_page").first().trigger('click');
					});
				});
				$(".place_column").first().trigger('click');
				$(".place_page").first().trigger('click');
			}
		});
		console.log($(".place_column"));
		
	});
	function showPlacePageList(col_span, page){
		$("#placePageArea").empty();
		var tot_cnt = parseInt($(col_span).attr('tot_cnt'));
		var tot_page = Math.ceil(tot_cnt / pageSIZE);	//1	  2	  3   4
		startPage = ((page - 1) * pageGroup) + 1;		//1   6  11  16
		endPage = (page * pageGroup);					//5  10  15  20
		if(endPage > tot_page){
			endPage = tot_page;
		}
		if(startPage > pageGroup){
			var span = $("<span class='place_page' page='" + (startPage - pageGroup) + "'/>").text('이전');
			$("#placePageArea").append(span);
			$(span).click(function(){
				showPlacePageList(col_span, page - 1);
			});
		}
		for(var i = startPage; i <= endPage; i++){
			var span = $("<span class='place_page' page='" + i + "'/>").text(i);
			$("#placePageArea").append(span);
			$(span).click(function(){
				$.ajax({
					url:"/searchPlace.do/" + keyword + "/" + type + "/" + column + "/" + parseInt($(this).attr('page')) + "/" + tot_cnt + "/" + tot_page
					, type:'get'
					, dataType:'json'
					, success:function(list){
						$("#placeArea").empty();
						$.each(list, function(idx, place){
							var a = $("<a/>").attr('href', '/place/detailPlace_Info.do?place_no=' + place['place_no']);
							var div = $("<div class='place_thumbnail'/>");
							var img = $("<img class='place_info'/>").attr('src', '/img/' + place['place_img'].split('|')[0]);
							var span = $("<span class='place_info'/>").text(place['place_name']);
							$(div).append(img, span);
							$(a).append(div);
							$("#placeArea").append(a);
						});
					}
				});
			});
		}
		if(endPage < tot_page){
			var span = $("<span class='place_page' page='" + (endPage + 1) + "'/>").text('다음');
			$("#placePageArea").append(span);
			$(span).click(function(){
				showPlacePageList(col_span, page + 1);
			});
		}
	}
	$('.boardInfo').click(function(){
		board_kinds = $(this).attr('board_kinds');
// 		clickedBoard = $(this);
		$.ajax({
			url:"/getBoardCondition.do/" + keyword + "/" + $(this).attr('board_kinds')
			, type:'get'
			, dataType:'json'
			, success:function(result){
				console.log(result);
				$("#boardKeywordArea").empty();
				$("#boardPostPageArea").empty();
				$("#boardPostArea").empty();
				//검색조건 출력
				$.each(result, function(idx, item){
					var div = $("<div class='column'/>");
					var span = $("<span class='board_column' column='" + item['condition_col'] + "' tot_cnt='" + item['search_cnt'] + "'/>").text(item['condition_kor']);
					$(div).append(span);
					$("#boardKeywordArea").append(div);
					//검색조건 클릭
					$(span).click(function(){
// 						column = parseInt($(this).attr('column'));
						showBoardPageList($(this), 1);
						$(".board_page").first().trigger('click');
					});
				});
				$(".board_column").first().trigger('click');
				$(".board_page").first().trigger('click');
			}
		});
		console.log($(".board_column"));
	});
	function showBoardPageList(col_span, page){
		$("#boardPostPageArea").empty();
		var column = parseInt($(col_span).attr('column'));
		var tot_cnt = parseInt($(col_span).attr('tot_cnt'));
		var tot_page = Math.ceil(tot_cnt / pageSIZE);	//1	  2	  3   4
		startPage = ((page - 1) * pageGroup) + 1;		//1   6  11  16
		endPage = (page * pageGroup);					//5  10  15  20
		if(endPage > tot_page){
			endPage = tot_page;
		}
		if(startPage > pageGroup){
			var span = $("<span class='board_page' page='" + (startPage - pageGroup) + "'/>").text('이전');
			$("#boardPostPageArea").append(span);
			$(span).click(function(){
				showBoardPageList(col_span, page - 1);
			});
		}
		for(var i = startPage; i <= endPage; i++){
			var span = $("<span class='board_page' page='" + i + "'/>").text(i);
			$("#boardPostPageArea").append(span);
			$(span).click(function(){
				$.ajax({
					url:"/searchBoard.do/" + keyword + "/" + board_kinds + "/" + column + "/" + parseInt($(this).attr('page')) + "/" + tot_cnt + "/" + tot_page
					, type:'get'
					, dataType:'json'
					, success:function(list){
						console.log(list);
						$("#boardPostArea").empty();
						$.each(list, function(idx, board){
							var a = $("<a/>").attr('href', '/board/detailBoard_Post.do?board_no=' + board['board_no']);
							var div = $("<div class='post'/>");
							var span_board = $("<span class='post_info'/>").text(board['board_kinds_str']);
							var span_head = $("<span class='post_info'/>").text(board['head_tag_name']);
							var span_title = $("<span class='post_info'/>").text(board['board_title']);
							var span_nickname = $("<span class='post_info'/>").text(board['mem_nickname']);
							$(div).append(span_board, span_head, span_title, span_nickname);
							$(a).append(div);
							$("#boardPostArea").append(a);
						});
					}
				});
			});
		}
		if(endPage < tot_page){
			var span = $("<span class='board_page' page='" + (endPage + 1) + "'/>").text('다음');
			$("#boardPostPageArea").append(span);
			$(span).click(function(){
				showBoardPageList(col_span, page + 1);
			});
		}
	}
	
	$(".themeInfo").first().trigger('click');
	$(".boardInfo").first().trigger('click');
});
</script>
</head>
<body>
<!-- 정보게시판 영역 -->
	<h2>정보게시판 검색 결과</h2>
	<div id="themeArea">
		<c:forEach var="t" items="${tList }">
			<div class="theme">
				<span class="themeInfo" type="${t.place_type }">${t.place_type_name }</span>
			</div>
		</c:forEach>
	</div>
	<hr>
	<div id="placeKeywordArea">
	</div>
	<hr>
	<div id="placeArea">
	</div>
	<hr>
	<div id="placePageArea">
	</div>
	<hr>
<!-- 커뮤니티 게시판 영역 -->
	<h2>커뮤니티 검색 결과</h2>
	<div id="boardArea">
		<c:forEach var="b" items="${bList }">
			<div class="board">
				<span class="boardInfo" board_kinds="${b.board_kinds }">${b.board_kinds_str }</span>
			</div>
		</c:forEach>
	</div>
	<hr>
	<div id="boardKeywordArea">
	</div>
	<hr>
	<div id="boardPostArea">
	</div>
	<hr>
	<div id="boardPostPageArea">
	</div>
</body>
</html>
</layoutTag:layout>