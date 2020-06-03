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
<!-- 회원정보에 없는 이메일을 입력할 시에 출력되는 경고창 -->
$(function(){
	var responseMsg = "<c:out value="${message}"/>";
	if(responseMsg != ""){
		alert(responseMsg)
	}

	$("#form").submit(function(event){
		event.preventDefault();
		var mem_info = {
			mem_id: $("#mem_id").val(),
			mem_email:$("#mem_email").val() + $("#mail2").val()
		}
		console.log(mem_info);
		console.log(mem_info.mem_email);
		$.ajax({
			url:"/member/find_id.do",
			type:"POST",
			data:mem_info,
//  			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
//  				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
//  			},
			success:function(re){
				console.log("find re : " + re);
// 				alert(re);
				if(re != ''){
					location.href = "/member/find_id_result.do?mem_id="+re;
					}else{
						alert("없는 회원입니다");
						}
			}
		})
	})
})

</script>

	<div style="text-align: center;"><br><br><br>
		<span style="color:green; font-weight:bold;" id="find_id">아이디 찾기</span><br><br>
	</div>
	
	
	<!-- 아이디를 찾는 페이지(이메일을 입력하면 db에 연동 후, db에 저장된 아이디가 출력됨 -->
	<form id="form" action="/member/find_id.do" method="post">
	<div style="text-align: center;">
		이메일 : <input type="text" class="form-control" name="mem_email" id="mem_email" placeholder="E-mail" maxlength="50">@
						<select id="mail2" name="mail2">
                            <option value="@naver.com">naver.com</option>
                            <option value="@daum.net">daum.net</option>
                            <option value="@gmail.com">gmail.com</option>
                            <option value="@nate.com">nate.com</option>                        
                        </select>
             <button type="submit" name="submit" id="submit">확인</button>
	</div>
	</form>
</body>
</html>
</layoutTag:layout>