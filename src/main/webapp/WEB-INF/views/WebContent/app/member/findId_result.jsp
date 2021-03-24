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
				<c:set var="find_id" value="${requestScope.find_id}"/>
				<c:set var="u_name" value="${requestScope.u_name}"/>
	<!--id찾기 결과페이지 main-->
		<section id="main" class="wrapper style1">
 				<div class="container" >
 					<div class="row gtr-uniform">
 						<div class="col-6 col-12-small" style="margin:0 auto;">
 					<section id = "findId_result">
					<h3>
 					<label>
 					<span style="font-size:110%">${u_name}</span>
 					<span style="font-size:100%">님이 찾으신 ID는 : </span>
 					<span style="font-size:140%">${find_id}</span>
 					<span style="font-size:100%">입니다.</span>&nbsp;&nbsp;
 					<%-- <a href="${pageContext.request.contextPath}/app/code/checkUserPw.jsp" class="button">비밀번호 찾기</a></li> --%>
 					<!-- 팝업창 -->
 					<a href onclick="window.open('${pageContext.request.contextPath}/app/code/checkId.jsp','ID존재 확인','width=430,height=500,location=no,status=no,scrollbars=yes');">
 					비밀번호 찾기</a>
 					</label>
 					</h3>
 					</section>
				</div>
				</div>
				</div>
				
				
			</section>

			
	<!-- Footer -->
<%@ include file = "/footer.jsp" %>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
