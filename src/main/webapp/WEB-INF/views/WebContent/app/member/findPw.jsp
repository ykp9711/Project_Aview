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
	</head>
	<body class="is-preload">

			<!-- Header -->
				<%@ include file = "../../header.jsp" %>

		<!-- Main -->
			<section id="main" class="wrapper style1">
				<header class="major">
					<h2>아이디 찾기</h2>
				</header>
		<!-- 아이디 찾기 -->
				<div class="container">
					<section id="find_Id">
						<form id="findId" name="findId" method="post" action="/member/sms">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-small" style="margin:0 auto;">
								<label>아이디</label>
									<input type="text" maxlength="12" name="id" id="id" placeholder="이름 입력" required>
								<br>
	
								<label>휴대전화</label>
									<div class="row gtr-uniform">
										<div class="col-6 col-12-small">
											<input type="text" name="phone" id="phone" value="" placeholder="-를 제외하고 숫자만 입력" required>
										</div>
										<div class="col-6 col-12-small">	
											<input type="submit" class="send primary" value="인증번호 받기"/>
										</div></div><br>
										<label for="AuthenticationCode">인증번호</label>
										<div id="checkBox" style="display: none;">
											<input type="text" name="code" id="code"  "placeholder="인증번호를 입력" required>
											<input type="submit" name="check" id="check" value="확인" required>
										</div>
					</form>
								</div>
						
								<br><Br>
								
								<!-- Button -->
									<ul class="actions">
										<li style="margin: 0 auto;">
											<input type="submit" id="submit_Id" name="submit_Id" value="아이디 찾기" class="primary" onClick="location.href='javascript:formSubmit()'">
										</li>
										<li style="margin: 0 auto;">
											<a href onclick="window.open('${pageContext.request.contextPath}/app/code/checkId.jsp','ID존재 확인','width=600,height=600,location=no,status=no,scrollbars=yes');" class="button">비밀번호 찾기</a>
										</li>
									</ul></div></div>
					</section>
					</div>
			</section>
			<input type="hidden" id="realCode" name="realCode"/>

		<!-- Footer -->
			<%@ include file = "../../footer.jsp" %>

		<!-- Scripts -->
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>

<script>
//id 서브밋 클릭
/* $(function(){
		
		$("#submit_Id").on('click',function(){
		//성 없으면
			if($("#u_last_name").val() == ""){
				alert("성을 입력해 주세요.");
				$("#u_last_name").focus();
				return false;
			}
		//이름 없으면	
			if($("#u_first_name").val() == ""){
				alert("이름을 입력해 주세요.");
				$("#u_first_name").focus();
				return false;
			}
		//핸드폰 번호 없으면
			if($("#fI_phone").val() == ""){
				alert("핸드폰 번호를 입력해 주세요.");
				$("#fI_phone").focus();
				return false;
			}
		
		//핸드폰 번호 없으면
		if($("#fI_email").val() == ""){
			alert("이메일을 입력해 주세요.");
			$("#fI_email").focus();
			return false;
		}
			
		//인증 번호 없으면
			if($("#fI_code").val() == ""){
				alert("인증 번호를 입력해주세요.");
				$("#fI_code").focus();
				return false;
			}			
		//다 만족하면 true, 결과 페이지 이동
			return true;
		});
	}); */</script>

	
	<script>
	$('.send').on("click", function(e){
		e.preventDefault();
		checkBox.style.display="block";
		var phone = $('#phone').val(); // 입력한 핸드폰 번호
		var data = {phone : phone} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		$.ajax({ type : "get",
			url : "/member/sms",
			data : data, 
			success : function(result){ 
				$("#realCode").val(result);
			
			}// success 종료
		}); // ajax 종료
		 });// function 종료
	</script>
	
	<script>
		$("#check").on("click", function(e){
			e.preventDefault();
			var phone = $("#phone").val();
			var code = $("#code").val(); // 입력한 코드
			var realCode =$("#realCode").val() // 전송된 코드
			console.log(phone)
			console.log(code)
			console.log(realCode)
			if(code.trim() == realCode.trim()){
				location.href="/member/pwInfo?phone="+phone;
				return false;
			}else
				alert("인증번호가 틀렸습니다")
				
		})
	</script>
	
	</body>
</html>