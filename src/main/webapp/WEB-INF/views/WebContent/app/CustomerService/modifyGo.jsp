<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file = "../../header.jsp" %>
<html>
   <head>
      <title>CustomerService Modify</title>
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
			               <h2>작성한 문의 글</h2>
			            </header>
   					 </section><br><br>
                           <!-- Table -->
                  <div class="container">   
                  	 <section id="content">

						<h3><a href="/serviceList/service" class="button small">목록 보기</a>&nbsp;
						 <button id="delete"class="button small" style="width:170px; float:right; ">글 삭제</button></h3>
			                        <form method="post" action="/serviceList/modify">
			                           <div class="fields">
			                           		<input name="bno" type="hidden" value="${list.bno}"/>
			                              <div class="field">
			                                 <h4>제목</h4>
			                                 <input name="title" type="text" value="${list.title}"/>
			                              </div><br>
			                              <div class="field">
			                                 <h4>내용</h4>
			                                 <textarea name ="content" rows="6">${list.content}</textarea>
			                              </div><br>
			                              <div class="field">
			                                 <h4>작성자</h4>
			                                 <input name="writer" type="text" value="${list.writer}" readonly/>
			                              </div><br>
			                              <div class="field">
			                                 <h4>게시글 비밀번호</h4>
			                                 <input name="password" type="text" value="${list.password}" readonly/>
			                              </div><br>
			                           </div>
			                           <ul class="actions special">
			                              <li>
			                              	<h3>
			                              	<input type="submit" value="수정완료" class="primary"/>&nbsp;
			                              	<input type="reset" class="button" value="다시작성" id="joinReset" onClick="location.href='javascript:joinForm.reset()'"/>
			                              	</h3>
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
		<script>
		$("#delete").on("click", function(e){
		      location.href="/serviceList/delete?bno="+${list.bno};
		   })
		</script>
        <%@ include file = "../../footer.jsp" %>
   </body>
</html>