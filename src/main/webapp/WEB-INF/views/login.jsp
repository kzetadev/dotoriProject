<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
$('#loginBtn').click(function() {
	var id = $('#inputId').val();
	var pw = $('#inputPassword').val();
		$.ajax({
		type : 'post', // 비밀번호의 값이 url에 표시되면 안 되기 때문에 보안을 위해 POST 방법으로 값을 보낸다
		url : '${pageContext.request.contextPath}/login.do',
		data : {
			mem_id : id,
			mem_pwd : pwd,
			},
			success : function(data) {
				if (data == 0) { //로그인 실패시
					console.log(data);
					$('#spanLoginCheck').text('로그인 정보를 정확히 입력해주세요.');					
				} else if (data == -3) { // 아이디가 사용중이라면?
					console.log(data);
					location.href = '${pageContext.request.contextPath}/user/redundant?mem_id=' + id + '&user_Pw=' + pw + '&remember_userId=' + remember_us;						
				} else { //로그인 성공시
					console.log(data);
					location.href = '${pageContext.request.contextPath}/user/storeChoice';
				}
			}
		});
	});
})
</script>
</head>
<body>
<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
	<c:if test="${not empty cookie.user_check}">
		<c:set value="checked" var="checked"/>
	</c:if>


<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="form-group">
					<label class="font-weight-bold text-white" for="inputId">아이디</label>
					<div>
						<input type="text" class="form-control" id="inputId" name="mem_id" value="${cookie.user_check.value}" placeholder="아이디">
					</div>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white" for="inputPassword">비밀번호</label>
					<div>
						<input type="password" class="form-control" id="inputPassword" name="mem_pwd" placeholder="비밀번호">
					</div>
				</div>
				<div class="form-group">
					<span class="font-weight-bold text-white bg-dark" id="spanLoginCheck"></span>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white"> 
						<input type="checkbox" id="remember_us" name="remember_userId" ${checked}> 아이디 기억하기
					</label>
					<div class="interval_height a_none">
						<a href="${pageContext.request.contextPath}/user/userSearch">&nbsp; 계정찾기</a>
					</div>
					<div>
						<button id="loginBtn" type="button"	class="btn btn-primary btn-block">로그인</button>
					</div>
				</div>
				<div class="form-group">
					<a class="btn btn-deep-orange btn-block" href="${pageContext.request.contextPath}/joinForm.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>