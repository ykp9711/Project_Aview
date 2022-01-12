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
                        <li><a href="/board/Teacher?ano=${board.ano}" class="button large">강사 소개</a></li>
                        <li><a href="/board/getFacility?ano=${board.ano}" class="button large">시설 소개</a></li>
                        <li><a href="javascript:void(0)" class="button large review">학원 리뷰</a></li>
                      </ul>
                      </div>
                    </div>
                  </footer>
               <div id="reviewBoard" style="display: none;">
               <hr>
               <table>
               <tr>
               	<td style="width:90%; ">
               	작성자 db 넣기
               	<textarea></textarea></td>
               	<td style="margin: auto;">등록버튼</td>
               </tr>
               </table>
               <c:forEach var="review" items="${review}">
<ul style="list-style: none;">
<li style="width: 100%;">  ${review.writer}   <span style="float:right;">${review.regDate}</span></li> 
<li><span style="color: black;">${review.content} </span></li>    
<li style="resize:none; vertical-align : bottom; text-align:right;" ><a href="/board/ModifyReview">리뷰 수정/삭제</a></li>
</ul>
<hr>
</c:forEach>
               
               </div>
               </article>
               <hr>
               <c:if test="${null ne board.acaAddress}">
               <h4>상세 지도</h4>
             <div id="map" style="width:100%;height:350px;"></div>
            </c:if>
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
   
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f818e5b6f4164025b1222bdedc3d0ac7&libraries=services"></script> 
   <!-- 자신 지도 java API -->
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
   
   <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다

geocoder.addressSearch('${board.acaAddress}'+' ${board.acaAddressDetail}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${board.acaAddress} ${board.acaAddressDetail}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

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
   
   <script>
  
   $(".review").on("click", function(e){
	   e.preventDefault();
	   $("#reviewBoard").css('display','block');
   })
   
   </script>
</body>
</html>
<%@ include file = "../../footer.jsp" %>