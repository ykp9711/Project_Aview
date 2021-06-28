<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file = "../../header.jsp" %>
<html>
   <head>
      <title>ReView List</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="../../../../../resources/assets/css/main.css" />
   </head>
   <body class="is-preload">
      <!-- Main -->
         <div id="main">
            <div class="wrapper">
               <div class="inner">

                  <!-- Elements -->
                     <section id="main" class="wrapper style1">
			            <header class="major">
			               <h2>리뷰 작성하기</h2>
			            </header>
   					 </section><br><br>
                           <!-- Table -->
                  <div class="container">   
                  	 <section id="content">
                  	     <h3><a href="/list/review" class="button small">목록 보기</a></h3>
			                        <form method="post" action="/list/register" name="registForm">
			                           <div class="fields">
			                              <div class="field">
			                                 <h4>제목</h4>
			                                 <input name="title" id="title" placeholder="Title" type="text" />
			                              </div><br>
			                              <div class="field">
			                                 <h4>내용</h4>
			                                 <textarea name="content" id="content" rows="6" placeholder="Content" style="resize:none"></textarea>
			                              </div><br>
			                              <div class="field">
			                                 <h4>작성자</h4>
			                                 <input name="writer" id="writer" placeholder="Writer" type="text" />
			                              </div><br>
			                           </div>
			                           <ul class="actions special">
			                              <li>
			                              	<h3><input type="submit" value="등록하기" class="primary"/>
			                              	<input type="reset" class="button" value="다시작성" id="joinReset" onClick="location.href='javascript:joinForm.reset()'"/></h3>
			                              </li>
			                           </ul>
			                        </form>
			                        </section>
			                     </div>
			                              </div>
			                        </div>
			                     </div>

      <!-- Scripts -->
		<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
		<script>var contextPath = "${pageContext.request.contextPath}";</script>
        <%@ include file = "../../footer.jsp" %>
   </body>
</html>