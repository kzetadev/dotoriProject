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
<title>${keyword } 검색 결과</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var totalRecord = 0;
	var placePageSIZE = 9;
	var boardPageSIZE = 8;
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
	$(".theme").click(function(){
		$(".theme").removeClass('active');
		$(this).addClass('active');
	});
	$(".themeInfo").click(function(){
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
				var div = $("<div class='column container'/>");
				var ul = $("<ul class='nav nav-tabs'/>");
				$.each(result, function(idx, item){
					var li = $("<li class='place_column' column='" + item['condition_col'] + "' tot_cnt='" + item['search_cnt'] + "'/>");
					var a = $("<a/>").text(item['condition_kor']);
					$(li).append(a);
					$(ul).append(li);
					//검색조건 클릭
					$(li).click(function(){
						$(".place_column").removeClass('active');
						$(this).addClass('active');
						column = parseInt($(this).attr('column'));
						showPlacePageList($(this), 1);
						$(".place_page").first().trigger('click');
					});
				});
				$(div).append(ul);
				$("#placeKeywordArea").append(div);
				$(".place_column").first().trigger('click');
				$(".place_page").first().trigger('click');
			}
		});
		console.log($(".place_column"));
		
	});
	function showPlacePageList(col_span, page){
		$("#placePageArea").empty();
		var tot_cnt = parseInt($(col_span).attr('tot_cnt'));
		var tot_page = Math.ceil(tot_cnt / placePageSIZE);	//1	  2	  3   4
		startPage = ((page - 1) * pageGroup) + 1;		//1   6  11  16
		endPage = (page * pageGroup);					//5  10  15  20
		if(endPage > tot_page){
			endPage = tot_page;
		}
		var ul = $("<ul class='pagination'/>");
		if(startPage > pageGroup){
			var li = $("<li class='place_page' page='" + (startPage - pageGroup) + "'/>");
			var span = $("<span/>").text('이전');
			$(li).append(span);
			$(li).click(function(){
				showPlacePageList(col_span, page - 1);
				$(".place_page[page=" + $(this).attr('page') + "]").click();
			});
			$(ul).append(li);
		}
		for(var i = startPage; i <= endPage; i++){
			var li = $("<li class='place_page' page='" + i + "'/>");
			var span = $("<span/>").text(i);
			$(li).append(span);
			$(li).click(function(){
				$(".place_page").removeClass('active');
				$(this).addClass('active');
				$.ajax({
					url:"/searchPlace.do/" + keyword + "/" + type + "/" + column + "/" + parseInt($(this).attr('page')) + "/" + tot_cnt + "/" + tot_page
					, type:'get'
					, dataType:'json'
					, success:function(list){
						$("#placeArea").empty();
						var divContainer = $("<div class='container'/>");
						var divRow = $("<div class='row'/>");
						$.each(list, function(idx, place){
							var divColMd4 = $("<div class='col-md-4'/>");
							var divThumbnail = $("<div class='thumbnail'/>");
							var a = $("<a/>").attr('href', '/place/detailPlace_Info.do?place_no=' + place['place_no'] + '&place_type=' + place['place_type']);
							var img = $("<img class='place_info' style='width:300px;height:200px;'/>").attr('src', '/img/' + place['place_img'].split('|')[0]);
							var divCaption = $("<div class='caption' style='text-align:center;'/>");
							var p = $("<p/>").append($("<b/>").text(place['place_name']));
							$(divCaption).append(p);
							$(a).append(img, divCaption);
							$(divThumbnail).append(a);
							$(divColMd4).append(divThumbnail);
							$(divRow).append(divColMd4);
							$(divContainer).append(divRow);
						});
						$("#placeArea").append(divContainer);
					}
				});
			});
			$(ul).append(li);
		}
		if(endPage < tot_page){
			var li = $("<li class='place_page' page='" + (endPage + 1) + "'/>");
			var span = $("<span/>").text('다음');
			$(li).append(span);
			$(li).click(function(){
				showPlacePageList(col_span, page + 1);
				$(".place_page[page=" + $(this).attr('page') + "]").click();
			});
			$(ul).append(li);
		}
		$("#placePageArea").append(ul);
	}
	$(".board").click(function(){
		$(".board").removeClass('active');
		$(this).addClass('active');
	});
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
				
				var div = $("<div class='column container'/>");
				var ul = $("<ul class='nav nav-tabs'/>");
				$.each(result, function(idx, item){
					var li = $("<li class='board_column' column='" + item['condition_col'] + "' tot_cnt='" + item['search_cnt'] + "'/>");
					var a = $("<a/>").text(item['condition_kor']);
					$(li).append(a);
					$(ul).append(li);
					//검색조건 클릭
					$(li).click(function(){
						$(".board_column").removeClass('active');
						$(this).addClass('active');
						showBoardPageList($(this), 1);
						$(".board_page").first().trigger('click');
					});
				});
				$(div).append(ul);
				$("#boardKeywordArea").append(div);
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
		var tot_page = Math.ceil(tot_cnt / boardPageSIZE);	//1	  2	  3   4
		startPage = ((page - 1) * pageGroup) + 1;		//1   6  11  16
		endPage = (page * pageGroup);					//5  10  15  20
		if(endPage > tot_page){
			endPage = tot_page;
		}
		var ul = $("<ul class='pagination'/>");
		if(startPage > pageGroup){
			var li = $("<li class='board_page' page='" + (startPage - pageGroup) + "'/>");
			var span = $("<span/>").text('이전');
			$(li).append(span);
			$(li).click(function(){
				showBoardPageList(col_span, page - 1);
				$(".board_page[page=" + $(this).attr('page') + "]").click();
			});
			$(ul).append(li);
		}
		for(var i = startPage; i <= endPage; i++){
			var li = $("<li class='board_page' page='" + i + "'/>");
			var span = $("<span/>").text(i);
			$(li).append(span);
			$(li).click(function(){
				$(".place_page").removeClass('active');
				$(this).addClass('active');
				$.ajax({
					url:"/searchBoard.do/" + keyword + "/" + board_kinds + "/" + column + "/" + parseInt($(this).attr('page')) + "/" + tot_cnt + "/" + tot_page
					, type:'get'
					, dataType:'json'
					, success:function(list){
						console.log(list);
						$("#boardPostArea").empty();
						var div = $("<div class='container'/>");
						var table = $("<table class='table table-hover'/>");
						var tHead = $("<thead/>");
						var trHead = $("<tr/>").append($("<th/>").text("게시판"), $("<th/>").text("말머리"), $("<th/>").text("글제목")
								, $("<th/>").text("닉네임"), $("<th/>").text("조회수"), $("<th/>").text("작성일"));
						$(tHead).append(trHead);
						$(table).append(tHead);
						var tbody = $("<tbody/>");
						$.each(list, function(idx, board){
							var tr = $("<tr/>");
							var tdBoard = $("<td/>").text(board['board_kinds_str']);
							var tdHeadTag = $("<td/>").text(board['head_tag_name']);
							var a = $("<a/>").attr('href', '/board/detailBoard_Post.do?board_no=' + board['board_no']).text(board['board_title']);
							var tdBoardTitle = $("<td/>").append(a);
							var tdNickname = $("<td/>").text(board['mem_nickname']);
							var tdBoardHit = $("<td/>").text(board['board_hit']);
							var tdBoardDate = $("<td/>").text(board['board_date']);
							
							$(tr).append(tdBoard, tdHeadTag, tdBoardTitle, tdNickname, tdBoardHit, tdBoardDate);
							$(tbody).append(tr);

						});
						$(table).append(tbody);
						$(div).append(table);
						$("#boardPostArea").append(div);
					}
				});
			});
			$(ul).append(li);
		}
		if(endPage < tot_page){
			var li = $("<li class='board_page' page='" + (endPage + 1) + "'/>");
			var span = $("<span/>").text('다음');
			$(li).append(span);
			$(li).click(function(){
				showBoardPageList(col_span, page + 1);
				$(".board_page[page=" + $(this).attr('page') + "]").click();
			});
			$(ul).append(li);
		}
		$("#boardPostPageArea").append(ul);
	}
	
	$(".themeInfo").first().trigger('click');
	$(".boardInfo").first().trigger('click');
});
</script>
</head>

<body>
<!-- 정보게시판 영역 -->
	<h2 style="text-align:center;">여행정보 검색 결과</h2>
	<div id="themeArea" class="container">
		<ul class="nav nav-tabs">
		<c:forEach var="t" items="${tList }">
			<li class="theme">
				<a class="themeInfo" type="${t.place_type }">${t.place_type_name }</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	<hr>
	<div id="placeKeywordArea">
	</div>
	<hr>
	<div id="placeArea">
	</div>
	<hr>
	<div id="placePageArea" class="container">
	</div>
	<hr>
<!-- 커뮤니티 게시판 영역 -->
	<h2 style="text-align:center;">커뮤니티 검색 결과</h2>
	<div id="boardArea" class="container">
		<ul class="nav nav-tabs">
		<c:forEach var="b" items="${bList }">
			<li class="board">
				<a class="boardInfo" board_kinds="${b.board_kinds }">${b.board_kinds_str }</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	<hr>
	<div id="boardKeywordArea">
	</div>
	<hr>
	<div id="boardPostArea">
	</div>
	<hr>
	<div id="boardPostPageArea" class="container">
	</div>
</body>
</html>
</layoutTag:layout>