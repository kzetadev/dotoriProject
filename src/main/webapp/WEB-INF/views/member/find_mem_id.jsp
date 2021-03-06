<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

<%-- *{
  margin:0; 
  padding:0;
<%--  font-size:15px; 
  line-height:1.3;
}--%>

th,td {
	text-align: center;
}
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
} 

<%-- Float the list items side by side --%>

.tab li {
	float: left;
}
<%-- Style the links inside the list items --%>
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
} 
<%-- Style the tab content --%>
.tabcontent {
	display: none;
<%--	background-color: rgb(0, 154, 200); --%>
<%--	padding: 6px 12px;--%>

}

ul.tab li.current {
	<%--background-color: rgb(0, 154, 200); --%>
	display:  inline-block;
	<%--width:20%; --%> 
	float:left;  
	text-align:center; 
	background :#f9f9f9;
}

.tabcontent.current {
	display: block;
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

	height: 100%;
}

<%-- On small screens, set height to 'auto' for sidenav and grid --%>
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
<%--		padding: 15px;  --%>
	}
	.row.content {
		height: auto;
	}
}



a {
	
	text-decoration: none;
}
</style>
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" -->
<!-- 	rel="stylesheet"> -->
<!-- <script type="text/javascript" -->
<!-- 	src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<!-- <script type="text/javascript" -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>  -->
<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />  -->
<script type="text/javascript">
<!-- 회원정보에 없는 이메일을 입력할 시에 출력되는 경고창 -->
$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	})
});
$(function(){
	var responseMsg = "<c:out value="${message}"/>";
	if(responseMsg != ""){
		alert(responseMsg)
	}
// 	$("#find_ID").trigger('click');
	$("#find_ID").click();
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
					alert('회원님의 아이디는 "'+ re + '" 입니다') //회원님의 아이디는 " " 입니다
					//location.href = "/member/find_id_result.do?mem_id="+re;
					}else{
						alert("없는 회원입니다");
						}
			}
		})
	})
})
$(function(){
	var responseMsg = "<c:out value="${message}"/>";
	if(responseMsg != ""){
		alert(responseMsg)
	}
	$("#form1").submit(function(event){  
		event.preventDefault();
	//	$(this).modal({
	  //      fadeDuration: 250
	//	});
//	$("#submit")clcik(function(){
		var mem_info = {
			mem_id: $("#mem_id1").val(),
			mem_email:$("#mem_email2").val() + $("#mail3").val()
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
					
				//	location.href = "/member/pass_email.do?mem_id="+$('#mem_id1').val();
// 					location.href = "/member/find_pass.do?mem_id="+$('#mem_id1').val();
					$("#injeung_form").attr("action","/member/pass_injeung.do "+ $("#mem_id1").val());		
					
		
					$("#popupModal").modal();
				}else{
					alert("다시 입력해주세요")
					
				}
			}
		})
	})
	$("#injeung_form").submit(function(e){
// 		e.preventDefault(); // preventDefault();기본 이벤트
		 
	})
})

