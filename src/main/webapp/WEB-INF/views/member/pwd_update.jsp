<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<layoutTag:layout>
	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	<%-- Remove the navbar's default margin-bottom and rounded borders --%>
	.navbar {
		margin-bottom: 0;
		border-radius: 0;
	}
	
	<%-- Set height of the grid so .sidenav can be 100% (adjust as needed) --%>
/* 	.row.content { */
/* 		height: 450px */
/* 	} */
	
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
	h1{
		text-align:left;
	}
	#form1{
		padding-left:200px;
		padding-right:200px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$.ajaxPrefilter(function(options, originalOptions, jqXHR){
			var token = "${_csrf.token}";
			jqXHR.setRequestHeader('X-CSRF-Token', token);
		});
		//기존 비밀번호 일치 여부 확인
		const oldPassCheck = async () => {
			var result = -1;
			var mem_info = {
				mem_pwd:$("#old_mem_pwd").val()
			};
			$.ajax({
				url:"/member/oldPassCheck.do"
				, type:"post"
				, data:mem_info
				, async:false
				, success:function(re){
					console.log('re : ' + re);
					if(re == 1){
						result = re;
					}
				}
			});
			return result;
		}
		$("#form1").submit(async function(event) {
			event.preventDefault();
			if(await oldPassCheck() != 1){
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}
			var mem_info = {
				mem_pwd : $("#mem_pwd").val()
			}
			console.log(mem_info);
			console.log("${member.mem_email}");
			$.ajax({
//				url : "/member/pass_change.do " + "${member.mem_email}",
				url : "/member/pass_update.do ",
				type : "POST",
				data : mem_info,
				success : function(re) {

					console.log("find re : " + re);
					if(re ==1 ){
						alert("비밀번호가 변경 되었습니다")
						location.href ="/member/myPage.do"
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
	<div class="container-fluid text-center">
		<br>
		<div class="row content">
			<!-- 좌측 메뉴 -->
			<div class="col-sm-2 sidenav">
				<!-- 사이드바 메뉴목록 -->
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<c:if test="${other_mem_no eq null }">
								<a href="/member/myPage.do">마이페이지</a>
							</c:if>
							<c:if test="${other_mem_no ne null }">
								<a href="/member/myPage.do?mem_no=${other_mem_no }">마이페이지</a>
							</c:if>
						</h3>
					</div>
					<ul class="list-group">
						<c:if test="${other_mem_no eq null }">
							<li class="list-group-item"><a href="/member/myPage_Contents.do" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						</c:if>
						<c:if test="${other_mem_no ne null }">
							<li class="list-group-item"><a href="/member/myPage_Contents.do?mem_no=${other_mem_no }" id="updateAccount">내가 쓴 글 & 댓글</a></li>
						</c:if>
						<%--other_mem_no가 null이면  로그인한 회원의 마이페이지로 간주. null이면 다른 회원의 마이페이지--%>
						<c:if test="${other_mem_no eq null }">
						<li class="list-group-item"><a href="/member/myPage_Favorite.do">찜목록</a></li>
						<li class="list-group-item"><a href="/member/myPage_Message.do">쪽지함</a></li>
						<li class="list-group-item"><a href="/member/myPage_updateMem.do">회원 수정</a></li>
						<li class="list-group-item"><a href="/member/pwd_update.do">비밀번호 변경</a></li>
						</c:if>
					</ul>
				</div>
			</div>

			<h1>비밀번호 변경</h1>
			<hr>
			
			<div class="col-sm-10 text-left">
				<form id="form1" name="form1" class="navbar-form">
					<table class="table">
						<tr>
							<td><label for="old_mem_pwd">기존 비밀번호 : </label></td>
							<td><input type="password" name="old_mem_pwd" class="form-control" id="old_mem_pwd" placeholder="비밀번호를 입력하시오"></td>
						</tr>
						
						<tr>
							<td><label for="mem_pwd">변경할 비밀번호 : </label></td>	
							<td><input type="password" name="mem_pwd" class="form-control" id="mem_pwd" placeholder="비밀번호를 입력하시오"></td>
						</tr>
						<tr>
							<td><label for="submit"></label></td>
							<td><button type="submit" class="btn btn-info" name="submit">비밀번호 변경</button></td>
						</tr>
					</table>
				</form>
				
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
	</html>
</layoutTag:layout>