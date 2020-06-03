<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var responseMsg = "<c:out value="${message}"/>";
	if(responseMsg != ""){
		alert(responseMsg)
	}
	$("#form").submit(function(event){
		event.preventDefault();
//	$("#submit")clcik(function(){
		var mem_info = {
			mem_id: $("#mem_id").val(),
			mem_email:$("#mem_email").val() + $("#mail2").val()
		}
		console.log(mem_info);
		console.log(mem_info.mem_email);
		$.ajax({
			url:"/member/find_pass.do",
			type:"POST",
			data:mem_info,
// 			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
// 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
// 			},
			
			success:function(re){
				console.log("find re : " + re);
				if(re == 1){
					alert("입력하신 이메일 주소에서 인증번호를 확인해주세요")
					location.href = "/member/pass_email.do?mem_id="+$('#mem_id').val();
				}else{
					alert("다시 입력해주세요")
				}
			}
		})
	})
})

</script>
<body>
	
		<div style="text-align: center;"><br><br><br>
			<span style="color: green; font-weight: bold;">비밀번호 찾기</span><br><br>
		</div>
		
		<form id="form" action="/member/find_pass.do" method="post">
			아이디 : <input type="text" name="mem_id" id="mem_id" placeholder="아이디를 입력하시오"><br><br>
			이메일 : <input type="text" class="form-control" name="mem_email" id="mem_email" placeholder="E-mail" maxlength="50">@
						<select id="mail2" name="mail2">
                            <option value="@naver.com">naver.com</option>
                            <option value="@daum.net">daum.net</option>
                            <option value="@gmail.com">gmail.com</option>
                            <option value="@nate.com">nate.com</option>                        
                        </select>
             <button type="submit" name="submit" id="submit">확인</button>
		
	 입력하신 이메일로 인증번호가 발송 됩니다. 받으신 인증번호를 입력해주세요
	</form>
</body>
</html>
</layoutTag:layout>