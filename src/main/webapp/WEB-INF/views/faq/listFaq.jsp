<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
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
	.wrapper h2 {
		text-align: center;
	}
	.wrapper{
		text-align: center;
	}
	
	/* 사용자는 안보이고 관리자에게만 보이게 */
	/*#btnAdd, .btnUpdate, .btnDelete{
		visibility: hidden;
	}*/
</style>
</head>
<body>
	<div class="wrapper">
		<h2>FAQ</h2>
		<sec:authorize access="hasRole('ADMIN')">
			<button type="button" class="btn btn-default" id="btnAdd">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			</button>
		</sec:authorize>
		
		<div class="container">
			<table class="table mytable">
				<c:forEach var="f" items="${f_list }">
					<tr>
						<td><span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span></td>
						<td><a class="showmore">${f.faq_question }</a></td>
						<td colspan="6">
							<sec:authorize access="hasRole('ADMIN')">
								<button type="button" class="btn btn-default btnUpdate" faq_no="${f.faq_no }">
									<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default btnDelete" faq_no="${f.faq_no }">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</button>
							</sec:authorize>
						</td>
					</tr>

					<tr class="detail">
						<td colspan="6">
							<div>
								<table class="table">
									<tr>
										<td>
											<span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
										</td>
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
			$("#btnAdd").click(function() {
				location.href = "/faq/insertFaq.do"
			})
			$(".btnUpdate").click(function() {
				location.href = "/faq/updateFaq.do"
			})
			$(".btnDelete").click(function() {
				var faq_no = $(this).attr("faq_no")
				var a = confirm("정말로 삭제하시겠습니까?")
				if (a == true) {
					$.ajax({
						url : "/faq/deleteFaq.do",
						type : "POST",
						data : {
							faq_no : faq_no
						},
						beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
						},
						success : function(result) {
							if (result == 1) {
								jAlert("삭제 되었습니다.", "삭제", function(){
									location.href = "/faq/listFaq.do"
								})
							}
						}
					})
				}
			})
		});
	</script>
</body>
</html>

</layoutTag:layout>