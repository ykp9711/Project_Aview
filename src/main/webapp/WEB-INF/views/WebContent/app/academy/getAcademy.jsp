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
              <c:choose>
              <c:when test="${student eq 'student'}">
				<form name="insertReivew" action="/board/insertReview" method="post">
               <table>
               <tr>
               	<td style="width:90%; ">
               	<input type="hidden" name="ano" value="${ano}">
               	<input type="text" maxlength="12" id= "writer" name="writer" value="${session_id}" readonly="readonly" placeholder="작성자"required><br>
                <textarea id="content" name="content" placeholder="리뷰"></textarea></td>
               	<td style="margin: auto;"><input type="submit" value="등록" class="primary"/></td>
               </tr>
               </table>
               </form>
			</c:when>
			<c:otherwise>
				<p style="text-align: center; color: black;">리뷰를 작성하려면 로그인을 해주세요.</p>
			</c:otherwise>
			</c:choose>
               <c:forEach var="review" items="${review}">
               <div id ="reviewReply"> 
<ul  style="list-style: none;">
<li style="width: 100%;">  ${review.writer}   <span style="float:right;">${review.regDate}</span></li> 
<li><span style="color: black;">${review.content} </span></li>  

<c:if test="${review.writer eq session_id}">  
<li style="resize:none; vertical-align : bottom; text-align:right;" ><a href="javascript:void(0)" onclick="modify(this)" data-rno="${review.rno}"  >[수정]</a> / <a href="/board/removeReview?rno=${review.rno}" class="delete">삭제</a></li>
</c:if>
</ul>
</div>
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
   
   function modify(obj){
	   console.log($(obj).attr("data-rno"));
	   
		var data = {rno : $(obj).attr("data-rno")} 

		$.ajax({ type : "POST",
			url : "/board/modifyReview",
			data : data,
			async:false,
			success : function(data){ 
				
				console.log(data.writer)
				var writer = data.writer

				 $(obj).parent().parent().parent().append("<form name='updateReivew' action='/board/updateReview' method='post'><table><tr><td style='width:90%; ''> <input type='hidden' name='ano' value='${ano}''><input type='hidden' name='rno' value='"+$(obj).attr("data-rno")+"'><input type='text' maxlength='12' id= 'writer' name='writer' value='${session_id}' readonly='readonly' placeholder='작성자'required><br><textarea id='content2' name='content2'></textarea></td><td style='margin: auto;'><input type='submit' value='수정' class='primary'/></td></tr></table></form>");
			$("#content2").val(data.content)
			}// success 종료

		}); // ajax 종료
	   $(obj).parent().parent().hide(); // ul까지 
	   
	   const html = '<br/>연락처 : <input type="text" value="" name="tel" />';
       
      
   }
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
   <script>

   </script>
   
   

   
</body>
</html>
<%@ include file = "../../footer.jsp" %>