<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--
   Drift by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!-- Header -->
<%@ include file = "../../header.jsp" %>
 <style>
    #container {
        width:960px;
        margin:0 auto;
        text-align:center;
    }
    .tab {
        list-style: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }
    /* Float the list items side by side */
    .tab li {
        float: left;
    }
    /* Style the links inside the list items */
    .tab li a {
        display: inline-block;
        color: #000;
        text-align: center;
        text-decoration: none;
        padding: 14px 16px;
        font-size: 17px;
        transition:0.3s;
    }
    /* Style the tab content */
    .tabcontent {
        display: none;
        background-color:#f7f7f7;
        padding: 6px 12px;
        color:#fff;
    }
    ul.tab li.current{
        background-color: rgb(0,154,200);
        color: #222;
    }
    .tabcontent.current {
        display: block;
    }
    
    /*강사 사진 및 동영상  태그 숨기기 , 보이기*/ 
  /* body{font-size:9pt;}
th{text-align:right;background:#f6f6f6;}
table{border:1px solid #f2f2f2;width:100%;} */

/* 시설 사진 추가 태그 숨기기 , 보이기 */
#facility1 , #facility2,  #facility3 , #facility4, #facility5{position:relative; left:0; top:0; z-index:3; visibility:hidden;}  
    
    
    
