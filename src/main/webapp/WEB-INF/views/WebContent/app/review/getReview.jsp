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
                           <!-- Table -->
                  <div class="container">   
                  	 <section id="content">
                  	 <span>
                  	     <a href="/list/review?pageNum=${cri.pageNum}&amount=${cri.amount}" class="button small" style="width:170px; float:left;">목록 보기</a>
			             <button idrlt" class="button small" style="width:170px; ">게시글 수정</button>
			             <button id="modify"class="button small" style="width:170px; display: none; ">수정 완료</button>
			             <button id="delete"class="button small" style="width:170px; float:right; ">게시글 삭제</button>
			             </span>
			             <form id="review" name="review" action="/list/modify" method="post">
			             <input type="hidden" name="bno" value="${review.bno}">
			                           <div class="fields">
			                              <div class="field">
			                                 <h4>제목</h4>
			                                 <input name="title" id="title" placeholder="Title" type="text" readonly="readonly" value="${review.title}" />
			                              </div><br>
			                              <div class="field">
			                                 <h4>내용</h4>
			                                 <textarea name ="content" id="content1" rows="6" placeholder="Content" readonly="readonly" >${review.content}</textarea>
			                              </div><br>
			                              <div class="field">
			                                 <h4>작성자</h4>
			                                 <input name="writer" id="writer" placeholder="Writer" readonly="readonly" type="text" value="${review.writer}" />
			                                 <input name="session_id" id="session_id" type="hidden" value="${session_id}" />
			                              </div><br>
			                           </div>
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
   <script>
   var review =  $("#review");
   var writer = $("#writer").val();
   var id = $("#session_id").val();
   $("#modifyButton").on("click", function(e){
	   if(id.trim() != writer.trim()){
		   alert("다른 회원의 게시글은 수정 할 수 없습니다.")
	   }else{
	   alert("게시글을 수정 후 완료버튼을 눌러주세요");
	   $("#content1").removeAttr("readonly");
	   $("#title").removeAttr("readonly");
	   $("#modifyButton").css({"float" : "left"});
	   $("#modify").css('display','block');
	   }
   } )
   
   $("#modify").on("click",function(e){
	   review.submit();
   })
   
   $("#delete").on("click", function(e){
	   location.href="/list/delete?bno="+${review.bno};
   })
   </script>
</html>