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
	div#themeArea{
		border: 2px solid lightgray;
		margin: 5px 5px 5px 5px;
		padding: 10px 10px 10px 10px;
	}
	div.theme, .column, .place_thumbnail, #placePageArea{
		display:inline-block;
	}
	span.themeInfo, .place_column, .place_thumbnail, .place_page{
/* 		display:inline-block; */
		border: 2px solid lightgray;
		border-radius: 3px;
		margin: 5px 5px 5px 5px;
		padding: 5px 5px 5px 5px;
	}
	span.place_plage{
		
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
	$(".themeInfo").click(function(){
		console.log($(this).attr('type'));
		type = $(this).attr('type');
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
						showPageList($(this), 1);
/*
						$("#placePageArea").empty();
						var tot_cnt = parseInt($(this).attr('tot_cnt'));
						var tot_page = Math.ceil(tot_cnt / pageGroup);
						startPage = ((currPage - 1) * pageGroup) + 1;		//1  6 11 16
						endPage = (currPage * pageGroup);					//5 10 15 20
						if(startPage > pageGroup){
							var span = $("<span class='place_page' page='" + (startPage - pageGroup) + "'/>").text('이전');
							$("#placePageArea").append(span);
							movePage($(this), 'prev');
						}
						for(var i = startPage; i <= endPage; i++){
							var span = $("<span class='place_page' page='" + i + "'/>").text(i);
							$("#placePageArea").append(span);
						}
						if(endPage < tot_page){
							var span = $("<span class='place_page' page='" + (endPage + 1) + "'/>").text('다음');
							$("#placePageArea").append(span);
							movePage($(this), 'next');
						}
*/
/*
						console.log('search_cnt : ' + $(this).attr('tot_cnt'));
						console.log('pageSIZE : ' + pageSIZE);
						totalRecord = parseInt($(this).attr('tot_cnt'));														
						totalPage = Math.ceil(totalRecord / pageSIZE);		//	27 / 8 = 4
						pageGroup = currPage * 5;
						if(pageGroup > totalPage){							//	5 > 4
							pageGroup = totalPage;
						}
						console.log('totalPage : ' + totalPage);
						console.log('pageGroup : ' + pageGroup);
						// 1  2  3  4  5
						// 6  7  8  9 10
						//11 12 13 14 15
						for(var i = currPage; i <= pageGroup; i++){
							var span;
							if(currPage >= pageGroup){
								span = $("<span class='place_page' page='" + (currPage - 1) + "'/>").text('이전');
							}
							if(i < totalPage){
								span = $("<span class='place_page' page='" + (currPage + 1) + "'/>").text('다음');
							}
							$(span).click(function(){
								$.ajax({
									url:"/searchPlace.do/" + keyword + "/" + type + "/" + column + "/" + parseInt($(this).attr('page'))
									, type:'get'
									, dataType:'json'
									, success:function(list){
										$("#placeArea").empty();
										$.each(list, function(idx, place){
											var div = $("<div class='place_thumbnail'/>");
											var img = $("<img class='place_info'/>").attr('src', '/img/' + place['place_img'].split('|')[0]);
											var span = $("<span class='place_info'/>").text(place['place_name']);
											$(div).append(img, span);
											$("#placeArea").append(div);
										});
									}
								});
							});
							$("#placePageArea").append(span);
						}
*/
					});
				});
			}
		});
		console.log($(".place_column"));
		$(".place_column").first().trigger('click');
	});
	function showPageList(col_span, page){
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
				showPageList(col_span, page - 1);
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
							var div = $("<div class='place_thumbnail'/>");
							var img = $("<img class='place_info'/>").attr('src', '/img/' + place['place_img'].split('|')[0]);
							var span = $("<span class='place_info'/>").text(place['place_name']);
							$(div).append(img, span);
							$("#placeArea").append(div);
						});
					}
				});
			});
		}
		if(endPage < tot_page){
			var span = $("<span class='place_page' page='" + (endPage + 1) + "'/>").text('다음');
			$("#placePageArea").append(span);
			$(span).click(function(){
				showPageList(col_span, page + 1);
			});
		}
	}
// 	function showPageList(span, page){
// 		$("#placePageArea").empty();
// 		var tot_cnt = parseInt($(span).attr('tot_cnt'));
// 		var tot_page = Math.ceil(tot_cnt / pageGroup);
// 		startPage = ((currPage - 1) * pageGroup) + 1;		//1  6 11 16
// 		endPage = (currPage * pageGroup);					//5 10 15 20
// 		if(startPage > pageGroup){
// 			var span = $("<span class='place_page' page='" + (startPage - pageGroup) + "'/>").text('이전');
// 			$("#placePageArea").append(span);
// 			$(span).click(function(){
// 				showPageList($(this));
// 			});
// 		}
// 		for(var i = startPage; i <= endPage; i++){
// 			var span = $("<span class='place_page' page='" + i + "'/>").text(i);
// 			$("#placePageArea").append(span);
// 		}
// 		if(endPage < tot_page){
// 			var span = $("<span class='place_page' page='" + (endPage + 1) + "'/>").text('다음');
// 			$("#placePageArea").append(span);
// 			$(span).click(function(){
// 				showPageList($(this));
// 			});
// 		}
// 	}
	
	$(".themeInfo").first().trigger('click');
});
</script>
</head>
<body>
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
</body>
</html>
</layoutTag:layout>