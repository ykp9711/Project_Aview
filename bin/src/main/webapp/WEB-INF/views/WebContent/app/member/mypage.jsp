<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Header -->
<!--
	Drift by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<%@ include file = "/header.jsp" %>
	<head>
		<title>mypage</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
		<c:if test="${session_id eq null}">
		<script>
			alert("로그인 후 이용해주세요");
			location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
		</script>
		</c:if>
	<body class="landing is-preload">



      <!-- Main -->
         <section id="main" class="wrapper style1">
            <header class="major">
               <h2>My Page</h2>
            </header>
            <div class="container">
               <div class="row gtr-150">
                  <div class="col-4 col-12-medium">

                     <!-- Sidebar -->
                        <section id="sidebar">
                           <section>
                              <h3>${memberBean.getU_id()}님 환영합니다</h3>
                              <p>개인정보를 편집하실려면<br>아래 버튼을 눌러주세요</p>
                                 <ul class="actions" style="float:right">
                                    <li><a href="${pageContext.request.contextPath}/member/MemberViewInfo.me?u_id=<%=session.getAttribute("session_id")%>" class="button small alt">프로필 변경</a></li>
                                 </ul>
                           </section>
                           <br><br><br><br>
                           <section>
                              <hr>
                              <h3>수거신청 수정하기</h3>
                              <p>수거신청을 수정하시려면<br>아래 버튼을 클릭해주세요</p>
                              <footer>
                                 <ul class="actions" style="float:right">
                                    <li><a href="${pageContext.request.contextPath}/member/myApplyAction.me?a_id=<%=session.getAttribute("session_id")%>" class="button small alt">수거 수정하기</a></li>
                                 </ul>
                              </footer>
                           </section>
                        </section>

                  </div>

      
      <!-- Content -->   
               <!--    <div class="col-8 col-12-medium imp-medium"> -->
            <div class="col-4 col-6-medium col-12-small" style="position:relative;margin:auto;">
                <section id="content">       
                           <article class="box post" style="border:1px solid lightgray;position:relative;">
                              <!--    <a href="#" class="image fit"><img src="images/pic01.jpg" alt=""></a> -->
                                 <p></p>
                                 <p></p>
                                 <h3>my cash</h3>
                                 <p>나의 포인트는</p>
                                 <p>${memberBean.getU_point()}점</p>
                                 <%-- <ul class="actions special">
                                    <li><a href="${pageContext.request.contextPath}/app/member/mycashlist.jsp" class="button">상세 조회</a></li>
                                 </ul> --%>
                                 <p></p>
                                 <p></p>
                           </article>

                           <article class="box post" style="border:1px solid lightgray;position:relative;">
                                 <!-- <a href="#" class="image fit"><img src="images/pic01.jpg" alt=""></a> -->

                                 <p></p>
                                 <p></p>            
                                 <h3>my shopping</h3>
                                 <p>내 쇼핑 내역</p>
                                 <p>${paybackCount}건</p>
                                 <%-- <ul class="actions special">
                                    <li><a href="${pageContext.request.contextPath}/app/member/myshoppinglist.jsp" class="button">상세 조회</a></li>
                                 </ul> --%>
                                 <p></p>
                                 <p></p>                     
                           </article>
                  </section>
            </div>
         
            <div class="col-4 col-12-small" style="position:relative;margin:auto;">
                <section id="content">       
                           <article class="box post" style="border:1px solid lightgray;position:relative;">
                              <!--    <a href="#" class="image fit"><img src="images/pic01.jpg" alt=""></a> -->
                                 <p></p>
                                 <p></p>
                                 <h3>my recycle</h3>
                                 <p>나의 재활용 수거 건수</p>
                                 <p>${deliverCount}건</p>
                                <%--  <ul class="actions special">
                                    <li><a href="${pageContext.request.contextPath}/app/member/myrecyclelist.jsp" class="button">상세 조회</a></li>
                                 </ul> --%>
                                 <p></p>
                                 <p></p>   
                           </article>
                        
                           <article class="box post" style="border:1px solid lightgray;position:relative;">
                              <!--    <a href="#" class="image fit"><img src="images/pic01.jpg" alt=""></a> -->
                                 <p></p>
                                 <p></p>
                                 <h3>review</h3>
                                 <p>나의 리뷰는</p>
                                 <p>${reviewCount}건</p>
                                <%--  <ul class="actions special">
                                    <li><a href="${pageContext.request.contextPath}post.jsp"" class="button">상세 조회</a></li>
                                 </ul> --%>
                                 <p></p>
                                 <p></p>                                 
                           </article>

                  </section>
               </div>
            </div>
         </div>
       </section> 
   
			
	</body>
<%@ include file = "/footer.jsp" %>