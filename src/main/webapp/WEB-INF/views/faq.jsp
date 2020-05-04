<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="notebook.png" type="image/x-icon" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>자주 묻는 질문들</title>
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
			<button class="accordion">LG 계정에 대한 문의는 어디로 하나요</button>
			<div class="panel_">
				<br>
				<p>LG 서비스 이용을 위한 회원가입/로그인 등 삼성 계정 관련 문의는 ☎1588-3366으로 문의하시기
					바랍니다.</p>
			</div>

			<button class="accordion">LG 계정(LG account) 이란?</button>
			<div class="panel_">
				<br>
				<p>하나의 계정을 통해 다양한 LG 기반의 서비스를 방문/이용할 수 있도록 제공되는 통합 계정 서비스 입니다</p>
			</div>

			<br> <br> <br>
			<h3>회원가입</h3>
			<button class="accordion">LG닷컴 회원 가입 시 혜택이 있나요?</button>
			<div class="panel_">
				<br>
				<p>
					LG닷컴의 회원이 되시면 상품 구매 시 3% 할인과 구매 금액에 따라 삼성전자 포인트 적립 혜택을 드립니다.<br>
					(단, 휴대폰/태블릿/기어 및 일부 제품은 회원 3% 할인 제외)
				</p>
			</div>
			<button class="accordion">인증 E-mail을 받지 못했어요.인증 E-mail을 다시
				받고 싶어요.</button>
			<div class="panel_">
				<br>
				<p>
					LG 계정에서 보내드린 인증 E-mail이 수신함에 없다면, 스팸E-mail 함에 있는지 먼저 확인을 부탁드립니다. <br>받은
					E-mail 함, 스팸E-mail 함에서도 인증 E-mail을 찾으실 수 없다면,아래 알려드리는 방법으로 인증
					E-mail을 다시 받으실 수 있습니다.
				</p>
			</div>
			<button class="accordion">E-mail 인증이 성공적으로 되었는지 확인하고 싶어요.</button>
			<div class="panel_">
				<br>
				<p>
					E-mail 인증이 성공적으로 완료되었는지 확인하고 싶으시면, 가입하신 E-mail과 비밀번호로 로그인을 시도해 보세요.
					<br>로그인이 되어 서비스를 이용할 수 있는 계정은 E-mail 인증이 성공적으로 완료된 계정입니다.
				</p>
			</div>

			<br> <br> <br>
			<h3>로그인</h3>
			<button class="accordion">LG 계정에 가입한 ID(E-mail)를 찾고 싶어요.</button>
			<div class="panel_">
				<br>
				<p>LG 계정을 찾기 위해서는 로그인 페이지의 'ID 찾기 및 비밀번호 재설정' 링크를 통해 찾을 수 있습니다.</p>
			</div>

			<br> <br> <br>
			<h3>회원정보 조회/변경</h3>
			<button class="accordion">내 회원정보는 어디서 찾을 수 있나요?</button>
			<div class="panel_">
				<br>
				<p>나의 정보는 마이LG> 나의 정보 > '회원 정보 확인' 버튼을 클릭하여 비밀번호 입력하시면 삼성 계정의 가입
					정보를 확인하실 수 있습니다.</p>
			</div>
			<button class="accordion">비밀번호는 어떻게 변경하나요?</button>
			<div class="panel_">
				<br>
				<p>
					LG닷컴에 로그인 후 마이LG > 나의 정보 > '회원 정보 확인' 버튼을 클릭하여 LG 계정의 비밀번호 변경 페이지로
					이동하여 변경하거나 <br>또는 LG 계정 사이트를 직접 방문하여 변경하실 수 있습니다.
				</p>
			</div>

			<br> <br> <br>
			<h3>회원탈퇴</h3>
			<button class="accordion">회원 탈퇴 시 유의해야 하는점이 무엇인가요?</button>
			<div class="panel_">
				<br>
				<p>
					회원에서 탈퇴하면 삼성 계정으로 가입된 모든 서비스에서 일괄 탈퇴되며 <br>이에 따라 서비스 이용 내역,
					다운로드 내역, 구매 내역, 멤버십 등급 및 포인트, 쿠폰 등이 모두 삭제됩니다.
				</p>
			</div>
			<button class="accordion">탈퇴는 어디에서 할 수 있나요?</button>
			<div class="panel_">
				<br>
				<p>회원 탈퇴는 LG 계정 사이트에 로그인하신 후에 프로필 > 계정 탈퇴클릭 > 비밀번호 재입력 > 동의 >
					'확인' 버튼을 클릭하여 탈퇴할 수 있습니다.</p>
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
</body>
</html>