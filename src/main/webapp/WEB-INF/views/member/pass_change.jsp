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
<script type="text/javascript">
	$(function() {
		$("#form1").submit(function(event) {
			event.preventDefault();
			var mem_info = {
				mem_pwd : $("#mem_pwd").val()
			}
			console.log(mem_info);
			console.log("${member.mem_email}");
			$.ajax({
				url : "/member/pass_change.do " + "${member.mem_email}",
				type : "POST",
				data : mem_info,
				success : function(re) {

					console.log("find re : " + re);

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
		<div sytle="text-align:center;">

			<table border="1" width="300" height="300" align="center">
				<tr>
					<td>
						<div style="text-align: center"></div>
						<div style="text-align: center">
							<form id="form1" action="/member/pass_change.do" method="post">
								<div>
									변경할 비밀번호 입력 : <input type="text" name="mem_pwd" id="mem_pwd"
										placeholder="비밀번호를 입력하시오">
								</div>
								<br> <br> <br>
								<button type="submit" name="submit">비밀번호 변경</button>
							</form>
						</div>
					</td>
				</tr>



			</table>
		</div>
	</div>

</body>
	</html>
</layoutTag:layout>