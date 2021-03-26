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
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
   </head>
   
      <!-- Main -->
         <section id="main" class="wrapper style1">
            <header class="major">
               <h2>Aview Login</h2>
            </header>
            <div class="container">
            
                 <c:if test="${not empty param.login}">
                       <c:if test="${not param.login}">
                          <script>alert("아이디 또는 비밀번호를 다시 확인해주세요.")</script>
                       </c:if>
                 </c:if>
               <!-- login -->
               <ul class="actions">
                     <li style="margin:0 auto;">
                     <button class="button primary" onclick="show_login()">학생로그인 </button>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button class="button primary" onclick="show_login_aca()">학원로그인</button>
                     </li>
                </ul>
   			

                     
               <div class="row gtr-uniform" id="login_box" style="display:none;">
                     <div class="col-6 col-12-medium" style="margin:0 auto;">
                     <div class="box">
                     <h3 align="center" id="title">학생 로그인</h3>
                     
                     <input type="text" name="id" id="id"  placeholder="아이디">
                     <br>
                     <input type="password" name="pw" id="pw" placeholder="패스워드">
                    
                     <p align="right">
                        <a href="find_id.jsp" style="font-size:13px">아이디및 비밀번호 찾기</a>
                     </p>
                     <br>
                                          <ul class="actions">
                              <li style="margin:0 auto;">
                                  <a href="javascript:loginForm.submit()" class="button" style="width:125px;">로그인</a>&nbsp;&nbsp;
                                 <!-- <input type="submit" value="로그인" class="primary" id="login" onClick="location.href='javascript:formSubmit()'"/> -->
                                 <a href="/main/joinStudentForm" class="button">학생 회원가입</a>
                              </li>
                     </ul>
                  </div>
                  </div>
               </div>
                
              
                     <div class="row gtr-uniform" id="login_box_aca" style="display:none;">
                     <div class="col-6 col-12-medium" style="margin:0 auto;">
                     <div class="box">
                     <h3 align="center" id="title">학원 로그인</h3>
                     <input type="text" name="id" id="id"  placeholder="아이디">
                     <br>
                     <input type="password" name="pw" id="pw" placeholder="패스워드">
                    
                     <p align="right">
                        <a href="find_id.jsp" style="font-size:13px">아이디및 비밀번호 찾기</a>
                     </p>
                     <br>
                     
                     <!-- button -->
                     <ul class="actions">
                              <li style="margin:0 auto;">
                                  <a href="javascript:loginForm.submit()" class="button" style="width:125px;">로그인</a>&nbsp;&nbsp;
                                 <!-- <input type="submit" value="로그인" class="primary" id="login" onClick="location.href='javascript:formSubmit()'"/> -->
                                 <a href="/main/joinAcademyForm" class="button">학원 회원가입</a>
                              </li>
                     </ul>
                  </section>

         
         
            <body onkeydown="javascript:EnterLogin();"></body>
      <script>
         function EnterLogin() {
            var keyCode = window.event.keyCode;
            if (keyCode == 13) {
               loginForm.submit();
            }
         }
      </script>
<!-- footer -->
<%@ include file = "../../footer.jsp"%>

<script>
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