<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!--
   Drift by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!-- Header -->
<%@ include file="../../header.jsp"%>
		<head>
		<title>Check ID-Aview</title>
		<meta charset="utf-8" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/assets/css/main.css" />
		</head>	
		<!-- Main -->
		<section id="main" class="wrapper style1">
			<header class="major">
				<h2>비밀번호 찾기</h2>
				<h4>전화번호 인증</h4>
</header>
<div class="container">

	<!-- login -->
	<section id="CodeCheck">
		<form name="CodeCheckForm" action="/member/codeReceive" method="post">
			<div class="row gtr-uniform">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<label for="phone">전화 번호</label> <input type="text" maxlength="12"
						name="aphone" id="aphone" value="" placeholder="-제외 하고 전화번호 입력" required /><br>
						<input type="submit" class="send primary" value="인증번호 받기"/>
					<%-- <a href onclick="window.open('${pageContext.request.contextPath}/code/CodeOk.cd','인증번호 받기','width=600,height=600,location=no,status=no,scrollbars=yes');" class="button">인증번호 받기</a> --%>
			</div></div>
		</form>
		<form name="CodeCheckForm2" action="/member/codeCheck" method="post">
		<div class="row gtr-uniform">
			<div class="col-6 col-12-small" style="margin: 0 auto;">
				<label for="AuthenticationCode">인증번호</label> 
				<input type="text" maxlength="12" name="tempcode" id="tempcode" value="" placeholder="인증번호 입력" required /><br>
				<input type="submit" name="check" id="check" value="확인" required>
			</div>
		</div><br>
			
		</form>
	</section>
</div>
		</section>
		 <script>
		 $('.send').on("click", function(e){
				e.preventDefault();
				checkBox.style.display="block";
				var phone = $('#phone').val(); // 입력한 핸드폰 번호
				var data = {phone : phone} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
				$.ajax({ type : "get",
					url : "/member/sms",
					data : data, 
					success : function(result){ 
						$("#realCode").val(result);
					
					}// success 종료
				}); // ajax 종료
				 });// function 종료
			</script>
			
			<script>
				$("#check").on("click", function(e){
					e.preventDefault();
					var phone = $("#phone").val();
					var code = $("#code").val(); // 입력한 코드
					var realCode =$("#realCode").val() // 전송된 코드
					console.log(phone)
					console.log(code)
					console.log(realCode)
					if(code.trim() == realCode.trim()){
						location.href="/member/pwInfo?phone="+phone;
						return false;
					}else
						alert("인증번호가 틀렸습니다")
						
				})
	  </script>
		
		<script>
		$("#requireCode").on('click',function(){
			//전화번호 없으면
				if($("#c_phone").val() == ""){
					alert("전화번호를 입력 하세요.");
					$("#c_phone").focus();
					return false;
				}
		});
			
		$("#submitCode").on('click',function(){
			//인증번호 없으면
				if($("#tempcode").val() == ""){
					alert("인증번호를 입력 하세요.");
					$("#tempcode").focus();
					return false;
				}
		});
		</script>
		<%@ include file="../../footer.jsp"%>
		<!-- footer -->
