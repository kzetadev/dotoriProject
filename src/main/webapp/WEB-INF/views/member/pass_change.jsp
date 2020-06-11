<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>
	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#form1{
		padding-right:400px;
		padding-left:400px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$("#form1").submit(function(event) {
			event.preventDefault();
			var mem_info = {
				mem_email : "${member.mem_email}",
				mem_pwd : $("#mem_pwd").val()
			}
			console.log(mem_info);
			console.log("${member.mem_email}");
			$.ajax({
//				url : "/member/pass_change.do " + "${member.mem_email}",
				url : "/member/pass_change.do ",
				type : "POST",
				data : mem_info,
				success : function(re) {

					console.log("find re : " + re);
					if(re ==1 ){
						alert("비밀번호가 변경 되었습니다")
						location.href ="/member/login.do"
// 						$("#form1").attr("action","/member/login.do")
					}else{
						alert("변경 실패")
					}
				}
			})
		})
	})
</script>
</head>
<body>

	<div style="text-align: center">
		<span style="color: green; font-weight: bold;">변경할 비밀번호를 입력해주세요</span><br>
		<br> <br> <br>
		<div style="text-align:center;">

			<div style="text-align: center"></div>
			<div style="text-align: center">
				<form id="form1">
					<table class="table">
						<tr>
							<td><label for="mem_pwd">변경할 비밀번호 : </label></td>
							<td><input type="password" class="form-control" name="mem_pwd" id="mem_pwd" placeholder="비밀번호를 입력하시오"></td>
						</tr>
					</table>
					<button type="submit" class="btn btn-info" name="submit">비밀번호 변경</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
	</html>
</layoutTag:layout>