</script>
</head>
<body>
	<!-- 아이디를 찾는 페이지(이메일을 입력하면 db에 연동 후, db에 저장된 아이디가 출력됨 -->
<div class="container-fluid text-center" style="display: table; width:600px; height:400px; /*border:1px solid #000*/; text-align:center;">
	<div class="col-sm-10 text-left" style="display: table-cell; vertical-align: middle; margin: 0 auto; padding-left: 15%; padding-right: -15%; padding-top: 35%;">
 	<div id="menu1" style="padding-bottom: 5%;">
		<table id="findMem" style="margin: 0 auto;" >
			<tr id="ulli">
				<th>
					<ul class="tab"> 
					<li data-tab="tab2" id="find_ID"><a href="#">아이디 찾기</a></li>
					<li data-tab="tab3" id="find_PWD"><a href="#">비밀번호 찾기</a></li>
					</ul>
				</th>
			</tr>	
		</table>		
	</div>

	<div id="tab2" class="tabcontent">
		<form id="form" action="/member/find_id.do" method="post">
<!-- 			<div class="container" style="padding:0px;"> -->
	 		<div id="emailDiv" style="font-size: 15px; color: green; padding: 5px; text-align: center;">이메일을 입력해주세요</div>
<!-- 				<div class="table-responsive"> -->
					<table id="findId"  >
						
						<tr id="idTr">
							<th id="emailIdTh" >
								<input type="text" class="form-control" name="mem_email" id="mem_email" placeholder="E-mail" maxlength="50" >
							</th>
							
							<th id="golIdTh">
								<div style="padding-left: 5px;padding-right: 5px;">@</div>
							</th>
						
							<th id="mail2Th">
								<select class="form-control" id="mail2" name="mail2" style="border: 0px; padding-right: 10px;">
									<option value="@naver.com">naver.com</option>
									<option value="@daum.net">daum.net</option>
									<option value="@gmail.com">gmail.com</option>
									<option value="@nate.com">nate.com</option>                        
								</select>
							</th>
							
							<th id="findIdBtn" style="padding: 8px;">
								<button type="submit" class="btn btn-info" name="submit" id="submit" style="float:left;">확인</button>
							</th>
							
				         </tr>
						
<!-- 				         <tr id="findIdBtn" style="float:left;">       -->
<!-- 							<th id="findIdPwdTd"> -->
<!-- 								<button type="submit" name="submit" id="submit" style="float:left;">확인</button> -->
<!-- 							</th> -->
<!-- 						</tr>                         -->
				<!-- 		<div style="float: left;">@</div> -->
					</table>
<!-- 				</div> -->
<!-- 			</div> -->
		</form>
	</div>
		
	
	
<div id="tab3" class="tabcontent">
	<form id="form1" action="/member/find_pass.do" method="post">
<!-- 		<div class="container" > -->
<!-- 			<div class="table-responsive" > -->
				<table id="findPwd" class="table">
					<tr id="pwdTr">
						<th id="pwdIdTh" style="padding-bottom: 10px;">
							<label for="mem_id1">아이디 </label>
						</th>
						<th id="pwdIdInputTh" style="padding-bottom: 10px;"> 
							<input type="text" class="form-control" name="mem_id" id="mem_id1" placeholder="아이디를 입력하시오" style="width:250px;">
						</th>
					</tr>
					
					<tr id="findPwdEmailTr">
						<th id="findPwdEmailTh">이메일</th>
						<th id="findPwdInputTh"> 
							<input type="text" class="form-control" name="mem_email" id="mem_email2" placeholder="E-mail" maxlength="50">
						</th>
						<th id="findPwdGol">
							<div style="padding-left: 5px;padding-right: 5px;">@</div>
						</th>
						<th id="findPwdSelectTh">
							<select id="mail3" name="mail3" style="border: 0px; padding-right: 10px;">
	                            <option value="@naver.com">naver.com</option>
	                            <option value="@daum.net">daum.net</option>
	                            <option value="@gmail.com">gmail.com</option>
	                            <option value="@nate.com">nate.com</option>                        
	                        </select>
             			</th>
		 			</tr>
          
			         <tr id="findPwdBtnTr">   
			             <td id="findPwdTd" style="padding-top: 10px;">
			             	<button class="btn btn-info" type="submit" name="submit2" id="submit2">확인</button>
			             </td>
					</tr>
				</table>
<!-- 			</div> -->
<!-- 		</div>		 -->
	</form>
	</div>
		<!-- ------------------------------------------------------------------------- -->
	<a href="#" class="aPopupModal" data-target="#popupModal" data-title="WOW POPUP"></a>
	<div class="modal" tabindex="-1" role="dialog" id="popupModal">
	  <div class="modal-dialog" role="document" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title"><b>인증번호를 입력하세요</b></h4>
<!-- 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 	          <span aria-hidden="true">&times;</span> -->
<!-- 	        </button> -->
	      </div>
			<div class="modal-body">
				<form id="injeung_form" action="/member/pass_injeung.do" method="post">
	     			<div>
						<br>
						<table class="table">
							<tr>
								<td><label for="pass_injeung">인증번호 입력 : </label></td>
								<td><input type="number" class="form-control" id="pass_injeung" name="pass_injeung" placeholder="인증번호 입력"></td>
							</tr>
						</table>
						<br>
						<br>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" name="submit3">비밀번호 변경</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
	      </div>
 
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
        
      
    </div>
  </div>
</div>
	
<!-- ---------------------------------------------------------------------------------------------------- -->
	</div>
	</div>
<!-- 	</div> -->

<%@ include file="/WEB-INF/tags/footer.jsp" %>
</body>
</html>
</layoutTag:layout>