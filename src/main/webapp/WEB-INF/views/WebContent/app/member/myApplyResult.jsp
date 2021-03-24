<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Header -->
<%@ include file = "/header.jsp" %>

	<!-- Main -->
			<head>
			<meta charset="utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
			</head>
				<c:if test="${session_id eq null}">
				<script>
					alert("로그인 후 이용해주세요");
					location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
				</script>
				</c:if>
	<!--수거하기 결과페이지 main-->
		<section id="banner">
 				<div class="inner"> 
					<h3>
					<span id="u_name" style="font-size:200%; text-decoration-line: underline;">
					<%=session.getAttribute("session_id")%>
					</span>
 					<span style="font-size:150%">님의 신청수정이 완료되었습니다.</span></h3>
 					덕분에 올바른 재활용 트렌드를 만드는 목표에 한 발 더 다가선 것 같습니다.
 					<br>
 					ReturnCycle과 함께 재활용 트렌드를 만들어가 주셔서 감사합니다.
 					<br>
 					앞으로도 올바른 재활용 트랜드를 만들어 갈 수 있도록 노력하겠습니다.
 					<br>
 					<br>
 					<!-- <p>적립 예정 포인트는 <span id="point"><strong style="color:#fff;">300</strong></span>점 입니다.</p> -->
 					<a href="${pageContext.request.contextPath}/index.jsp" style="font-size:120%">홈으로</a>
				</div>
			</section>

			
	<!-- Footer -->
<%@ include file = "/footer.jsp" %>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
