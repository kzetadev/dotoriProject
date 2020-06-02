<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="300" height="300" align="center">
<div style="text-align:center">
<span sytle="color: green; font-weight bold;">인증번호를 입력하시오</span><br><br><br><br>
	<div style="text-align:center">
		<tr>
			<td>
				<div>
					<form action="/member/pass_injeung.do${dice },${mem_email}" method="post">
						<div>
							<br>
							<div>
								인증번호 입력 : <input type="number" name="pass_injeung" placeholder="인증번호 입력">
							</div><br><br>
							<button type="submit" name="submit">인증번호 전송</button>
						</div>
					</form>
				</div>
			</td>
		</tr>
	</div>
</div>
</table>
</body>
</html>
</layoutTag:layout>