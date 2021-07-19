<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
   Visualize by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
   <head>
      <title>맞춤 학원 찾기</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
   </head>
   <body class="is-preload">
      <c:set var="list" value="${requestScope.boardList}"/>
      <c:set var="nowPage" value="${requestScope.nowPage}"/>
      <c:set var="startPage" value="${requestScope.startPage}"/>
      <c:set var="endPage" value="${requestScope.endPage}"/>
      <c:set var="totalCnt" value="${requestScope.totalCnt}"/>
      <c:set var="realEndPage" value="${requestScope.realEndPage}"/>

      <!-- Nav -->
         <nav id="menu">
            <ul class="links">
            <c:if test="${not empty session_id}">
            ${session_id} 님 환영합니다.
            </c:if>
         <li><a href="main.jsp">메인화면</a></li>
               <c:if test="${empty session_id}">
               <li><a href="login.jsp">로그인</a></li>
               </c:if>
               <c:if test="${not empty session_id}">
               <li><a href="${pageContext.request.contextPath}/student/MemberLogOut.st">로그아웃</a></li>
               </c:if>
               
               <li><a href="${pageContext.request.contextPath}/board/SearchList.bo">맞춤 학원 찾기</a></li>
               <li><a href="review.jsp">리뷰게시판</a></li>
            </ul>
         </nav>
               

      <!-- CTA -->
         <div id="cta">
            <div class="wrapper style1">
               <div class="inner">
                  <header class="heading small">
                     <h2>학원 검색</h2>
                  <form name ="keyword"method="get" action="${pageContext.request.contextPath}/board/SearchResultOk.bo"class="combined" >
                  <div class="col-3">
                  
                  <select name="region"  style="font-size:15px;margin-left:90px; width: 200px; height:50px; border-top-right-radius:0px; border-bottom-left-radius:0rem;     border-top-left-radius:0rem">
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
                                       </div>
                  <div class="col-3">
                  
                                       <select name="kind" id="kind" style="font-size:15px;width: 200px; height:50px; border-top-right-radius:0px; border-bottom-left-radius:0rem;     border-top-left-radius:0rem">
                                          <option value="no" style="color:black"> 학원 카테고리  </option>
                                          <option value="IT자격증" style="color:black">IT자격증</option>
                                          <option value='실무' style="color:black">실무실행</option>
                                          <option value='어학원' style="color:black">어학원</option>
                                          <option value='등등1' style="color:black">등등1</option>
                                          <option value='등등2' style="color:black">등등2</option>
                                          <option value='등등3' style="color:black">등등3</option>
                                          <option value='등등4' style="color:black">등등4</option>
                                          <option value='등등5' style="color:black">등등5</option>
                                          <option value='등등6' style="color:black">등등6</option>
                                          <option value='등등7' style="color:black">등등7</option>
                                          <option value='등등8' style="color:black">등등8</option>
                                          <option value='등등9' style="color:black">등등9</option>
                                       </select>
                                       </div>
                  
                  
                     <input type="text" name="search" id="search" placeholder="학원 이름" class="invert"style="width : 50rem; margin-top:70px;margin-left:-500px; "  />
                     <input type="button" class="special" value="검색"style="margin-top:70px; margin-right:-100px;" onclick="send()" />
                     
                  </form>
               </div>
            </div>
         </div>
         
         
      <!-- Main -->
         <div id="main">
            <div class="inner">
               <p>
               <h3>등록된 모든 학원</h3>
               
            
                     <div class="col-6 col-12-medium"></div>
                  </div>
               
               </p>
               
               <div class="box">
               <table style="cursor:pointer">
                              <c:choose>
            <c:when test="${list != null and fn:length(list) > 0}">
               <c:forEach var="b_bean" items="${list}">
                                 <p>
                                    <tr>
                                       <td style="width:20px" rowspan="2">
                                       
                                          <br><img src="${pageContext.request.contextPath}/images/${b_bean.getBoard_photo()}" width="200" height="150" align="middle" style="margin-top:-30px">
                                       </td>
                                       <td style=" background-color:#FAFAFA;">
                                       ${b_bean.getBoard_title()} 
                                       </td>
                                       <td width = "150px" rowspan="2" style=" background-color:white; text-align:center;">
                                       <br>지역 : ${b_bean.getBoard_region()}<br>
                                          분야 : ${b_bean.getBoard_kind()}
                                       </td>
                                       <td width = "40"  rowspan="2" style="background-color:white";>
                                          <a href="${pageContext.request.contextPath}/board/BoardView.bo?seq=${b_bean.getBoard_num()}" class="button small">상세보기로 이동</a>
                                          <br><br><a href="http://www.koreaisacademy.com/" class="button small">홈페이지로 이동</a>
                                          
                                       </td>
                                    </tr>
                                    <tr>
                                       <td height="5px" style=" color:#58FAD0;background-color:#FAFAFA;">${b_bean.getBoard_tag()}</td>
                                    </tr>
                                    
                                    
                                 </c:forEach>
                                 </c:when>
                                 <c:otherwise>
                                 <td colspan="5" align="center">등록된 게시물이 없습니다.</td>
                                 </c:otherwise>
                                 </c:choose>   
                                    </table>
                                    
                                    
                                    
                                 <table border="0" cellpadding="0" cellspacing="0" width="900px">
            <tr align="center" valign="middle">
               <td>
               <c:choose>
                  <c:when test="${nowPage > 1}">
                     <a href="${pageContext.request.contextPath}/board/SearchList.bo?page=${nowPage - 1}">[이전]</a>&nbsp;
                  </c:when>
               </c:choose>
               <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <c:choose>
                     <c:when test="${i eq nowPage}">
                        [${i}]&nbsp;
                     </c:when>
                     <c:otherwise>
                        <a href="${pageContext.request.contextPath}/board/SearchList.bo?page=${i}">${i}&nbsp;</a>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
               <c:choose>
                  <c:when test="${nowPage != realEndPage}">
                     <a href="${pageContext.request.contextPath}/board/SearchList.bo?page=${nowPage + 1}">[다음]</a>&nbsp;
                  </c:when>
               </c:choose>
               </td>
            </tr>
         </table>
                                 </p>
               </div>
            </div>
         </div>      
            
         
         
<%@ include file="../../footer.jsp"%>
                        


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
   function send(){
      var form = document.keyword
      var sel = document.getElementById("kind");
      var val = kind.options[kind.selectedIndex].value;
      if(val == "no"){
         alert('학원분야를 선택해주세요')
      }else
         form.submit()
   }
   </script>
</html>