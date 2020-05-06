<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
$('#loginBtn').click(function() {
	var id = $('#inputId').val();
	var pw = $('#inputPassword').val();
		$.ajax({
		type : 'post', // ��й�ȣ�� ���� url�� ǥ�õǸ� �� �Ǳ� ������ ������ ���� POST ������� ���� ������
		url : '${pageContext.request.contextPath}/login.do',
		data : {
			mem_id : id,
			mem_pwd : pwd,
			},
			success : function(data) {
				if (data == 0) { //�α��� ���н�
					console.log(data);
					$('#spanLoginCheck').text('�α��� ������ ��Ȯ�� �Է����ּ���.');					
				} else if (data == -3) { // ���̵� ������̶��?
					console.log(data);
					location.href = '${pageContext.request.contextPath}/user/redundant?mem_id=' + id + '&user_Pw=' + pw + '&remember_userId=' + remember_us;						
				} else { //�α��� ������
					console.log(data);
					location.href = '${pageContext.request.contextPath}/user/storeChoice';
				}
			}
		});
	});
})
</script>
</head>
<body>
<!-- Cookie�� ������� ���� �� checked �Ӽ��� �� -->
	<c:if test="${not empty cookie.user_check}">
		<c:set value="checked" var="checked"/>
	</c:if>


<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="form-group">
					<label class="font-weight-bold text-white" for="inputId">���̵�</label>
					<div>
						<input type="text" class="form-control" id="inputId" name="mem_id" value="${cookie.user_check.value}" placeholder="���̵�">
					</div>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white" for="inputPassword">��й�ȣ</label>
					<div>
						<input type="password" class="form-control" id="inputPassword" name="mem_pwd" placeholder="��й�ȣ">
					</div>
				</div>
				<div class="form-group">
					<span class="font-weight-bold text-white bg-dark" id="spanLoginCheck"></span>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white"> 
						<input type="checkbox" id="remember_us" name="remember_userId" ${checked}> ���̵� ����ϱ�
					</label>
					<div class="interval_height a_none">
						<a href="${pageContext.request.contextPath}/user/userSearch">&nbsp; ����ã��</a>
					</div>
					<div>
						<button id="loginBtn" type="button"	class="btn btn-primary btn-block">�α���</button>
					</div>
				</div>
				<div class="form-group">
					<a class="btn btn-deep-orange btn-block" href="${pageContext.request.contextPath}/joinForm.do">ȸ������</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>