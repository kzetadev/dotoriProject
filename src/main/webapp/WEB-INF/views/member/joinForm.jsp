<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">

	h2{
		text-align:center;
	}
	.container{
		max-width: 300px;
		
	}
	#nickName_overlap{
		text-align: right;
		display: inline-block;
	}
	#id_overlap{
		text-align: right;
		display: inline-block;
	}
	#email_overlap{
		text-align: right;
		display: inline-block;
	
	}
	

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript">

$(function(){
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;//a~z, 0~9로 시작하는 4~12자리의 아이디를 만들 수 있다
	
	//비밀번호 정규식
	var pwdJ = /^[A-Za-z0-9]{4,12}$/; //A~Z,a~z,0-9로 시작하는 4~12자리의 비밀번호를 설정할 수 있다
	
	//이름 정규식
	var nameJ = /^[가-힣]{2,6}$/; //가~힣, 한글로 이뤄진 문자만으로 2~6자리까지의 이름만 작성할 수 있다
	
	//닉네임 정규식
	var nickJ = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,12}$/;
	
	//이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	//_(언더바)특수문자가 가능하며, 중앙에 @ 필수, .뒤에 2~3글자가 필요하다
	
	//닉네임 유효성 검사(1=중복/ 0 != 중복)
	$("#nickName_overlap").click(function(event){
		event.preventDefault();
		$("#nickname_check").css({ "display":"none"});
		var mem_nickname = $("#mem_nickname").val();
		$.ajax({
// 			url : '${pageContext.request.contextPath}/member/nickCheck.do?mem_nickname='+mem_nickname,
			url : '${pageContext.request.contextPath}/member/nickCheck.do',
			data:{
				mem_nickname:mem_nickname
			},
			type : "post",
			success : function(data){
				console.log("1 = 중복 / 0 != 중복 : "+ data);
				if(data != 0){
					
					console.log("닉네임 중복")
					//1: 닉네임 중복되는 문구 
					alert("사용중인 닉네임입니다")
				}else{
					console.log("닉네임 중복 아님")
					if(nickJ.test(mem_nickname)){
						// 0 : 닉네임 길이 / 문자열 검사
						$("#nickname_check").text("사용가능한 닉네임입니다");
						$("#reg_submit").attr("disabled", false);
					} else if(mem_nickname == ""){
						
						$("#nickname_check").text("닉네임을 입력해주세요");
// 						$("#nickname_check").css({"color":"red", "display":""});
						$("#reg_submit").attr("disabled", true);				
						
					}
					$("#nickname_check").css({"color":"green", "display":""});
				}
				},error : function(error){
					console.log("실패!!!!!!!!!!!!!!")
			}
		})
	}) 
	//아이디 유효성 검사(1=중복/ 0 != 중복)
	$("#id_overlap").click(function(event){
		event.preventDefault();
		$("#id_check").css({ "display":"none"});
		var mem_id = $("#mem_id").val();
		$.ajax({
// 			url : '${pageContext.request.contextPath}/member/idCheck.do?mem_id='+mem_id,
			url : '${pageContext.request.contextPath}/member/idCheck.do',
			type : "post",
			data:{
				mem_id:mem_id
			},
			success : function(data){
				console.log("1 = 중복 / 0 != 중복 : "+ data);
				if(data != 0){

					console.log("아이디 중복")
					
					alert("사용중인 아이디입니다")
	
				}else{
					console.log("아이디 중복 아님")
					if(idJ.test(mem_id)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("사용가능한 아이디입니다");
						$("#reg_submit").attr("disabled", false);
			
					} else if(mem_id == ""){
						
						$("#id_check").text("아이디를 입력해주세요");
//						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);				
						
					}
					$("#id_check").css({"color":"green", "display":""});
				}
				},error : function(error){
					console.log("실패!!!!!!!!!!!!!!")
			}
		})
	}) 
	
	//이메일 유효성 검사(1=중복/ 0 != 중복)
	$("#email_overlap").click(function(event){
		event.preventDefault();
		$("#email_check").css({ "display":"none"});
		var mem_email = $("#mem_email").val() + $("#mail2").val();
		$.ajax({
// 			url : '${pageContext.request.contextPath}/member/emailCheck.do?mem_email='+mem_email,
			url : '${pageContext.request.contextPath}/member/emailCheck.do',
			data:{
				mem_email:mem_email
			},
			type : "post",
			success : function(data){
				console.log("1 = 중복 / 0 != 중복 : "+ data);
				if(data != 0){
					console.log("이메일 중복")
					//1: 이메일이 중복되는 문구 
					alert("사용중인 이메일입니다")
	
				}else{
					console.log("이메일 중복 아님")
					console.log()
					if(mailJ.test(mem_email)){
						// 0 : 이메일 길이 / 문자열 검사
						$("#email_check").text("사용가능한 이메일입니다");
						$("#reg_submit").attr("disabled", false);
					} else if(mem_email == ""){
						
						$("#email_check").text("이메일을 입력해주세요");
//						$("#email_check").css({"color":"red", "display":""});
						$("#reg_submit").attr("disabled", true);				
						
					}
					$("#email_check").css({"color":"green", "display":""});
				}
				},error : function(error){
					console.log("실패!!!!!!!!!!!!!!")
			}
		})
	}) 
	//이름에 특수문자가 들어가지 않도록 설정
	$("#mem_name").blur(function(){
		if(nameJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#name_check").text("");
		}else{
			$("#name_check").text("이름을 다시 확인해주세요");
			$("#name_check").css("color","red");
		}
	})
	
	//비밀번호 유효성 검사
	//1-1 정규식 체크
	$("#mem_pwd").blur(function(event){
		event.preventDefault();
		$("#pwd_check").css({ "display":"none"});
		if(pwdJ.test($("#mem_pwd").val())){
			console.log("true!!");
			$("#pwd_check").text("사용가능한 비밀번호입니다");
//			$("#pwd_check").css("color","green");
			$("reg_submit").attr("disabled",false);
		}else{
			console.log("false!!");
			$("#pwd_check").text("");
			$("reg_submit").attr("disabled",false);

		}	
		$("#mem_pwd").css({"color":"green", "display":""});
	})
	//1-2 비밀번호 일치 확인
	$("#mem_pwdcheck").blur(function(event){
		event.preventDefault();
		$("#pwd2_check").css({ "display":"none"})
		if($("#mem_pwd").val() == $(this).val()){
			
			$("#pwd2_check").text("비밀번호가 일치합니다");
			$("#reg_submit").attr("disabled", false);
			//$("#pwd2_check").css("color","green");
			
		}else{
			$("#pwd2_check").text("비밀번호가 불일치합니다");
			
			$("#pwd2_check").css("color","red");
		}
		$("#pwd2_check").css({"color":"red", "display":""});
	})
	
	
	
	//가입하기 실행 버튼 유효성 검사
	$.ajaxPrefilter(function(options, originalOptions, jqXHR){
		var token = "${_csrf.token}";
		jqXHR.setRequestHeader('X-CSRF-Token', token);
	});
	var inval_Arr = new Array(4).fill(false);
// 	$("#form").submit(function(event){
// 		event.preventDefault();
	$("#reg_submit").click(function(){
		console.log("가입하기 실행버튼 유효성 검사 성공")
			//이름 정규식
			if(nameJ.test($("#mem_name").val())){
				console.log("이름 정규식 성공")
					inval_Arr[0] = true;
			}else {
				console.log("이름 정규식 실패")
					inval_Arr[0] = false;	
			}
			//닉네임 정규식
			if(nickJ.test($("#mem_nickname").val())){
				console.log("닉네임 정규식 성공")
					inval_Arr[1] = true;
			}else {
				console.log("닉네임정규식 실패")
					inval_Arr[1] = false;	
			}

			//이메일 정규식
			if(mailJ.test($("#mem_email").val() + $("#mail2").val())){
				console.log("이메일 정규식 성공")
				inval_Arr[2] = true;
			}else{
				console.log("이메일 정규식 실패")
				inval_Arr[2] = false;
			}
			//비밀번호가 같은 경우 && 비밀번호 정규식
			if(($("#mem_pwd").val() == ($("#mem_pwdcheck").val()))
						&& pwdJ.test($("#mem_pwd").val())) {
				console.log("가입하기 실행버튼 유효성 검사 성공 ")
					inval_Arr[3] = true;
				}else{
					console.log("가입하기 실행버튼 유효성 검사 실패 ")
					inval_Arr[3] = false;
				}

			//유효성 모두 통과
			var validAll = true;
			for(var i = 0; i< inval_Arr.length; i++){
				console.log("유효성 모두 통과 성공 for")
				if(inval_Arr[i] == false){
					console.log("유효성 모두 통과 성공 if")
					validAll = false;
				}
			}
		if(validAll){
			location.href="/member/login.do";
			var mem_info = {
				mem_id: $("#mem_id").val(),
				mem_name:$("#mem_name").val(),
				mem_nickname:$("#mem_nickname").val(),
				mem_pwd:$("#mem_pwd").val(),
				mem_email:$("#mem_email").val() + $("#mail2").val()
			};
			console.log(mem_info);
			console.log(mem_info.mem_email);
// 			alert(mem_info);
			$.ajax({
				url:"/member/join.do",
				type:"POST",
				data:mem_info,
				success:function(result){
					console.log("join result : " + result);
					alert(result);
				}
			});
			
		}else{
			console.log("입력한 정보들을 다시 한 번 확인 해주세요")
		}
	});
// 	})
})
</script>

