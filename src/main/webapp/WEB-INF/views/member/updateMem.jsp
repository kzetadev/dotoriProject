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
		//https://developer.mozilla.org/ko/docs/Web/API/File/File
		var sel_file = new File(['1'], 'default');						//선택된 파일 객체를 담는 전역 변수. 이미지 변경 없이 회원정보만 수정할 경우 기본값으로 사용하기 위해 의미없는 데이터와 파일명으로 생성 
		var file = $("<input type='file' name='uploadFile' id='uploadFile' accept='image/*' />").css('visibility', 'hidden');	//파일 선택용 input 태그. 화면에 표시하지 않고 이미지를 클릭했을 때 동작하도록 변수로 선언.
// 		$("#form1").append(file);
		//https://greatps1215.tistory.com/4
		$(file).change(function(el){		//파일이 선택되었을 때 동작하는 이벤트 재정의. el : input file tag 요소
			console.log(el);
			var files = el.target.files;		//input file tag에 선택된 파일들을 가져옴
			console.log(files);
			var filesArr = Array.prototype.slice.call(files);	//files에 담긴 파일들을 배열로 만듦
			console.log(filesArr);
			filesArr.forEach(function(f){					//filesArr에서 파일을 하나씩 꺼냄
				if(!f.type.match("image.*")){				//파일 형태가 이미지 형태가 아니면 
					alert("이미지 파일을 선택해 주세요.");			//경고메시지 출력
					return;									//더 이상 진행하지 않도록 리턴시킴
				}
				sel_file =f;								//f는 이미지 파일로 간주하여 전역 변수인 sel_file에 담음
				var reader = new FileReader();				//파일을 읽는 객체 선언
				reader.readAsDataURL(f);					//파일 리더 객체에 이미지 파일(f)를 매개변수로 넘겨 파일을 읽음
				reader.onload = function(e){				//파일이 로드될 때 동작하는 이벤트. e : 로드된 파일
					console.log(e);							
					$("#profile_img").attr("src", e.target.result);	//이미지 태그에 해당 이미지 파일을 적용. 
																	//e.target.result : 파일의 바이너리 데이터. data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQ.... 형태의 바이너리 데이터
				}
				console.log(sel_file);
			});
			
		});
		var nickJ = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,12}$/;
		$("#profile_img").click(function(){
			$(file).click();
			console.log(file);
		});
		function fileSelected(obj){
			console.log(obj);
		};
		
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
				//https://jechue.tistory.com/56
				var form = $("#form1")[0];									//FormData를 생성할 때 form을 매개변수로 넘기려면 0번째 요소로 넘겨야 함. 
// 				var mem_info = $("#form1").serialize();
				var mem_info = new FormData(form);							//multipart/form-data로 넘기려면 form을 매개변수로 FormData를 생성해서 넘겨주어야 하는것 같음.  
				mem_info.append('uploadFile', sel_file);					//Member_InfoVo의 MultipartFile형 uploadFile 필드에 값을 매핑하기 위해 추가
				if(sel_file.name == 'default'){									//이미지를 변경하지 않은 경우
					mem_info.append('mem_img', $("#profile_img").attr('src'));	//기존 이미지 경로를 넘김
				}else{															//이미지를 변경한 경우
					mem_info.append('mem_img', "/member_img/" + sel_file.name);	//Member_InfoVo의 String형 mem_img 필드에 값을 매핑하기 위해 추가
				}
// 				var mem_info = $("#form1").serialize();
// 				mem_info['mem_img'] = sel_file;
// 				console.log(mem_info);
				$.ajax({
					url: "/member/updateMem.do",
					type:"POST",
					dataType:'json',
					processData:false,			//form태그의 enctype이 multipart/form-data인경우 설정해주어야 함.
					contentType:false,			//form태그의 enctype이 multipart/form-data인경우 설정해주어야 함.
					data:mem_info,
// 					data:{
// 						form:form
// 						,mem_info:mem_info
// 					},
					success:function(result){
						if(result == 1){
							alert("회원수정이 완료 되었습니다")
							console.log("updateMem : " + result );
// 							alert(result)
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
						<li class="list-group-item"><a href="/member/myPage_updateMem.do">회원 수정</a></li>
						<li class="list-group-item"><a href="/member/pwd_update.do">비밀번호 변경</a></li>
					</ul>
				</div>
			</div>

			<!-- 내용 -->
			
			<div class="col-sm-10 text-left">
				<form id="form1" method="post" action="myPage.jsp" enctype="multipart/form-data">
				<input type="hidden" name="mem_no" id="mem_no" value="${update.mem_no }" readonly="readonly">
				
				<h2>회원수정</h2>
					<div>
<!-- 						<input type="file" name="uploadFile"> -->
						<img id="profile_img" class="img-rounded" name="profile_img" src="${update.mem_img }" width="300" height="300">
					</div>

					<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="mem_name" value="${update.mem_name}" readonly="readonly"></td>
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