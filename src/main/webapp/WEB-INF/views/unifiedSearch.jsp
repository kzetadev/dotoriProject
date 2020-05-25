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
	div.theme, .column, .place_thumbnail{
		display:inline-block;
	}
	span.themeInfo, .place_column, .place_thumbnail{
/* 		display:inline-block; */
		border: 2px solid lightgray;
		border-radius: 3px;
		margin: 5px 5px 5px 5px;
		padding: 5px 5px 5px 5px;
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
	var keyword = '${keyword}';
	var type;
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
				$.each(result, function(idx, item){
					var div = $("<div class='column'/>");
					var column = item['condition_col'];
					var span = $("<span class='place_column' column='" + column + "' tot_cnt='" + item['search_cnt'] + "'/>").text(item['condition_kor']);
					$(div).append(span);
					$("#placeKeywordArea").append(div);
					$(div).click(function(){
						$.ajax({
							url:"/searchPlace.do/" + keyword + "/" + type + "/" + column
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
				});
			}
		});
	});
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
</body>
</html>
</layoutTag:layout>