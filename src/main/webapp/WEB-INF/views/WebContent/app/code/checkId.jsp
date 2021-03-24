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
				<h2>ReturnCycle ID CHECK</h2>
</header>
<div class="container">

	<!-- login -->
	<section id="CheckId">
		<form name="CheckIdForm" action="${pageContext.request.contextPath}/member/MemberCheck.me"
			method="post">
			<div class="row gtr-uniform">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<label for="checkId">찾으실 ID를 입력해주세요</label> <input type="text" maxlength="12"
						name="u_id" id="u_id" value="" placeholder="아이디 입력" required />
				</div>
			</div>
			<br>
			<!-- button -->
			<ul class="actions">
				<li style="margin: 0 auto;">
				<input type="submit" id="submitId" name="submitId" value="ID 확인" class="primary" onClick="location.href='javascript:formSubmit()'">
			</ul>
		</form>
		
		
		
				</section>
			</div>
		</section>
		<body onkeydown="javascript:EnterLogin();"></body>
		<script>
			function EnterLogin() {
				var keyCode = window.event.keyCode;
				if (keyCode == 13) {
					loginForm.submit();
				}
			}
			
			$("#submitId").on('click',function(){
				//성 없으면
					if($("#u_id").val() == ""){
						alert("id를 입력 하세요.");
						$("#u_id").focus();
						return false;
					}
			});
		</script>
		<!-- footer -->
