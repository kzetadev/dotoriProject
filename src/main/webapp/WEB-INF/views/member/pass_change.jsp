<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="300" height="300" align="center">
<div style="text-align:center">
<span style="color: green; font-weight: bold;">변경할 비밀번호를 입력해주세요</span><br><br><br><br>
	<div sytle="text-align:center;">
		<tr>
			<td>
			<div style="text-align:center">
				<form action="/member/pass_change.do${mem_email }" method="post">
			<div style="text-align:center">
					<br>
					<div>
						변경할 비밀번호 입력 : <input type="text" name="mem_pwd" placeholder="비밀번호를 입력하시오">
					</div>
					<br><br>
					<button type="submit" name="submit">비밀번호 변경</button>
					</div>
				</td>
			</tr>
				</div>
			</table>
		</form>
	</div>


</body>
</html>