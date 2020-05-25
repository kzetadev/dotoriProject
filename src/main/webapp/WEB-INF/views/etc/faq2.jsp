<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
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
			<table class="table mytable">
				<tr>
					<td>1</td>
					<td>20/05/20</td>
					<td><a class="showmore">새로운 공지사항입니다.</a></td>
				</tr>
				<tr class="detail">
					<td colspan="3">
						<div>
							<table class="table">
								<tr>
									<td>확인 완료</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
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
		});
	</script>
</body>
</html>

</layoutTag:layout>