</style>
   <head>
      <title>Academy Board</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="../../../../../resources/assets/css/main.css" />
   </head>
      <!-- Main -->
      
   <section class="wrapper style1">
      <div class="container">
      <!-- Join -->
         <article id = "AcademyUpload">
         <div id="tab1" class="tabcontent current">
         			<ul class="tab">
		        <li class="current" data-tab="tab1"><a href="#">학원소개등록</a></li>
		        <li data-tab="tab2"><a href="#tab2">메인강사등록</a></li>
		        <li data-tab="tab3"><a href="#tab3">교육 시설 안내</a></li>
		        <li data-tab="tab4"><a href="#tab4">Travel</a></li>
		    </ul>
            <form name="joinForm" action="/board/register" method="post">   
               <div class="row gtr-uniform">
                     <div class="col-6 col-12-small" style="margin:0 auto;">
 						<br><br>
						    <header class="major">
						         <h2>학원 등록</h2>
						      </header>
                        <br>
                        <label>학원 이름</label>
                           <input type="text" maxlength="12" name="academyName" id="academyName" value="" required>
                           <p id="Academy_text"></p>
                        <label>게시글 제목</label>
                          <input type="text" maxlength="12" name="academyTitle" id="academyTitle" value="" required>
                          <br>
                        <label>게시글 목록 사진</label>
                          <input type='file' name="academyPhoto" id="academyPhoto" required>
                          <br><br>
                        <label>학원 상세 설명</label>
                           <textarea name="academyContent" id="academyContent"  rows="6" style="resize:none;" placeholder="학원 상세 설명"></textarea>
                          <br>
                         <label>학원 소개</label>
                           <textarea name="academyIntro" id="academyIntro"  rows="3" style="resize:none;" placeholder="학원 소개"></textarea>
                          <br>
                        <label>학원 태그</label>
                          <input type="text" maxlength="12" name="academyTag" id="academyTag" value="" required>
                          <br>
                         <label for="pw2">학원 소개 영상 유튜브 링크</label>
                           <input type="text" maxlength="12" name="academyYoutube" id="academyYoutube" value="">
                          <br>
                         <label for ="hint">지역</label>
                          <select name="academyArea" id="academyArea" required>
                        <option value="전국" style="color:black"> 전국 </option>
                        <option value='서울특별시' style="color:black">서울특별시</option>
                        <option value='광주광역시' style="color:black">광주광역시</option>
                        <option value='대구광역시' style="color:black">대구광역시</option>
                        <option value='대전광역시' style="color:black">대전광역시</option>
                        <option value='부산광역시' style="color:black">부산광역시</option>
                        <option value='울산광역시' style="color:black">울산광역시</option>
                        <option value='인천광역시' style="color:black">인천광역시</option>
                        <option value='세종특별자치시' style="color:black">세종특별자치시</option>
                        <option value='강원도' style="color:black">강원도</option>
                        <option value='경기도' style="color:black">경기도</option>
                        <option value='경상남도' style="color:black">경상남도</option>
                        <option value='경상북도' style="color:black">경상북도</option>
                        <option value='전라남도' style="color:black">전라남도</option>
                        <option value='전라북도' style="color:black">전라북도</option>
                        <option value='제주특별자치도' style="color:black">제주특별자치도</option>
                        <option value='충청남도' style="color:black">충청남도</option>
                        <option value='충청북도' style="color:black">충청북도</option>
                     </select>
                     <br> 
                            <label for ="hint">학원 카테고리</label>
                             <select name="academyKind" id="academyKind" required>
                        <option value="no" > 학원 카테고리  </option>
                        <option value="IT자격증" >IT자격증</option>
                        <option value='실무' >실무실행</option>
                        <option value='어학원' >어학원</option>
                        <option value='등등1' >등등1</option>
                        <option value='등등2' >등등2</option>
                        <option value='등등3' >등등3</option>
                        <option value='등등4' >등등4</option>

                     </select>
                 <br>
                     <ul class="actions">
                        <li style="margin:0 auto;">
                           <input type="submit" value="등록하기" class="primary"/>
                           <!-- <a href="javascript:formSubmit()" id="joinSubmit">회원가입</a>&nbsp;&nbsp; -->
                           <input type="reset" value="다시작성" id="joinReset" onClick="location.href='javascript:joinForm.reset()'"/>
                                <!-- <a href="javascript:joinForm.reset()">다시작성</a>&nbsp;&nbsp; -->
                                <%-- <a href="${pageContext.request.contextPath}/member/MemberLogin.me">로그인</a> --%>
                        </li>
                     </ul>
                  
                     </form>
                     </div>
                     </article>
                     </div>
               </section>
               
 <section class="wrapper style1">

      <div class="container">
      <!-- Join -->
         <article id = "AcademyUpload">
         <div id="tab2" class="tabcontent current">
               <ul class="tab">
        <li class="current" data-tab="tab1"><a href="#">학원소개등록</a></li>
        <li data-tab="tab2"><a href="#tab2">메인강사등록</a></li>
        <li data-tab="tab3"><a href="#tab3">교육 시설 안내</a></li>
        <li data-tab="tab4"><a href="#tab4">Travel</a></li>
    </ul>
            <form name="joinForm" action="/member/acajoin" method="post">   
               <div class="row gtr-uniform">
                     <div class="col-6 col-12-small" style="margin:0 auto;">
                     <br><br>
                      <header class="major">
				         	<h2>메인 강사 등록</h2>
				      </header>
                     <br>
                        <label>강사 이름</label>
                           <input type="text" maxlength="12" name="aname" value="" required>
                           <p id="Academy_text"></p>
                        <label>나이</label>
                          <input type="text" maxlength="12" name="aname" value="" required>
                          <br>
                        <label>성별</label>
                          <input type="text" maxlength="12" name="aname" value="" required>
                          <br>
                        <label>강사 사진</label>
                           <input type='file' id='teacher_Photo' name='teacher_Photo'>
                          <br><br>
                        <label>강사 소개</label>
                          <textarea name='teacher_intro' id='teacher_intro' rows='5' style='resize:none;' placeholder='선생님 소개 입력'></textarea>

                      </div>
                  </div>
                  <!-- 강사 추가 1번 -->
                  <div class="row gtr-uniform">
                     <div class="col-6 col-12-small" style="margin:0 auto;">
                     <br><br>
                     <h2>2번 강사</h2><br>
                        <label>강사 이름</label>
                           <input type="text" maxlength="12" name="aname" value="" required>
                           <p id="Academy_text"></p>
                        <label>나이</label>
                          <input type="text" maxlength="12" name="aname" value="" required>
                          <br>
                        <label>성별</label>
                          <input type="text" maxlength="12" name="aname" value="" required>
                          <br>
                        <label>강사 사진</label>
                           <input type='file' id='teacher_Photo' name='teacher_Photo'>
                          <br><br>
                        <label>강사 소개</label>
                          <textarea name='teacher_intro' id='teacher_intro' rows='5' style='resize:none;' placeholder='선생님 소개 입력'></textarea>

                      </div>
                      
                  </div><br><br>
                  <ul class="actions">
                        <li style="margin:0 auto;">
                           <input type="submit" value="등록하기" class="primary"/>&nbsp;&nbsp;
                           <!-- <a href="javascript:formSubmit()" id="joinSubmit">회원가입</a>&nbsp;&nbsp; -->
                           <input type="reset" value="강사 추가" id="joinReset" onClick="location.href='javascript:joinForm.reset()'"/>
                                <!-- <a href="javascript:joinForm.reset()">다시작성</a>&nbsp;&nbsp; -->
                        </li>
                     </ul>
                     </form>
                     </div>
                     </article>
                     </div>
               </section>
               
      <section class="wrapper style1">
      <div class="container">
     
      <!-- Join -->
         <article id = "AcademyUpload">
         <div id="tab3" class="tabcontent current">
               <ul class="tab">
        <li class="current" data-tab="tab1"><a href="#">학원소개등록</a></li>
        <li data-tab="tab2"><a href="#tab2">메인강사등록</a></li>
        <li data-tab="tab3"><a href="#tab3">교육 시설 안내</a></li>
        <li data-tab="tab4"><a href="#tab4">Travel</a></li>
    </ul>
            <form name="joinForm" action="/member/acajoin" method="post">   
               <div class="row gtr-uniform">
                     <div class="col-6 col-12-small" style="margin:0 auto;">
                     <br><br>
                           <header class="major">
					         <h2>교육 시설 안내</h2>
					      </header><br>
                        <h3>학원 시설 사진 (추가 할 사진을 한번에 넣어주세요)</h3><br>
                           <input multiple="multiple" type="file" name="file" />&nbsp;
                           <p id="Academy_text"></p>
