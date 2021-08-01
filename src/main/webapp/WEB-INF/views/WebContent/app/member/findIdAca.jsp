<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE HTML>
<!--
	Drift by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>Find ID ACADEMYUSER</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
	<body class="is-preload">

			<!-- Header -->

		<!-- Main -->
			<section id="main" class="wrapper style1">
				<header class="major">
					<h2>학원 아이디 찾기</h2>
				</header>
		<!-- 아이디 찾기 -->
				<div class="container">
					<section id="find_Id">
						<form id="findId" name="findId" method="post" action="/member/acafindId">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-small" style="margin:0 auto;">
								<label>학원 이름</label>
									<input type="text" maxlength="12" name="aname" id="aname" placeholder="성 입력" required>
								<br>
								<label>이메일 입력</label>
									<input type="text" name="aemail" id="aemail" placeholder="@까지 포함된 email을 입력" required>
								<br>
								<label>휴대전화</label>
											<input type="text" name="aphone" id="aphone" value="" placeholder="-를 제외하고 숫자만 입력" required>
										
			
								
								<br><Br>
								
								<!-- Button -->
									<ul class="actions">
										<li style="margin: 0 auto;">
											<input type="submit" id="submitId" name="submitId" value="아이디 찾기" class="primary" onClick="location.href='javascript:formSubmit()'">
										</li>
										<li style="margin: 0 auto;">
											<a href onclick="window.open('/member/acaCheckId','ID존재 확인','width=600,height=600,location=no,status=no,scrollbars=yes');" class="button">비밀번호 찾기</a>
										</li>
									</ul>
									</div>
							</div>
						</form>
					</section>
					</div>

		<!-- Footer -->
<%@ include file="../../footer.jsp"%>

		<!-- Scripts -->
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>

<script>
//id 서브밋 클릭
$(function(){
		
		$("#submit_Id").on('click',function(){
		//성 없으면
			if($("#u_last_name").val() == ""){
				alert("성을 입력해 주세요.");
				$("#u_last_name").focus();
				return false;
			}
		//이름 없으면	
			if($("#u_first_name").val() == ""){
				alert("이름을 입력해 주세요.");
				$("#u_first_name").focus();
				return false;
			}
		//핸드폰 번호 없으면
			if($("#fI_phone").val() == ""){
				alert("핸드폰 번호를 입력해 주세요.");
				$("#fI_phone").focus();
				return false;
			}
		
		//핸드폰 번호 없으면
		if($("#fI_email").val() == ""){
			alert("이메일을 입력해 주세요.");
			$("#fI_email").focus();
			return false;
		}
			
		//인증 번호 없으면
			if($("#fI_code").val() == ""){
				alert("인증 번호를 입력해주세요.");
				$("#fI_code").focus();
				return false;
			}			
		//다 만족하면 true, 결과 페이지 이동
			return true;
		});
	});</script>

	
	</body>
</html>