<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자주 묻는 질문들</title>
	<link rel="shortcut icon" href="notebook.png" type="image/x-icon" />
	<style>
		h3 {
			font-weight: 900;
		}
		body {
			font-family: Arial;
		}
		.accordion {
			background-color: #eee;
			color: #444;
			cursor: pointer;
			padding: 18px;
			width: 100%;
			border: none;
			text-align: left;
			outline: none;
			font-size: 15px;
			transition: 0.4s;
		}
		
		.active, .accordion:hover {
			background-color: #ccc;
		}
		
		.panel {
			padding: 0 18px;
			display: none;
			background-color: white;
			overflow: hidden;
		}
		
		.menuA {
			width: fit-content;
			height: 50px;
			margin: auto;
		}
	
		input#search {
			background: blueviolet;
			color: white;
			font-weight: bold;
			border: 0 none;
		}
		
		.member_more {
			background-color: blueviolet;
			font-weight: bold;
			border: 1px solid blueviolet;
			padding: 1%;
			border-radius: 10px;
			color: white;
		}
		
		caption {
			padding-top: 8px;
			padding-bottom: 8px;
			color: #777;
			text-align: right;
		}
		
		ul#gnb a {
			font-size: 18px;
		}
		
		.container.mks_top {
			margin-top: 5%;
		}
		
		.tab button.active {
			background-color: #F56D6D;
		}
		
		.tab {
			font-weight: bold;
			color: white;
			background-color: blueviolet;
		}
		
		#mks_image thead {
			font-weight: bold;
		}
		
		.popup_notice {
			position: fixed;
			width: 300px;
			right: 25%;
			top: 30%;
			background-color: #FFFFF0;
			z-index: 1000;
		}
		

	</style>
</head>
<body>
	<div>
		<div class="container">
			<br> <br>
			<h3 class="image_active">회원</h3>
			<button class="accordion">쉼표 계정에 대한 문의는 어디에서 하나요?</button>
			<div class="panel_">
				<br>
				<p>쉼표 서비스 이용을 위한 로그인/회원가입 등 쉼표 계정 관련 문의는 ☎1588-0610으로 문의하시기 바랍니다.</p>
			</div>

			<button class="accordion">쉼표 계정 이란?</button>
			<div class="panel_">
				<br>
				<p>하나의 계정을 통해 다양한 서비스를 방문/이용할 수 있도록 제공되는 통합 계정 서비스입니다.</p>
			</div>

			<br> <br> <br>
			<h3>회원가입</h3>
			<button class="accordion">쉼표 회원 가입 시 혜택이 있나요?</button>
			<div class="panel_">
				<br>
				<p>
					쉼표의 회원이 되시면 ... @@@<br>
				</p>
			</div>
			<button class="accordion">email 인증번호가 오지를 않아요.</button>
			<div class="panel_">
				<br>
				<p>
					쉼표 계정에서 보내드린 email 인증 번호가 수신함에 없다면, 먼저 스팸 email함에 있는지 확인 부탁드립니다.<br>
					받은 email함, 스팸 email함에서도 인증 email을 찾으실 수 없다면, ☎1588-0610으로 연락 주시길 바랍니다.
				</p>
			</div>
			<button class="accordion">email 인증이 성공적으로 되었는지 확인하고 싶어요.</button>
			<div class="panel_">
				<br>
				<p>
					email 인증이 성공적으로 완료되었는지 확인하고 싶으면, 가입하신 아이디와 비밀번호로 로그인을 시도해 보세요.<br>
					로그인이 되어 서비스를 이용할 수 있는 계정은 email 인증이 성공적으로 완료된 계정입니다.
				</p>
			</div>

			<br> <br> <br>
			<h3>로그인</h3>
			<button class="accordion">쉼표 계정에 가입한 아이디를 찾고 싶어요.</button>
			<div class="panel_">
				<br>
				<p>쉼표 계정을 찾기 위해서는 로그인 페이지의 '아이디 찾기 및 비밀번호 찾기' 링크를 통해 찾을 수 있습니다.</p>
			</div>

			<br> <br> <br>
			<h3>회원 정보 조회/변경 및 회원 탈퇴</h3>
			<button class="accordion">회원 정보를 수정하고 싶어요.</button>
			<div class="panel_">
				<br>
				<p>나의 정보는 마이페이지 버튼을 클릭하여 찾을 수 있고, 비밀번호 입력하시고 회원 정보 수정이 가능합니다.</p>
			</div>
			<button class="accordion">회원 탈퇴 시 유의해야 하는점이 무엇인가요?</button>
			<div class="panel_">
				<br>
				<p>
					회원에서 탈퇴하면 쉼표 계정으로 가입된 모든 서비스에서 일괄 탈퇴되며,<br>
					이에 따라 각종 이용 내역이 모두 삭제됩니다.
				</p>
			</div>
			<button class="accordion">탈퇴는 어디에서 할 수 있나요?</button>
			<div class="panel_">
				<br>
				<p>회원 탈퇴는 쉼표 계정 사이트에 로그인하신 후에 마이 페이지 -> 비밀번호 재입력 -> 회원 정보 수정 -> 탈퇴 팝업 창 -> 확인 버튼을 클릭하여 탈퇴할 수 있습니다.</p>
			</div>
			<br> <br> <br>
			<script>
				var acc = document.getElementsByClassName("accordion");
				var i;

				$(".panel_").hide();

				for (i = 0; i < acc.length; i++) {
					acc[i].addEventListener("click", function() {
						this.classList.toggle("active");
						var panel = this.nextElementSibling;
						if (panel.style.display === "block") {
							panel.style.display = "none";
						} else {
							panel.style.display = "block";
						}
					});
				}
			</script>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>

</layoutTag:layout>