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
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>3
	<body class="is-preload">

			<!-- Header -->
				<%@ include file = "/header.jsp" %>

		<!-- Main -->
			<section id="main" class="wrapper style1">
				<header class="major">
					<h2>비밀번호 찾기</h2>
				</header>
		<!-- 비밀번호 찾기 -->
				<div class="container">
						<section id="find_Pw">
							<form id = "findPw" name = "findPw" method="post" action="${pageContext.request.contextPath}/member/MemberFindPw.me">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-small" style="margin:0 auto;">
									<label>아이디</label>	
										<input type="text" maxlength="12" name="u_id" id="u_id" value="" placeholder="ID를 입력" required>
									<br>
									<label>휴대전화</label>
										<input type="text" name="u_phone" id="u_phone" placeholder="-를 제외하고 숫자만 입력" required>
									<br>	
									<label>비밀번호 확인 질문</label>
									<select name="u_pwd_q" id="u_pwd_q" required>
										<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
										<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
										<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
										<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
										<option value="유년시절 가장 생각나는 친구의 이름은?">유년시절 가장 생각나는 친구의 이름은?</option>
										<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
										<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
									</select>
									<br>
									<label>비밀번호 확인 답변</label>
									<input type="text" name="u_pwd_a" id="u_pwd_a" value="" required>		
								<br>
								<!-- Button -->
									<ul class="actions">
										<li style="margin:0 auto;">
											<input type="submit" id="submit_Pw" name="submit_Pw" value="비밀번호 찾기" class="button" onClick="location.href='javascript:formSubmit()'">
										</li>
									</ul></div></div>
								</form>
						</section>
						</div>
			</section>

		<!-- Footer -->
			<%@ include file = "/footer.jsp" %>

		<!-- Scripts -->
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>

<script>
//id 서브밋 클릭
$(function(){
	//아이디 없으면
	$("#submit_Pw").on('click',function(){
		if($("#u_id").val() == ""){
			alert("아이디를 입력하세요.");
			$("#u_id").focus();
			return false;
		}
	//핸드폰 번호 없으면
		if($("#u_phone").val() == ""){
			alert("핸드폰 번호를 입력해 주세요.");
			$("#u_phone").focus();
			return false;
		}
		
	//비밀번호 확인 질문 없으면
		if($("#u_pwd_q").val() == ""){
			alert("인증 번호를 입력해주세요.");
			$("#u_pwd_q").focus();
			return false;
		}
	//비밀번호 확인 질문 없으면
	if($("#u_pwd_a").val() == ""){
		alert("인증 번호를 입력해주세요.");
		$("#u_pwd_a").focus();
		return false;
	}
	//다 만족하면 true, 결과 페이지 이동
		return true;
	});
});
</script>

	
	</body>
</html>