<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
   <%@ include file="../../header.jsp"%>
   <!-- Wrapper -->
   <br><br>
      <div id="wrapper style1">
            <div id="main" class="container">
         <div class="row">
   <c:if test="${board.academyId eq session_id}">
   
   <div style="margin-left:0%;">
   <button class="button large modify">게시글 수정</button>
   &nbsp;&nbsp;
   <button class="button large remove">게시글 삭제</button><br><br>
   </div><br>
   </c:if>


      <!-- Main -->

            <!-- Post -->
            <div style="width: 100%; float: right;">

               <article class="post">
               
                  <header>
                     <div class="title">
                        <h2>
                           ${board.academyTitle}
                        </h2>
                     </div>
                     <div class="meta">
                        <time class="published" >${board.regDate}</time>
                        <span class="name">${board.academyName}</span>
                     </div>
                  </header>
                  <p>
                  <c:if test="${fn:length(board.academyYoutube) > 30}">
                  <div style="text-align: center;"><iframe width="600" height="400" src="${board.academyYoutube}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                 </div>
                 </c:if>
                  </p>
                 <div style="width:750px; word-break:break-all;">
                     ${board.academyContent}
                    </div>
                     <br />
          
                  <br>
                  <hr>
                  <footer>
                   <div style="margin-left:50%;">
                   <div style="margin-left: -60%;">
                     <ul class="actions">
                        <li><a href="/board/getTeacher" class="button large">강사 소개</a></li>
                        <li><a href="/board/getFacility?ano=${board.ano}" class="button large">시설 소개</a></li>
                        <li><a href="facility.jsp" class="button large">학원 리뷰</a></li>
                      </ul>
                      </div>
                    </div>
                  </footer>
               </article>
               <hr>
               <h4>코리아IT아카데미 강남 지점 상세 지도</h4>
               <figure>
                  <img src="images/역삼역.JPG" alt="" />
               </figure>
				 ${board.mapDetail}
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

	<script>
	$(".remove").on("click",function(e){
		e.preventDefault();
		 if (confirm("게시글을 삭제하시겠습니까?")) {
			location.href="/board/removeBoard?ano=" +${board.ano};
         } else {
             // 취소 버튼 클릭 시 동작
             alert("취소되었습니다.");
         }
	})
	
	$(".modify").on("click",function(e){
		e.preventDefault();
			location.href="/board/modifyBoard?ano=" +${board.ano};
	})
	</script>
</body>
</html>
<%@ include file = "../../footer.jsp" %>