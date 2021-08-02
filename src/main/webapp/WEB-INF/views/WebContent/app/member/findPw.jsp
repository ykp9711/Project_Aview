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
					<h2>비밀번호 찾기</h2>
					<h4>전화번호 인증</h4>
				</header>
		<!-- 아이디 찾기 -->
				<div class="container">
				<section id="CodeCheck">
					<form name="CodeCheckForm" action="/member/sms" method="post">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-small" style="margin: 0 auto;">
								<label>전화 번호</label>
								<input type="text" name="phone" id="phone" value="" placeholder="-를 제외하고 숫자만 입력" required/><br>
								<input type="submit" class="send primary" value="인증번호 받기"/>
							</div>
						</div><br>
							<div class="row gtr-uniform">
								<div id="checkBox" class="col-6 col-12-small" style="margin: 0 auto;">
									<label for="AuthenticationCode">인증번호</label> 
									<input type="text" maxlength="12" name="code" id="code" value="" placeholder="인증번호 입력" required /><br>
									<input type="submit" name="check" id="check" value="확인" required>
								</div>
							</div><br>
					</form>
					</section>
					</div>
			<input type="hidden" id="realCode" name="realCode"/>
</section>
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
			<script>
		$("#requireCode").on('click',function(){
			//전화번호 없으면
				if($("#c_phone").val() == ""){
					alert("전화번호를 입력 하세요.");
					$("#c_phone").focus();
					return false;
				}
		});
			
		$("#submitCode").on('click',function(){
			//인증번호 없으면
				if($("#tempcode").val() == ""){
					alert("인증번호를 입력 하세요.");
					$("#tempcode").focus();
					return false;
				}
		});
		</script>
	</body>
</html>