<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 목록</title>
	<style type="text/css">
		h2{
			text-align:center;
		}
		.pagination{
  			display:block;
			text-align: center;
  		}
  		.pagination > li > a{
  			float: none;
  			margin-left: -5px;
  		}
  		form {
        	margin: 0 auto; 
       		width:250px;
    	}    

	</style>
	<script type="text/javascript">
		$(function(){
			$(".del").click(function(){
				// console.log($(this).attr("mem_no"));
				var mem_no = $(this).attr("mem_no");
				var a = confirm("정말로 탈퇴처리를 하시겠습니까?")
				if(a == true){
					$.ajax({url:"/admin/adminDeleteMember.do", type:"POST", data:{mem_no:mem_no}, success:function(result){
						if(result == 1){
							location.href = '/admin/adminListMember.do';
						}
					}});
				}
			})
		})
	</script>
</head>
<body>
	<h2><a>회원 목록</a></h2>
	
	<!-- 검색창 구현 -->
	<form id="form" action="/admin/adminListMember.do" method="post">
		<div class="input-group">
			<div class="form-group">
				<label for="sel"></label>
				<select class="form-control" name="searchColumn" id="sel">
					<option value="mem_no">회원번호</option>
					<option value="mem_id">아이디</option>
					<option value="mem_email">이메일</option>
					<option value="mem_name">이름</option>
					<option value="mem_regidate">가입일자</option>
					<option value="mem_nickname">닉네임</option>
				</select>
			</div>
			<input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요.">
			<div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>
	</form>
	
	<hr>
	<table border="1" width="80%" class="table table-hover">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>이름</th>
				<th>가입일자</th>
				<th>닉네임</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="a" items="${list }">
				<tr>
					<td>${a.mem_no }</td>
					<td>${a.mem_id }</td>
					<td>${a.mem_email }</td>
					<td>${a.mem_name }</td>
					<td>${a.mem_regidate }</td>
					<td>${a.mem_nickname }</td>
					<td>
						<button class="del" mem_no="${a.mem_no }">강퇴</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 처리 -->
	<ul class="pagination pagination-lg">
		<c:if test="${startPage > 1}">
			<li>
				<a href="/admin/adminListMember.do?pageNUM=${startPage-1 }" aria-label="이전">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<li><a href="/admin/adminListMember.do?pageNUM=${i }">${i }</a></li>
		</c:forEach>
		
		<c:if test="${endPage < totalPage }">
			<li>
				<a href="/admin/adminListMember.do?pageNUM=${endPage+1 }" aria-label="다음">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	</ul>	
</body>
</html>

</layoutTag:layout>