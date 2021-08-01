<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!--
   Drift by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!-- Header -->
<%@ include file="../../header.jsp"%>
		<head>
		<title>Check ID-Aview</title>
		<meta charset="utf-8" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/assets/css/main.css" />
		</head>	
		<!-- Main -->

				


<section id="main" class="wrapper style1">
<div class="container">

	<!-- login -->
	<section id="main" class="wrapper style1">
		<form name="CheckIdForm" action="/member/checkIdAca?" method="post">
			<div class="row gtr-uniform">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
				<h2>AVIEW ID CHECK</h2>
					<label for="checkId">찾으실 ID를 입력해주세요</label> <input type="text" maxlength="12"
						name="aid" id="aid" value="" placeholder="아이디 입력" required />
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
		<script>
			
			$("#submitId").on('click',function(){
				//성 없으면
					if($("#u_id").val() == ""){
						alert("id를 입력 하세요.");
						$("#u_id").focus();
						return false;
					}
			});
		</script>
<%@ include file="../../footer.jsp"%>
</html>
		<!-- footer -->
