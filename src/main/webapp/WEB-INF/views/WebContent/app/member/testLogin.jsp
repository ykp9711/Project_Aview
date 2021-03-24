<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <title>로그인페이지</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
   </head>
   <body class="is-preload">

      <!-- Header -->
         <header id="header" class="alt">
            <a class="logo" href="main.jsp">Finedu</a>
            <nav>
               <a href="#menu"><span class="label">Menu</span></a>
            </nav>
         </header>

      <!-- Nav -->
         <nav id="menu">
            <ul class="links">
               <li><a href="main.jsp">메인화면</a></li>
               <li><a href="login.jsp">로그인</a></li>
               <li><a href="search.jsp">맞춤 학원 찾기</a></li>
               <li><a href="review.jsp">리뷰게시판</a></li>
            </ul>
         </nav>
         
      <!-- Login -->
         <div id="banner">
            <div class="wrapper style1">
               <div class="inner">
                     <img src="${pageContext.request.contextPath}/images/finedu.png" style="width:50%;"/>
                     <br>               
                     <button class="button primary large" onclick="show_login()">학생로그인 </button>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button class="button primary large" onclick="show_login_aca()">학원로그인</button>
               </div>
               <br>
               <form name="loginForm" action="${pageContext.request.contextPath}/student/StudentLoginOk.st" method="post">
               <div class="row gtr-uniform" id="login_box" style="display:none;">
                     <div class="col-6 col-12-medium" style="margin:0 auto;">
                     <div class="box">
                     <h3 align="center" id="title">학생로그인</h3>
                     
                     <input type="text" name="id" id="id"  placeholder="id">
                     <br>
                     <input type="password" name="pw" id="pw" placeholder="password">
                    
                     <p align="left">
                        <a href="find_id.jsp" style="font-size:13px">아이디및 비밀번호 찾기</a>
                     </p>
                     <br>
                     <ul class="actions">
                     
                  <li><input type="submit" class="button primary" value="로그인"></a></li>
                  <li><a href="app/student/join_stu.jsp" class="button primary">회원가입</a></li>
                  <!-- <li><a href="app/student/join_aca.jsp" class="button primary">회원가입</a></li> -->
               </ul>
                  </div>
                  </div>
               </div>
                </form>
                
               <form name="loginForm2" action="${pageContext.request.contextPath}/academy/AcademyLoginOk.ac" method="post">
                              <div class="row gtr-uniform" id="login_box_aca" style="display:none;">
                     <div class="col-6 col-12-medium" style="margin:0 auto;">
                     <div class="box">
                     <h3 align="center" id="title">학원로그인</h3>
                     <input type="text" name="id" placeholder="id">
                     <br>
                     <input type="password" name="pw" id="pw" placeholder="password">
                     <p align="left">
                        <a href="find_id.jsp" style="font-size:13px">아이디및 비밀번호 찾기</a>
                     </p>
                     <br>
                     <ul class="actions">
                  <li><input type="submit" class="button primary" value="로그인"></li>
                  <li><a href="app/academy/join_aca.jsp" class="button primary">회원가입</a></li>
                  <!-- <li><a href="app/student/join_aca.jsp" class="button primary">회원가입</a></li> -->
               </ul>
                  </div>
                  </div>
               </div>
               </form>
            </div>
            
         </div>
         



      <!-- Footer -->
         <div id="footer">
            <div class="wrapper">
               <div class="inner">
                     <a>회사소개&nbsp;</a>
                     <a>이용약관&nbsp;</a>
                     <a>개인정보처리방침&nbsp;</a>
                     <a href="main.html">Finedu</a>
                  <div class="copyright">
                     &copy; Finedu Corp. All rights reserved.
                  </div>
               </div>
            </div>
         </div>

      <!-- Scripts -->
         <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

   </body>
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
</html>