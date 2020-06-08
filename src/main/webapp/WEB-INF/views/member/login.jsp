<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	h2{
		text-align:center;
	}
	.container{
		max-width: 300px;
		width: 100%; 
		height: 100vh; 
		display: -webkit-box; 
		display: -ms-flexbox; 
		display: flex; 
		-webkit-box-align: center; 
		-ms-flex-align: center; 
		align-items: center; 
		-webkit-box-pack: center; 
		-ms-flex-pack: center; 
		justify-content: center;
	}
	h2{
	 color: black; 
   text-shadow: 0 0 10px rgba(0,0,0,0.3); 
   letter-spacing:1px; 
   text-align:center;
	}
	#find{
		text-align: right;
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
})
</script>
</head>
<body>
	
	
<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
	<c:if test="${not empty cookie.user_check}">
		<c:set value="checked" var="checked"/>
	</c:if>

	<form action="/member/login.do" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
		<div class="container">
		
			<div class="area_inputs wow fadeIn">
			<h2>로그인</h2>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					<input type="text" class="form-control" id="mem_id" name="mem_id" value="${cookie.user_check.value}" placeholder="아이디를 입력해주세요.">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					<input type="password" class="form-control" id="mem_pwd" name="mem_pwd" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="form-group">
					<span class="font-weight-bold text-white bg-dark" id="spanLoginCheck"></span>
				</div>
				<div class="form-group">
<!-- 					<label class="font-weight-bold text-white">  -->
<%-- 						<input type="checkbox" id="remember_us" name="remember_memId" ${checked}> 아이디 기억하기 --%>
<!-- 					</label> -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<!-- <label class="font-weight-bold text-white"> 
						<a href="${pageContext.request.contextPath}/user/userSearch" id="find">계정찾기</a>
					</label>  -->
					  
					<div>
						<button id="loginBtn" type="submit"	class="btn btn-primary btn-block">로그인</button>
					</div>
				</div>
					<div class="form-group">
						<a class="btn btn-deep-orange btn-block" href="${pageContext.request.contextPath}/member/joinForm.do">회원가입</a>
					</div>
					
					<div class="form-group">
						<a class="btn btn-deep-orange btn-block" href="${pageContext.request.contextPath}/member/findMem_id.do">계정찾기</a>
					</div>
								
					<!-- <button class="btn btn-default" style="background-color:#EFEFEF; color:black;"></button> -->

				<%--스프링 시큐리티 제공 최근 발생한 인증 오류 메시지--%>
				<%--https://postitforhooney.tistory.com/entry/SpringSecurity-%EC%B4%88%EB%B3%B4%EC%9E%90%EA%B0%80-%EC%9D%B4%ED%95%B4%ED%95%98%EB%8A%94-Spring-Security-%ED%8D%BC%EC%98%B4 --%>
				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
					<span class="text-danger">
						<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message }"/>
						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
					</span>
				</c:if>
			</div>
		</div>
	</form>
</body>
</html>

</layoutTag:layout>