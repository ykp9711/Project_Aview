<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
   Drift by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!-- Header -->

		<head>
		<title>ReturnCycle</title>
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
		<form name="CodeCheckForm" action="${pageContext.request.contextPath}/code/CodeCheckOK.cd" method="post">
			<div class="row gtr-uniform">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<label for="checkId">전화 번호</label> <input type="text" maxlength="12"
						name="c_phone" id="c_phone" value="" placeholder="전화번호 입력" required /><br>
						<input type="submit" id="requireCode" name="requireCode" value="인증번호 받기" class="primary" onClick="location.href='javascript:formSubmit()'">
					<%-- <a href onclick="window.open('${pageContext.request.contextPath}/code/CodeOk.cd','인증번호 받기','width=600,height=600,location=no,status=no,scrollbars=yes');" class="button">인증번호 받기</a> --%>
			</div></div></form>
			<form name="CodeCheckForm" action="${pageContext.request.contextPath}/code/CodeContentOK.cd" method="post">
			<div class="row gtr-uniform">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<label for="AuthenticationCode">인증번호</label> <input
						type="text" maxlength="12" name="tempcode" id="tempcode" value="" placeholder="인증번호 입력" required /><br>
					<input type="submit" id="submitCode" name="submitCode" value="다음 단계로" class="primary" onClick="location.href='javascript:formSubmit()'">
				</div>
			</div><br>
				
		</form>
	</section>
</div>
		</section>
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
		<!-- footer -->
