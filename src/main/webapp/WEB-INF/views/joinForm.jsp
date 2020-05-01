<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//아이디 유효성 검사(1=중복/ 0 != 중복)
	$("#mem_id").blur(function(){
		var mem_id = $("#mem_id").val();
		$.ajax({
			url : 



		})
	})
</script>

</head>
<body>
<div class="container">
	<div class-"title>
		<h1>회원가입</h1>
	</div>
</div>
	<form method="POST">
		<!-- 성명 -->
		<div class="form-froup">
			<label for="mem_name">성명</label>
				<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="성명" required="required">
			<div class="check_font" id="name_check"></div>
		
		</div>
		<!-- 닉네임 -->
		<div class="form-group">
			<label for="mem_nickname">닉네임</label>
				<input type="text" class="form-control" id="mem_nickname" name="mem_nickname" placeholder="닉네임" required="required">
				<div class="check_font" id="nickname_check"></div>
		</div>
		<!-- 아이디 -->
		<div class="form-group">
			<label for="mem_id">아이디</label>
				<input type="text" class="form-control" id="mem_id" name="mem_id"placeholder="아이디" required="required">
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="mem_pwd">비밀번호</label>
				<input type="password" class="form-control" id="mem_pwd" name="mem_pwd" placeholder="비밀번호" required="required" >
		</div>
		<div class="form-group">
			<label for="mem_pwdcheck">비밀번호 확인</label>
				<input type="password" class="form-control" id="mem_pwdcheck" name="mem_pwdcheck"  placeholder="비밀번호 확인" required="required">
		</div>
		<div class="form-group">
				<label for="user_email">이메일</label>
					<input type="text" class="form-control" name="user_email" id="user_email" placeholder="E-mail" required>
					<!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
						<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
							<i class="fa fa-envelope"></i>&nbsp;인증
						</button>&nbsp;
						<button type="button" class="btn btn-outline-info btn-sm px-3">
							<i class="fa fa-envelope"></i>&nbsp;확인
						</button>&nbsp; -->
					<div class="check_font" id="email_check"></div>
			</div>
		
	</form>
</body>
</html>