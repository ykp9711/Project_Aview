<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--
   Future Imperfect by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!DOCTYPE HTML>
<html>
<style>


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
<article style="width: 70%; margin: 0 auto;">
  <c:forEach var="teacher" items="${teacher}">
<table style="width: 20%; margin-left: 10%; margin-top:10%; float: left;">
<thead>
  <tr>
    <th></th>
    <th style="height:200px;"><img src="사진"></th>
    <th></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td colspan="2" style="text-align: center;">이름</td>
    <td  style="text-align: center;">나이</td>
  </tr>
  <tr>
    <td colspan="3">강사소개</td>
  </tr>
</tbody>
</table>
</c:forEach>

</article>
	

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
