<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!--
   Future Imperfect by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
   href="/resources/assets/css/main.css" />
</head>
<body class="is-preload">
   <%@ include file="/header.jsp"%>
   <!-- Wrapper -->
   <div id="wrapper style1">



      <!-- Main -->
      <div id="main" class="container">
         <div class="row">
            <!-- Post -->
            <div style="width: 20%; float: left;">
               <!-- Mini Post -->
               <article class="mini-post">

                  <a href="single.html"> <header>
                        <h3>메인 강사1</h3>
                        <time class="published" datetime="2015-10-20">October 20,
                           2020</time>
                       
                     </header> <a href="single.html" class="image"><img
                        src="${pageContext.request.contextPath}/images/pic01.jpg" alt="" /></a>
                  </a>
               </article>

               <!-- Mini Post -->
               <article class="mini-post">
                  <header>
                     <h3>
                        <a href="single.html">메인 강사2</a>
                     </h3>
                     <time class="published" datetime="2015-10-19">October 19,
                        2020</time>
                     <a href="#" class="author"><img src="images/한동석강사님2.jpg"
                        alt="" /></a>
                  </header>
                  <a href="single.html" class="image"><img src="images/pic01.jpg"/></a>
               </article>


               <!-- Mini Post -->
               <article class="mini-post">
                  <header>
                     <h3>
                        <a href="single.html">메인 강사3</a>
                     </h3>
                     <time class="published" datetime="2015-10-19">October 19,
                        2020</time>
                     <a href="#" class="author"><img src="images/한동석강사님2.jpg"
                        alt="" /></a>
                  </header>
                  <a href="single.html" class="image"><img
                     src="images/코리아학원2.jpg" alt="" /></a>
               </article>

               <!-- Mini Post -->
               <article class="mini-post">
                  <header>
                     <h3>
                        <a href="single.html">메인 강사4</a>
                     </h3>
                     <time class="published" datetime="2015-10-17">October 17,
                        2015</time>
                     <a href="#" class="author"><img src="코리아학원2.jpg.jpg" alt="" /></a>
                  </header>
                  <a href="single.html" class="image"><img
                     src="images/코리아학원2.jpg" alt="" /></a>
               </article>

            </div>
            <div style="width: 70%; float: right;">

               <article class="post">
                  <header>
                     <div class="title">
                        <h2>
                           <a href="single.html">- 코리아 it 아카데미 학원 -</a>
                        </h2>
                        <p>
                           - 전국지점안내 - <br> 강남점 1관 : 서울특별시 강남구 테헤란로 146 현익빌딩 3층,4층
                        </p>
                     </div>
                     <div class="meta">
                        <time class="published" datetime="2015-11-01">November 1,
                           2020</time>
                        <a href="#" class="author"><span class="name">한 동 석
                              강사</span><img src="images/한동석강사님2.jpg" alt="" /></a>
                     </div>
                  </header>
                  <a href="single.html" class="image featured"><img
                     src="images/한동석강사님동영상.JPG" alt="" /></a>
                  <p>
                     안녕하세요 저희 학원 it koreait 아카데미 한동석 프로그래밍 강사 입니다. <br> 간단한 자기소개.
                     ~~~~~~~~~~~~~~~~~~~~~~~ <br />
                  </p>
                  <details>
                     <summary class="button primary">- 경력사항 -</summary>
                     <div>
                        CJ Oshopping 지원팀 <br> Mackays in Australia <br>
                        코리아정보보안 IT 아카데미 1기 조교 <br> OCJP <br> 중학생 대상 코딩 교육 강의 <br>
                        기초코딩 특별클래스 강의 <br> 실무경력 <br> CJmall퍼스트룩 매거진&쇼핑 홈페이지 및
                        어플 개발 <br> 온라인 전단지배포 프로젝트 개발 참여 <br> 수출용 POS단말기 SW개발
                        참여 <br> QLD, Australia Mackays Farm 개발및지원팀 근무 <br>
                        BIO-BANANA IN AND OUT (TR4) against Panama disease 프로젝트 개발 <br>
                        현 코리아 정보보안 IT 아카데미 프로그래밍 학과 강사 입니다.
                     </div>
                  </details>
                  <br>
                  <details class="button primary">
                     <summary>부가정보</summary>
                     <p>와이파이 항시 구비</p>
                  </details>
                  <br>
                  <hr>
                  <footer>
                     <ul class="actions">
                        <li><a href="facility.jsp" class="button large">강사 소개</a></li>
                        <li><a href="facility.jsp" class="button large">시설 소개</a></li>
                        <li><a href="facility.jsp" class="button large">학원 리뷰</a></li>
                  </footer>
               </article>
               <hr>
               <h4>코리아IT아카데미 강남 지점 상세 지도</h4>
               <figure>
                  <img src="images/역삼역.JPG" alt="" />
               </figure>
               <details>
                  <div>
                     코리아IT아카데미 강남 지점 <br> 2호선 역삼역 3번 출구(바로연결) <br> 신한은행건물 3층
                     ,4층
                  </div>
               </details>
            </div>
         </div>
      </div>
   </div>
   <br>
   

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
<%@ include file = "/footer.jsp" %>