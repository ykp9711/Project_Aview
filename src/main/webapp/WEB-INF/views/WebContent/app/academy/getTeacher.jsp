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
<title>Aview_Teacher</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
	
	<!-- Header -->
	   <%@ include file="../../header.jsp"%>
	   

	

	<!-- Main -->
	<section id="three" class="wrapper style1">
		<header class="major">
			<h2>강사 소개</h2>
		</header>
		<div id="main" class="container">
									<div class="row">
										<!-- Post -->

										<div style="width: 70%;">
										
		
		   <c:if test="${board.academyId eq session_id}">
		   
			   <div style="margin-left:0%;">
			   <button class="button large modify">게시글 수정</button>
			   &nbsp;&nbsp;
			   <button class="button large remove">게시글 삭제</button><br><br>
			   </div><br>
		   </c:if>
		   
		<div class="container">
			<div class="row">
				<div class="col-4 col-6-medium col-12-small" style="float:left">
					<article class="box post">
						<a class="image fit">
						<img src="/resources/FileImage/${list.teacherPhoto1}"></a>
						<h3>${board.tname1} 강사</h3>
						<div>
						<label>소개 : ${board.teacherIntro1}</label>
						</div>
						<p></p>
					</article>
				</div>
							<div class="col-4 col-6-medium col-12-small" style="float:left">
					<article class="box post">
						<a class="image fit">
						<img src="/resources/FileImage/${list.academyPhoto}"></a>
						<h3>${board.acaTeacherName} 강사</h3>
						<div>
						<label>소개 : ${board.acaTeacherIntro}</label>
						</div>
						<p></p>
					</article>
				</div>
								<div class="col-4 col-6-medium col-12-small" style="float:left">
					<article class="box post">
						<a class="image fit">
						<img src="/resources/FileImage/${list.academyPhoto}"></a>
						<h3>${board.acaTeacherName} 강사</h3>
						<div>
						<label>소개 : ${board.acaTeacherIntro}</label>
						</div>
						<p></p>
					</article>
				</div>
								<div class="col-4 col-6-medium col-12-small" style="float:left">
					<article class="box post">
						<a class="image fit">
						<img src="/resources/FileImage/${list.academyPhoto}"></a>
						<h3>${board.acaTeacherName} 강사</h3>
						<div>
						<label>소개 : ${board.acaTeacherIntro}</label>
						</div>
						<p></p>
					</article>
				</div>
								<div class="col-4 col-6-medium col-12-small" style="float:left">
					<article class="box post">
						<a class="image fit">
						<img src="/resources/FileImage/${list.academyPhoto}"></a>
						<h3>${board.acaTeacherName} 강사</h3>
						<div>
						<label>소개 : ${board.acaTeacherIntro}</label>
						</div>
						<p></p>
					</article>
				</div>
								<div class="col-4 col-6-medium col-12-small" style="float:left">
					<article class="box post">
						<a class="image fit">
						<img src="/resources/FileImage/${list.academyPhoto}"></a>
						<h3>${board.acaTeacherName} 강사</h3>
						<div>
						<label>소개 : ${board.acaTeacherIntro}</label>
						</div>
						<p></p>
					</article>
				</div>
			</div>


		</div>
		</div>
		</div>
		</div>

	</section>
	<br><br>
		             <div style="margin-left:50%;">
	            <ul class="actions">
	               <li><a href="/board/getBoard" class="button large">학원 소개</a></li>
	               <li><a href="test.jsp" class="button large">시설 소개</a></li>
	               <li><a href="facility.jsp" class="button large">학원 리뷰</a></li>
	             </ul>
            </div>
	<!-- Footer -->
	<footer id="footer">
				<div style="text-align: center;">
				<a href="#"><strong>TOP</strong></a>
			</div>
<%@ include file = "../../footer.jsp" %>

	</footer>

	<!-- Scripts -->
	<script>var contextPath = "${pageContext.request.contextPath}";</script>

</body>
</html>