<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
	Drift by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>내 정보 수정 완료!</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Header -->
	<%@ include file="/header.jsp" %>

	<!-- Main -->
	<section id="main" class="wrapper style1">
		<header class="major">
			<h3>
				<span id="u_name" style="font-size: 200%;"><%=session.getAttribute("session_id")%></span> 
				<span style="font-size: 150%">님 개인정보 수정 완료</span>
			</h3>
			<a href="${pageContext.request.contextPath}/member/MemberView.me?u_id=<%=session.getAttribute("session_id")%>" style="font-size: 150%;">마이 페이지로</a>
		</header>
<!-- 		<div class="container">
				Content
				<section id="content">
					<h3>사용자 ID</h3>
					<textarea id="pickUP_id" rows="3" style="resize: none;"></textarea><br>
					<h3>사용자 이름</h3>
					<textarea id="pickUP_name" rows="3" style="resize: none;"></textarea><br>
					<br>
					<h3>사용자 전화번호</h3>
					<textarea id="pickUP_PhoneNumber" rows="3" style="resize: none;"></textarea><br>
					<br>
					<h3>수거한 품목</h3>
					<textarea id="pickUP_kind" rows="3" style="resize: none;"></textarea><br>
					<br>
					<h3>수거한 용량</h3>
					<textarea id="pickUP_capacity" rows="3" style="resize: none;"></textarea><br>
					<br> <a href="index.html" style="font-size: 120%">홈으로</a>
				</section>

		</div> -->

	</section>


	<!-- Footer -->
	<%@ include file = "/footer.jsp" %>

	<!-- Scripts -->
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.slidertron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

	<script>
	</script>
</body>
</html>