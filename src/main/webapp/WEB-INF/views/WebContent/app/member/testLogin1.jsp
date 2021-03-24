<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--
   Drift by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!-- Header -->
<%@ include file="../../header.jsp" %>

   	<head>
		<title>Academy reView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
	</head>
	
      <!-- Main -->
         <section id="main" class="wrapper style1">
            <header class="major">
               <h2>Aview Login</h2>
            </header>
            
            <c:if test="${not empty param.login}">
	   	  		<c:if test="${not param.login}">
	   	  			<script>alert("아이디 또는 비밀번호를 다시 확인해주세요.")</script>
	   	  		</c:if>
		   	</c:if>
			   	  
            <div class="container">
            	<a href="show_login()" class="button">학생로그인 </a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="show_login_aca()" class="button">학원로그인 </a>
			</div>
			<div class="container">
               <!-- login -->
                  <section id="login">

                     <form name="loginForm" action="${pageContext.request.contextPath}/member/MemberLoginOk.me" method="post">   
                        <div class="row gtr-uniform" >
                           <div class="col-6 col-12-small" style="margin:0 auto;">
                              <label for="loginId">ID</label>
                                 <input type="text" maxlength="12" name="u_id" id="u_id" value="" placeholder="아이디 입력" required/>
                           <br>
                              <label for="loginPw">Password</label>
                                 <input type="password" maxlength="12" name="u_pwd" id="u_pwd" value="" placeholder="비밀번호 입력" required/>
                           </div>
                        </div>
                     </form>
                     <br>
                     
                     <!-- button -->
                     <ul class="actions">
                              <li style="margin:0 auto;">
                              	 <a href="javascript:loginForm.submit()" class="button">로그인</a>&nbsp;&nbsp;
                                 <!-- <input type="submit" value="로그인" class="primary" id="login" onClick="location.href='javascript:formSubmit()'"/> -->
                                 <a onclick="window.open('${pageContext.request.contextPath}/app/code/checkId.jsp','ID존재 확인','width=430,height=500,location=no,status=no,scrollbars=yes');" class="button">비밀번호 찾기</a>
                              </li>
                     </ul>
                  </section>
            </div>
         </section>
         
         
				<body onkeydown="javascript:EnterLogin();"></body>
		<script>
			function EnterLogin() {
				var keyCode = window.event.keyCode;
				if (keyCode == 13) {
					loginForm.submit();
				}
			}
			
			var display = document.getElementById("login_box");
			   var display2 = document.getElementById("login_box_aca");
			         function show_login(){

			            /* if(flag == 1){
			               display.title.innerHTML = "학원 로그인";
			            } */
			            

			            display.style.display = "block";
			            display2.style.display = "none";
			         }
			         function show_login_aca(){

			            /* if(flag == 1){
			               display.title.innerHTML = "학원 로그인";
			            } */
			            display.style.display = "none";
			            display2.style.display = "block";
			            }
			         
		</script>
<!-- footer -->
<%@ include file = "../../footer.jsp"%>