<br><br><br>
                     <ul class="actions">
                        <li style="margin:0 auto;">
                           <input type="submit" value="가입하기" class="primary"/><br>

                        </li>
                     </ul>
                  </div>
                  </div>
                     </form>
                     </div>
                     </article>
                     </div>
               </section>


      
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!-- Footer -->
<%@ include file = "../../footer.jsp" %>

<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
   function check_number_write(){
      console.log(document.getElementById("check_number").readonly);
      document.getElementById("check_number").readOnly = false;
   }
/*    function addTeacher(){
      var list = document.getElementById("teacher")
      list.innerHTML = list.innerHTML + "<hr><li>선생님 이름<br><input type='text'/></li><br>선생님 사진<br><input type='file' id='teacherPhoto2' name='teacherPhoto2'></br><br>경력사항<br><textarea name='facility_intro2' id='facility_intro2' rows='6' style='resize:none;' placeholder='경력사항 입력'></textarea><br><br>선생님 소개<br><textarea name='facility_intro3' id='facility_intro3' rows='6' style='resize:none;' placeholder='선생님 소개'></textarea><br><br>영상 업로드<br><input type='file' id='teacherVideo' name='teacherVideo'><br>"
   } */
   
   
function checkInput(sel,item){
    if($(sel).val().trim().length == 0){
        alert(item + ' 입력하세요');
        $(sel).focus();
        return false;
    }
    return true;
    
}
/* 선생님 이름 제한 */
$(document).ready(function(){ 
   $('#teacher_text').keyup(function(){ 
      if ($(this).val().length > $(this).attr('maxlength')) {
         alert('제한 길이 초과');
         $(this).val($(this).val().substr(0, $(this).attr('maxlength'))); }
      });
   });





   
//버튼 숨기기
//계획삭제


      $(function() {
           $('ul.tab li').click(function() {
               var activeTab = $(this).attr('data-tab');
               $('ul.tab li').removeClass('current');
               $('.tabcontent').removeClass('current');
               $(this).addClass('current');
               $('#' + activeTab).addClass('current');
           })
       });
</script>

<script>
function t_block1(){
   teacher1.style.display="block";
   $("#teacher_name2").focus()
}
function t_none1(){
   teacher1.style.display="none";
}

function t_block2(){
   teacher2.style.display="block";
   $("#teacher_name3").focus()
}
function t_none2(){
   teacher2.style.display="none";
}

function t_block3(){
   teacher3.style.display="block";
   $("#teacher_name4").focus()
}
function t_none3(){
   teacher3.style.display="none";
}

function t_block4(){
   teacher4.style.display="block";
   $("#teacher_name5").focus()
}
function t_none4(){
   teacher4.style.display="none";
}

function t_block5(){
   teacher5.style.display="block";
   $("#teacher_name6").focus()
}
function t_none5(){
   teacher5.style.display="none";
}

function t_block6(){
   teacher6.style.display="block";
   $("#teacher_name7").focus()
}
function t_none6(){
   teacher6.style.display="none";
}

function t_block7(){
   teacher7.style.display="block";
   $("#teacher_name8").focus()
}
function t_none7(){
   teacher7.style.display="none";
}

function t_block8(){
   teacher8.style.display="block";
   $("#teacher_name9").focus()
}
function t_none8(){
   teacher8.style.display="none";
}

function t_block9(){
   teacher9.style.display="block";
   $("#teacher_name10").focus()
}
function t_none9(){
   teacher9.style.display="none";
}

</script>