</head>
<body>
	<div class="container">
		<div class="titleStyle">
			<h2>회원가입</h2>
		</div>
<!-- 		<form id="form" method="POST" action="/member/join.do" name="memInfo"> -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<!-- 세션에 저장한 소셜 아이디를 가져옴  -->
			<c:if test="${!empty whatid }">
				<input type="hidden" name="whatid" value="${whatid}"/>
			</c:if>
			
		<!--세션에 저장한 소셜 구분을 가져옴 -->
			<c:if test="${!empty divide }">
				<input type="hidden" name="divide" value="${divide }"/>
			</c:if>  
		
			<!-- 성명 -->
			<div class="form-froup">
				<label for="mem_name">성명</label>
					<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="성명">
				<div class="check_font" id="name_check"></div>
			</div>
			
			<!-- 닉네임 -->
			<div class="form-group">
				<label for="mem_nickname">닉네임</label>
				<input type="text" class="form-control" id="mem_nickname" name="mem_nickname" placeholder="닉네임">
				<button id="nickName_overlap">중복확인</button>
				<div class="check_font" id="nickname_check"></div>
			</div>
			
			<!-- 아이디 -->
			<div class="form-group">
				<label for="mem_id">아이디</label>
					<input type="text" class="form-control" id="mem_id" name="mem_id"placeholder="아이디">
				<button id="id_overlap">중복확인</button>
				<div class="check_font" id="id_check"></div>
				
			</div>
			
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="mem_pwd">비밀번호</label>
					<input type="password" class="form-control" id="mem_pwd" name="mem_pwd" placeholder="비밀번호">
				<div class="check_font" id="pwd_check"></div><!-- class 속성은 css를 적용하는데 사용, id의 경우는 고유의 이름으로 스크립트가 적용되도록 설정하는데 사용 -->
			</div>
			
			<!-- 비밀번호 확인 -->
			<div class="form-group">
				<label for="mem_pwdcheck">비밀번호 확인</label>
					<input type="password" class="form-control" id="mem_pwdcheck" name="mem_pwdcheck"  placeholder="비밀번호 확인">
				<div class="check_font" id="pwd2_check"></div><!-- 유효성 검사후, 경고문은 div 안으로 문자가 들어간다고 생각하면 됨.(<div></div>사이에 -->
			</div>
			
			<!-- 이메일 -->
			<div class="form-group">
				<label for="mem_email">이메일</label>
					<input type="text" class="form-control" name="mem_email" id="mem_email" placeholder="E-mail" maxlength="50">@
						<select id="mail2" name="mail2">
                            <option value="@naver.com">naver.com</option>
                            <option value="@daum.net">daum.net</option>
                            <option value="@gmail.com">gmail.com</option>
                            <option value="@nate.com">nate.com</option>                        
                        </select>
					<button id="email_overlap">중복확인</button>
					<div class="check_font" id="email_check"></div>
				</div>
				<div class="reg" style="text-align:center">
			<button class="btn btn-primary px-3" id="reg_submit">
				<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기</button>
			
			<div class="reg btn">
					<a class="btn btn-danger px-3" href="${pageContext.request.contextPath}">
						<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>초기화</a>
			</div>
			</div>
<!-- 		</form> -->
		</div>
	</body>
</html>
</layoutTag:layout>