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
                        <li><a href="facility.jsp" class="button large">학원 리뷰</a></li>
                      </ul>
                      </div>
                    </div>
                  </footer>
               </article>
               <hr>
               <h4>상세 지도</h4>
				 <input type="hidden" value="${board.acaAddressDetail}">
				 <div id="map" style="width:100%;height:350px;"></div>
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
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    }; 
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch('${board.acaAddressDetail}', placesSearchCB);

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
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
</body>
</html>
<%@ include file = "../../footer.jsp" %>