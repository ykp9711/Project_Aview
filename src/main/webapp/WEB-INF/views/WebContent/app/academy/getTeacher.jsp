<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--
   Future Imperfect by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!DOCTYPE HTML>
<html>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-0lax{text-align:left;vertical-align:top}

/* 폰트 적용 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

html {
    font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body, ul, li, h1, h2, h3, h4, h5 {
    margin:0;
    padding:0;
    list-style:none;
}

a {
    color:inherit;
    text-decoration:none;
}

</style>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
   href="/resources/assets/css/main.css" />
</head>
<body class="is-preload"  style="padding: 0; margin: 0;">

   <%@ include file="../../header.jsp"%>
   <!-- Wrapper -->
   <br><br><br>
	<section id="three" class="wrapper style1">
		<header class="major">
			<h2>강사 소개</h2>
		</header>
		<div id="main" class="container">
									<div class="row">
										<!-- Post -->

										<div style="width: 70%;">
<div class="container">

				<div class="col-4 col-6-medium col-12-small">
					<article class="box post" style="width : 100%;">
<article style="width: 70%; height:1200px; margin: 0 auto;">

<c:if test="${fn:length(teacher) <1}">
등록된 강사가 없습니다.
</c:if>
  <c:forEach var="teacher" items="${teacher}">
<div style="float: left; margin: 2px;">
<table class="tg">
<thead>
  <tr>
    <th class="tg-0lax" colspan="2"><img style="width:200px; height:200px;" src="/resources/FileImage/${teacher.photo}"/></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td style="text-align: center; width: 40%;" class="tg-0lax">이 름</td>
    <td style="text-align: center;" class="tg-0lax">${teacher.name}</td>
  </tr>
  <tr>
    <td style="height: 200px;" class="tg-0lax" colspan="2">${teacher.intro}</td>
  </tr>
</tbody>
</table>
</div>
&nbsp;
</c:forEach>

</article>					

				
				</article>
				</div>
				</div>
				</div>
				</div>
				</div>
				</section>
	

   <!-- Scripts -->
   <script src="/resources/assets/js/jquery.min.js"></script>
   <script src="/resources/assets/js/jquery.scrollex.min.js"></script>
   <script src="/resources/assets/js/jquery.scrolly.min.js"></script>
   <script src="/resources/assets/js/browser.min.js"></script>
   <script src="/resources/assets/js/breakpoints.min.js"></script>
   <script src="/resources/assets/js/util.js"></script>
   <script src="/resources/assets/js/main.js"></script>


</body>
</html>