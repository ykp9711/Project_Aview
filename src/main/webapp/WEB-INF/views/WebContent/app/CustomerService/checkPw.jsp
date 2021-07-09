<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Check PW</title>
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
			               <h2>비밀번호 확인</h2>
			            </header>
   					 </section><br><br>
                           <!-- Table -->
                  <div class="container">   
                  	 <section id="content">
			                        <form method="get"  id ="checkPw" name="checkPw"> 
			                           <div class="fields">
			                              <div class="field">
			                                 <h4>게시글 비밀번호</h4>
			                                 <input type="hidden" name ="bno" id="bno" value="${bno}">
			                                 <input type="hidden"  name="pw" id="pw" value="${pw}">
			                                 <input type="text" name="getpw" id="getpw" placeholder="게시물 등록시 작성한 비밀번호">
			                              </div><br>
			                           </div> 
			                           <ul class="actions special">
			                              <li>
			                              	<h3> 
			                              	<button class="button small" id="GO">확인</button>
			                              	<!-- <a href="javascript:checkPw.submit()" id="GO" class="button"style="width: 125px;">확인</a> -->
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
		function EnterLogin() {
			var keyCode = window.event.keyCode;
			if (keyCode == 13) {
				loginForm.submit();
			}
		}
		$("#GO").on('click',function(e){
 		 	e.preventDefault();
 		 	
          var pwd1 = $("#pw").val();
            var pwd2 = $("#getpw").val();
            var bno = $("#bno").val();
            console.log(pwd2)
            console.log(pwd1)
            if(pwd1 != pwd2){
            	alert("비밀번호가 틀렸습니다.");
            
            }else{
            	alert("비밀번호가 맞습니다.");
            	location.href="/serviceList/modifyGo?bno="+bno;
            }
         } )
		</script>
        <%@ include file = "../../footer.jsp" %>
   </body>
</html>