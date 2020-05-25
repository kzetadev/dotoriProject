<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 목록</title>
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/> -->
<link href="css/jquery-ui.min.css" rel="stylesheet" />
<!-- <link href="css/custom.css" rel="stylesheet" /> -->
<style type="text/css">
	tr.detail {
		display: none;
		width: 100%;
	}
	tr.detail div {
		display: none;
	}
	.showmore:hover {
		cursor: pointer;
	}
	.wrapper h2{
		text-align: center;
	}
</style>
</head>
<body>
<div class="wrapper">
		<h2>FAQ</h2>
		<br>
		<div class="container">
			<button id="btnAdd">추가</button>
			<table class="table mytable">
			
				<c:forEach var="f" items="${f_list }">
					<tr>
						<td><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span></td>
						<td><a class="showmore">${f.faq_question }</a></td>
						<td colspan="3">
							<button class="btnUpdate">수정</button>
							<button class="btnDelete">삭제</button>							
						</td>
					</tr>
	
					<tr class="detail">
						<td colspan="6">
							<div>
								<table class="table">
									<tr>
										<td><td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td></td>
										<td>${f.faq_answer }</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- <script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/jquery-ui.min.js"></script> -->

	<!-- Latest compiled and minified JavaScript -->
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
	<script>
		$(function() {
			$('a.showmore').click(function(e) {
				e.preventDefault();
				// We break and store the result so we can use it to hide the row after the slideToggle is closed
				var targetrow = $(this).closest('tr').next('.detail');
				targetrow.show().find('div').slideToggle('slow', function() {
					if (!$(this).is(':visible')) {
						targetrow.hide();
					}
				});
			});
			$("#btnAdd").click(function(){
				location.href = "/faq/insertFaq.do"
			})
			$(".btnUpdate").click(function(){
				location.href = "/faq/updateFaq.do"
			})
			$(".btnDelete").click(function(){
				var faq_no = $(this).attr("faq_no")
				var a = confirm("정말로 삭제하시겠습니까?")
				if(a == true){
					$.ajax({url:"/faq/deleteFaq.do", type:"POST", data:{faq_no:faq_no}, success:function(result){
						if(result == 1){
							location.href = "/faq/listFaq.do"
						}
					}})
				}
			})
		});
	</script>
</body>
</html>

</layoutTag:layout>