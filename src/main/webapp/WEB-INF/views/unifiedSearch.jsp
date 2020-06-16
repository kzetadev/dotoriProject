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
	var totalRecord = 0;				//총 레코드 카운트
	var placePageSIZE = 9;				//여행정보 페이지 사이즈
	var boardPageSIZE = 8;				//게시글 페이지 사이즈
	var totalPage = 1;
	var pageGroup = 5;
	var startPage = 0;
	var endPage = 0;
	var currPage = 1;
	
	var keyword = '${keyword}';			//검색어
	var type;
	var search_cnt;
	var column;

	var board_kinds;

	var clickedTheme;

	//테마 클릭 시 활성화된 효과 주기
	$(".theme").click(function(){
		$(".theme").removeClass('active');
		$(this).addClass('active');
	});
	//테마 클릭. 클릭한 테마에 해당하는 검색 조건들 가져오기. 검색어가 포함되면 표시
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
				//여행정보 검색조건란 초기화
				$("#placeKeywordArea").empty();
				//여행정보 페이지란 초기화
				$("#placePageArea").empty();
				//여행정보 리스트란 초기화
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
						//활성화 효과삭제
						$(".place_column").removeClass('active');
						//선택된 검색조건에 활성화 효과 주기
						$(this).addClass('active');
						column = parseInt($(this).attr('column'));
						//검색조건 클릭 시 페이지란 출력
						showPlacePageList($(this), 1);
						//출력된 페이지란에서 첫 번째 요소(페이지) 클릭
						$(".place_page").first().trigger('click');
					});
				});
				$(div).append(ul);
				//검색조건란에 검색조건 추가하기
				$("#placeKeywordArea").append(div);
				//첫 번째 검색조건 클릭하기
				$(".place_column").first().trigger('click');
				//첫 번째 페이지 클릭하기
				$(".place_page").first().trigger('click');
			}
		});
		console.log($(".place_column"));
		
	});
	//페이지 목록을 출력하는 함수		col_span -> 클릭한 검색조건 li	page -> 페이지 그룹
	function showPlacePageList(col_span, page){
		$("#placePageArea").empty();
		//검색 조건에 담긴 tot_cnt
		var tot_cnt = parseInt($(col_span).attr('tot_cnt'));
		//tot_cnt를 페이지 사이즈로 나눠서 총 페이지 계산
		var tot_page = Math.ceil(tot_cnt / placePageSIZE);	//1	  2	  3   4		(페이지 그룹)
		//시작 페이지 계산
		startPage = ((page - 1) * pageGroup) + 1;			//1   6  11  16		(첫 번째 페이지)
		//마지막 페이지 계산
		endPage = (page * pageGroup);						//5  10  15  20		(마지막 페이지)
		//마지막 페이지가 총 페이지 수 보다 크면 총 페이지 수로 변경
		if(endPage > tot_page){
			endPage = tot_page;
		}
		//페이지란 만드는 부분
		var ul = $("<ul class='pagination'/>");
		//시작 페이지가 페이지 그룹보다 크면 -> 현재 페이지가 다음 페이지 그룹에 있다고 간주, 이전 버튼을 만듦.
		if(startPage > pageGroup){
			var li = $("<li class='place_page' page='" + (startPage - pageGroup) + "'/>");		//현재 페이지 그룹이 [이전] 11 12 13 14 15 [다음] 일 때, [이전]에는 11 - 5 = 6(startPage - pageGroup)이 담김.
			var span = $("<span/>").text('이전');
			$(li).append(span);
			$(li).click(function(){
				showPlacePageList(col_span, page - 1);		//이전 버튼 클릭. 페이지 그룹에서 -1해서 페이지 그룹을 새로 만듦.
				$(".place_page[page=" + $(this).attr('page') + "]").click();	//place_page라는 클래스 중의 page 속성(attribute)이 현재 클릭한 페이지의 page인 것을 클릭 시키는 효과. [이전] 11 12 13 14 15 [다음] 일 때, [이전] 6 7 8 9 10 [다음] 중 6을 클릭하는 효과
			});
			$(ul).append(li);
		}
		//이전, 다음을 제외한 페이지 번호 출력
		for(var i = startPage; i <= endPage; i++){
			var li = $("<li class='place_page' page='" + i + "'/>");
			var span = $("<span/>").text(i);
			$(li).append(span);
			$(li).click(function(){
				//활성화 효과 제거
				$(".place_page").removeClass('active');
				//활성화 효과 주기
				$(this).addClass('active');
				$.ajax({
					url:"/searchPlace.do/" + keyword + "/" + type + "/" + column + "/" + parseInt($(this).attr('page')) + "/" + tot_cnt + "/" + tot_page
					, type:'get'
					, dataType:'json'
					, success:function(list){
						//여행정보 리스트란 초기화
						$("#placeArea").empty();
						var divContainer = $("<div class='container'/>");
						var divRow = $("<div class='row'/>");
						//클릭한 페이지에 해당하는 여행장소 목록 출력
						$.each(list, function(idx, place){
							var divColMd4 = $("<div class='col-md-4'/>");
							var divThumbnail = $("<div class='thumbnail'/>");
							//링크
							var a = $("<a/>").attr('href', '/place/detailPlace_Info.do?place_no=' + place['place_no'] + '&place_type=' + place['place_type']);
							//이미지
							var img = $("<img class='place_info' style='width:300px;height:200px;'/>").attr('src', '/img/' + place['place_img'].split('|')[0]);
							//장소명 div
							var divCaption = $("<div class='caption' style='text-align:center;'/>");
							//장소명
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
			$(".container").css({"min-height": "100px"});
		}
		//마지막 페이지가 총 페이지 카운트보다 작으면. 다음 페이지가 있다고 간주, 다음 버튼 만들기.
		if(endPage < tot_page){
			var li = $("<li class='place_page' page='" + (endPage + 1) + "'/>");
			var span = $("<span/>").text('다음');
			$(li).append(span);
			$(li).click(function(){
				showPlacePageList(col_span, page + 1);							//다음 버튼 클릭 시 페이지 그룹에 +1해서 페이지 목록 새로 만듦.
				$(".place_page[page=" + $(this).attr('page') + "]").click();	//새로 만든 페이지 목록 중 page속성에 있는 값에 해당하는 페이지 번호 클릭하는 효과
			});
			$(ul).append(li);
		}
		$("#placePageArea").append(ul);
	}
	//게시판 종류 클릭 시 활성화 효과 주기
	$(".board").click(function(){
		$(".board").removeClass('active');
		$(this).addClass('active');
	});
	//게시판 클릭 시 검색조건 가져오기
	$('.boardInfo').click(function(){
		board_kinds = $(this).attr('board_kinds');
// 		clickedBoard = $(this);
		$.ajax({
			url:"/getBoardCondition.do/" + keyword + "/" + $(this).attr('board_kinds')
			, type:'get'
			, dataType:'json'
			, success:function(result){
				console.log(result);
				//게시판 검색조건란 초기화
				$("#boardKeywordArea").empty();
				//게시판 페이지란 초기화
				$("#boardPostPageArea").empty();
				//게시글란 초기화
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
						//활성화 효과 제거
						$(".board_column").removeClass('active');
						//활성화 효과 주기
						$(this).addClass('active');
						showBoardPageList($(this), 1);				//검색조건 클릭 시 페이지란 출력
						$(".board_page").first().trigger('click');	//출력된 페이지란의 첫 번째 페이지 클릭
					});
				});
				$(div).append(ul);
				//검색조건란에 검색조건 추가하기
				$("#boardKeywordArea").append(div);
				//첫 번째 검색조건 클릭하기
				$(".board_column").first().trigger('click');
				//첫 번째 페이지 클릭하기
				$(".board_page").first().trigger('click');
			}
		});
		console.log($(".board_column"));
	});
	//페이지 목록을 출력하는 함수		col_span -> 클릭한 검색조건 li	page -> 페이지 그룹
	function showBoardPageList(col_span, page){
		$("#boardPostPageArea").empty();
		var column = parseInt($(col_span).attr('column'));
		//검색 조건에 담긴 tot_cnt
		var tot_cnt = parseInt($(col_span).attr('tot_cnt'));
		//tot_cnt를 페이지 사이즈로 나눠서 총 페이지 계산
		var tot_page = Math.ceil(tot_cnt / boardPageSIZE);	//1	  2	  3   4		(페이지 그룹)
		//시작 페이지 계산
		startPage = ((page - 1) * pageGroup) + 1;			//1   6  11  16		(첫 번째 페이지)
		//마지막 페이지 계산
		endPage = (page * pageGroup);						//5  10  15  20		(마지막 페이지)
		//마지막 페이지가 총 페이지 수 보다 크면 총 페이지 수로 변경
		if(endPage > tot_page){
			endPage = tot_page;
		}
		var ul = $("<ul class='pagination'/>");
		//시작 페이지가 페이지 그룹보다 크면 -> 현재 페이지가 다음 페이지 그룹에 있다고 간주, 이전 버튼을 만듦.
		if(startPage > pageGroup){
			var li = $("<li class='board_page' page='" + (startPage - pageGroup) + "'/>");				//현재 페이지 그룹이 [이전] 11 12 13 14 15 [다음] 일 때, [이전]에는 11 - 5 = 6(startPage - pageGroup)이 담김.
			var span = $("<span/>").text('이전');
			$(li).append(span);
			$(li).click(function(){
				showBoardPageList(col_span, page - 1);									//이전 버튼 클릭. 페이지 그룹에서 -1해서 페이지 그룹을 새로 만듦.
				$(".board_page[page=" + $(this).attr('page') + "]").click();			//board_page라는 클래스 중의 page 속성(attribute)이 현재 클릭한 페이지의 page인 것을 클릭 시키는 효과. [이전] 11 12 13 14 15 [다음] 일 때, [이전] 6 7 8 9 10 [다음] 중 6을 클릭하는 효과
			});
			$(ul).append(li);
		}
		//이전, 다음을 제외한 페이지 번호 출력
		for(var i = startPage; i <= endPage; i++){
			var li = $("<li class='board_page' page='" + i + "'/>");
			var span = $("<span/>").text(i);
			$(li).append(span);
			$(li).click(function(){
				//활성화 효과 제거
				$(".place_page").removeClass('active');
				//활성화 효과 주기
				$(this).addClass('active');
				$.ajax({
					url:"/searchBoard.do/" + keyword + "/" + board_kinds + "/" + column + "/" + parseInt($(this).attr('page')) + "/" + tot_cnt + "/" + tot_page
					, type:'get'
					, dataType:'json'
					, success:function(list){
						console.log(list);
						//글 리스트란 초기화
						$("#boardPostArea").empty();
						var div = $("<div class='container'/>");
						var table = $("<table class='table table-hover'/>");
						var tHead = $("<thead/>");
						var trHead = $("<tr/>").append($("<th/>").text("게시판"), $("<th/>").text("말머리"), $("<th/>").text("글제목")
								, $("<th/>").text("닉네임"), $("<th/>").text("조회수"), $("<th/>").text("작성일"));
						$(tHead).append(trHead);
						$(table).append(tHead);
						var tbody = $("<tbody/>");
						//클릭한 페이지에 해당하는 여행장소 목록 출력
						$.each(list, function(idx, board){
							var tr = $("<tr/>");
							//게시판명
							var tdBoard = $("<td/>").text(board['board_kinds_str']);
							//말머리
							var tdHeadTag = $("<td/>").text(board['head_tag_name']);
							//링크
							var a = $("<a/>").attr('href', '/board/detailBoard_Post.do?board_no=' + board['board_no']).text(board['board_title']);
							//글 제목
							var tdBoardTitle = $("<td/>").append(a);
							//닉네임
							var tdNickname = $("<td/>").text(board['mem_nickname']);
							//조회수
							var tdBoardHit = $("<td/>").text(board['board_hit']);
							//글 작성일
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
			$(".container").css({"min-height": "100px"});
		}
		//마지막 페이지가 총 페이지 카운트보다 작으면. 다음 페이지가 있다고 간주, 다음 버튼 만들기.
		if(endPage < tot_page){
			var li = $("<li class='board_page' page='" + (endPage + 1) + "'/>");
			var span = $("<span/>").text('다음');
			$(li).append(span);
			$(li).click(function(){
				showBoardPageList(col_span, page + 1);							//다음 버튼 클릭 시 페이지 그룹에 +1해서 페이지 목록 새로 만듦.
				$(".board_page[page=" + $(this).attr('page') + "]").click();	//새로 만든 페이지 목록 중 page속성에 있는 값에 해당하는 페이지 번호 클릭하는 효과
			});
			$(ul).append(li);
		}
		$("#boardPostPageArea").append(ul);
	}
	//처음 페이지가 로드되고 나서 첫 번째 테마를 클릭하는 효과
	$(".themeInfo").first().trigger('click');
	//처음 페이지가 로드되고 나서 첫 번째 게시판종류를 클릭하는 효과
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
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>
</layoutTag:layout>