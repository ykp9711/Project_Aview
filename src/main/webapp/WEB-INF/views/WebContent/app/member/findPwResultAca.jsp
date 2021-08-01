<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Header -->
<%@ include file = "../../header.jsp" %>

	<!-- Main -->
			<head>
			<meta charset="utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
			</head>
				
	<!--pw찾기 결과페이지 main-->
		<section id="main" class="wrapper style1">
 				<div class="container" >
 					<div class="row gtr-uniform">
 						<div class="col-6 col-12-small" style="margin:0 auto;">
 					<section id = "findId_result">
					<h3>
 					<label>
 					<span style="font-size:140%">${info.sid}</span>
 					<span style="font-size:100%">님이 찾으신 PW는 : </span>
 					<span style="font-size:140%">${info.spwd}</span>
 					<span style="font-size:100%">입니다</span>&nbsp;&nbsp;
 					</label>
 					</h3>
 					</section>
				</div>
				</div>
				</div>
				
				
			</section>

			
	<!-- Footer -->
<%@ include file = "../../footer.jsp" %>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
