<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file = "../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user info</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
		<!-- Main -->
	<section id="main" class="wrapper style1">
		<header class="major">
			<h2>개인정보 변경</h2>
		</header>
		<div class="container">
		

            <article id = "user">
				<form name="userinfo" action="/member/infoModifystu" method="post">	
					 <div class="row gtr-uniform">
							<div class="col-6 col-12-small" style="margin:0 auto;"> 
									
                          
								<label>아이디</label><input type="text" maxlength="12" name="sid" id="sid" value="${id.sid}" readonly onclick="alert('※변경할수 없습니다')">
						
							<br>
							<label for="last_name">성</label>
								<input type="text"  name="slastname" id="slastname" value="${id.slastname}" readonly onclick="alert('※변경할수 없습니다')">
							<br> 
							<label for="first_name">이름</label>
								<input type="text"  name="sfirstname" id="sfirstname" value="${id.sfirstname}" readonly onclick="alert('※변경할수 없습니다')">
							<br> 
								<label>비밀번호</label>
									<input type="password" maxlength="12" name="spwd" id="spwd" value="${id.spwd}" required>
							<br>
								 <%-- <label for="pw2">비밀번호 재확인</label>
									<input type="password" maxlength="12" name="pw2" id="pwd2" value="${id.spwd}" onkeyup="checkPwd();" required>
									<p id="checkMsg"></p>
							<br>  --%>
			
								<label for="email">이메일</label>
									<input type="email" name="semail" id="semail" value="${id.semail}" required>
							<br>
								  <label for="phone">휴대전화</label>
									<div class="row gtr-uniform">
										<div class="col-6 col-12-small">
											<input type="text" name="sphone" id="sphone" value="${id.sphone}" required>
										</div>
									</div>
							<br>
										<!-- <div class="col-6 col-12-small">	
											<input type="submit" value="인증번호 받기" class="primary"/>
										</div>
									</div>
											<label for="verification_code"></label>
											<input type="text" placeholder="인증번호를 입력하세요" required>  
							<br> -->
								<label for ="postal_code">우편번호</label>
									<div class="row gtr-uniform">
										<div class="col-6 col-12-small">
											<input type="text" name="szipcode" id="szipcode" value="${id.szipcode}" readonly="readonly"  >
										</div>	
 										 <div class="col-6 col-12-small">	
											<input type="button" name="find_zipcode" id="find_zipcode" value="우편번호 찾기" style="display: inline;">
										</div>
									</div>		
							<br>		
								<label for ="address">주소</label>
									<input type="text" name="saddress" id="saddress" value="${id.saddress}" readonly="readonly" >
							<br>
								<label for ="detail_address">상세주소</label>
									<input type="text" name="saddressdetail" id="saddressdetail" value="${id.saddressdetail}" >
							<br> 
               <!-- Content -->

                        <ul class="actions">
								<li style="margin:0 auto;">
								    <a href="javascript:userinfo.submit()" class="button"style="width:150px;">수정하기</a>	
								</li>
								<li>
									<a href="" id="leave">회원탈퇴</a>
								</li>
							</ul>
                  </div>
						</div>
						
							</form>
							</article>
							</div>
					</section>

<script>

</script>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
$("#leave").on("click",function(e){
	e.preventDefault();
	 if (confirm("회원탈퇴를 하시겠습니까?")) {
         // 확인 버튼 클릭 시 동작
         location.href="/member/userLeave?sid=${id.sid}"
     } else {
         // 취소 버튼 클릭 시 동작
         alert("회원탈퇴가 취소되었습니다.");
     }
})
</script>
<%@ include file = "joinFormJS.jsp" %>
<!-- Footer -->
<%@ include file = "../../footer.jsp" %>