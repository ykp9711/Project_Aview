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
		<title>Result ID-AVIEW</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
	<body class="is-preload">

			<!-- Header -->

		<!-- Main -->
			<section id="main" class="wrapper style1">
				<header class="major">
					<h2>찾으신 아이디</h2>
				</header>
		<!-- 아이디 찾기 -->
				<div class="container">
					<section id="find_Id">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-small" style="margin:0 auto;">
									<p> ID : <strong> ${id.sid}</strong ></p>
									<a href onclick="window.open('/member/stuFindPw','비밀번호 찾기','width=600,height=600,location=no,status=no,scrollbars=yes');" class="button">비밀번호 찾기</a>
							</div>
						</div>

					</section>
					</div>
			</section>

		<!-- Footer -->
<%@ include file="../../footer.jsp"%>

		<!-- Scripts -->
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>


	</body>
</html>