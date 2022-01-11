<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--
   Future Imperfect by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!DOCTYPE HTML>
<html>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-0lax{text-align:left;vertical-align:top}
/* 폰트 적용 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

html {
    font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body, ul, li, h1, h2, h3, h4, h5 {
    margin:0;
    padding:0;
    list-style:none;
}

a {
    color:inherit;
    text-decoration:none;
}

</style>
<% String ano = request.getParameter("ano"); %>

<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
   href="/resources/assets/css/main.css" />
</head>
<body class="is-preload"  style="padding: 0; margin: 0;">

   <%@ include file="../../header.jsp"%>
   <!-- Wrapper -->
   <br><br><br>
   <section id="three" class="wrapper style1">
      <header class="major">
         <h2>학원 리뷰</h2>
      </header>
      <div class="container">
      <a style="width:100%" href="javascript:void(0)" class="button primary small register">학원 리뷰 쓰기</a>
                           <div class="fields register-form" style="display:none">

                      <section id="content">
                           <form name="insertReivew" action="/board/insertReview" method="post">
                              <div class="field">
                              <input type="hidden" name="ano" value="${ano}">
                              <label>작성자</label>
                                       <input type="text" maxlength="12" id= "writer"
                                       name="writer" value="" placeholder=""required>
                              </div><br>
                              <div class="field">
                                 <label>학원 리뷰</label>
                                       <textarea name="content"  id = "content" rows="6"
                                    style="resize: none; "placeholder=""></textarea>
                              </div><br>
                              <div class="field">
                              <input type="hidden" name="ano" value="${ano}">
                              <label>비밀번호</label>
                                       <input type="text" maxlength="12" id= "writer"
                                       name="writer" value="" placeholder="글을 수정할 때 사용할 비밀번호"required>
                              </div><br>
                              <ul class="actions">
                                    <li style="margin:0 auto;">
                                       <input type="submit" value="작성하기" class="primary"/>
                                 </ul>
                           </form>
                           </section></div></div>
      <div id="main" class="container">
                           <div class="row">
                              <!-- Post -->

                              <div style="width: 70%;">
<div class="container">

            <div class="col-4 col-6-medium col-12-small">
               <article class="box post" style="width : 100%;">
<article style="width: 70%; height:1200px; margin: 0 auto;">

  <c:forEach var="review" items="${review}">

<table style="text-align: center;"  >
<tbody>
  <tr>
    <td style="text-align: center;" >${review.writer}</td>
  </tr>
  <tr>
    <td style="resize:none"  colspan="2">${review.content}</td>
    
  </tr>
  <tr>
  <td style="resize:none; vertical-align : bottom; text-align:right;" ><a href="/board/ModifyReview">리뷰 수정/삭제</a></td>
  </tr>
</tbody>
</table>

&nbsp;
</c:forEach>

</article>               

            
            </article>
            </div>
            </div>
            </div>
            </div>
            </div>
            </section>
   

   <!-- Scripts -->
   <script src="/resources/assets/js/jquery.min.js"></script>
   <script src="/resources/assets/js/jquery.scrollex.min.js"></script>
   <script src="/resources/assets/js/jquery.scrolly.min.js"></script>
   <script src="/resources/assets/js/browser.min.js"></script>
   <script src="/resources/assets/js/breakpoints.min.js"></script>
   <script src="/resources/assets/js/util.js"></script>
   <script src="/resources/assets/js/main.js"></script>

<script>
$(".register").on("click", function(e){
   e.preventDefault();
   
   $(".register-form").show();
   $(this).hide();
})


$(".cancle").on("click", function(e){
   e.preventDefault();
   
   $(".register-form").hide();
   $(".register").show();
})
</script>
</body>
</html>