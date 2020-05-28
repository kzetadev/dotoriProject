<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
<%-- Remove the navbar's default margin-bottom and rounded borders --%>
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

<%-- Set height of the grid so .sidenav can be 100% (adjust as needed) --%>
.row.content {
	height: 450px
}

<%-- Set gray background color and 100% height --%>
.sidenav {
	padding-top: 20px;
	background-color: white;
	height: 100%;
}

<%-- On small screens, set height to 'auto' for sidenav and grid --%>
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

a {
	color: #337ab7;
	text-decoration: none;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//닉네임 정규식
		var nickJ = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,12}$/;
		

		$.ajaxPrefilter(function(options, originalOptions, jqXHR){
			var token = "${_csrf.token}";
			jqXHR.setRequestHeader('X-CSRF-Token', token);
		});
		
		$("#nickName_overlap").click(function(event){
			event.preventDefault();
			$("#nickname_check").css({ "display":"none"});
			var mem_nickname = $("#mem_nickname").val();
			$.ajax({
//	 			url : '${pageContext.request.contextPath}/member/nickCheck.do?mem_nickname='+mem_nickname,
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
							$("#updateBtn").attr("disabled", false);
						} else if(mem_nickname == ""){
							
							$("#nickname_check").text("닉네임을 입력해주세요");
//	 						$("#nickname_check").css({"color":"red", "display":""});
							$("#updateBtn").attr("disabled", true);				
							
						}
						$("#nickname_check").css({"color":"green", "display":""});
					}
					},error : function(error){
						console.log("실패!!!!!!!!!!!!!!")
				}
			})			
		})
		
		var inval_Arr = new Array(1).fill(false);
		$("#updateBtn").click(function(){
			console.log("가입하기 실행버튼 유효성 검사 성공")
			if(nickJ.test($("#mem_nickname").val())){
				console.log("닉네임 정규식 성공")
					inval_Arr[0] = true;
			}else {
				console.log("닉네임정규식 실패")
					inval_Arr[0] = false;	
			}
			var validAll = true;
			for(var i = 0; i<inval_Arr.length; i++){
				console.log("유효성 통과")
				if(inval_Arr[i] == false){
					console.log("유효성 통과2")
					validAll = false;
					}
				}
			if(validAll){
				
				
// 				var mem_info = {
// 					mem_id : $("#mem_id").val(),
// 					mem_name: $("#mem_name").val(),
// 					mem_nickname: $("#mem_nickname").val(),
// 					mem_email : $("#mem_email").val(),
// 					mem_content: $("#mem_content").val()
// 						}
				var mem_info = $("#form1").serialize();
				console.log(mem_info);
				$.ajax({
					url: "/member/updateMem.do",
					type:"POST",
					data:mem_info,
					success:function(result){
						if(result == 1){
							alert("회원수정이 완료 되었습니다")
							console.log("updateMem : " + result );
							alert(result)
							location.href="/member/myPage.do";
							}
						}
					})
				}else{
					console.log("입력한 정보를 다시 확인해주세요")
					}
		})
	
	})
</script>
</head>
<body>
	<div class="container-fluid text-center">
		<br>
		<div class="row content">
			<!-- 좌측 메뉴 -->
			<div class="col-sm-2 sidenav">
				<!-- 사이드바 메뉴목록 -->
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="/member/myPage.do">마이페이지</a>
						</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="/member/myPage_Contents.do" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						<li class="list-group-item"><a href="/member/myPage_Favorite.do">찜목록</a></li>
						<li class="list-group-item"><a href="/member/myPage_Message.do">쪽지함</a></li>
						<li class="list-group-item"><a href="/member/myPage_update.do">회원 수정</a></li>
						<li class="list-group-item"><a href="/member/pwd_update.do">비밀번호 변경</a></li>
					</ul>
				</div>
			</div>

			<!-- 내용 -->
			
			<div class="col-sm-10 text-left">
				<form id="form1" method="post" action="myPage.jsp">
				<input type="hidden" name="mem_no" id="mem_no" value="${update.mem_no }" readonly="readonly">
				<input type="text" name = "mem_img" value="">
				<h2>회원수정</h2>
					<table>
					<!-- <input> 프로필 변경란 -->
					
					
					
					<tr>
						<td>이름</td>
						<td><input type="text" name = "mem_name" value="${update.mem_name}" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td>아이디</td>
						<td><input type="text" name="mem_id" value="${update.mem_id }" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td><input type="text" name="mem_email" value="${update.mem_email}" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td>닉네임</td>
						<td><input type= "text" class = "form-control" name="mem_nickname" id="mem_nickname" value="${update.mem_nickname }" ></td>
						<td><button id="nickName_overlap">중복확인</button>
							<div class="check_font" id="nickname_check"></div></td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td><textarea name="mem_content" id="mem_content" placeholder="내용을 입력해주세요." cols="30" rows="20" >${update.mem_content}</textarea></td>
					</tr>
					<!-- <input type= "text" name="password" value="${login.mem_password }"> -->
					</table>
					<input type="button" value="수정 하기" id="updateBtn">
					<input type="button" value="회원 탈퇴" id="delBtn">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
</layoutTag:layout>