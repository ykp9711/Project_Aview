<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<!--
	Drift by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>Aview_Facility</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<style>
/* 폰트 적용 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

html {
    font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body, ul, li, h1, h2, h3, h4, h5 {
    margin:0;
    padding:0;
    list-style:none;
}

a {
    color:inherit;
    text-decoration:none;
}

/* 커스텀 */

/* 슬라이더 1 시작 */
.slider-1 {
    height:400px;
    position:relative;
}

/* 슬라이더 1 - 페이지 버튼 */
.slider-1 > .page-btns {
    text-align:center;
    position:absolute;
    bottom:20px;
    left:0;
    width:100%;
}

.slider-1 > .page-btns > div {
    width:20px;
    height:20px;
    background-color:rgba(255,255,255,.5);
    border-radius:4px;
    display:inline-block;
    cursor:pointer;
}

.slider-1 > .page-btns > div.active {
    background-color:rgba(255,255,255,1);
}

/* 슬라이더 1 - 슬라이드 */

.slider-1 > .slides > div {
    position:absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    opacity:0;
    transition: opacity 0.3s;
    background-position:center;
    background-size:cover;
    background-repeat:no-repeat;
}

.slider-1 > .slides > div.active {
    opacity:1;
}

/* 슬라이더 좌우 버튼 */
.slider-1 > .side-btns > div {
    position:absolute;
    top:0;
    left:0;
    width:25%;
    height:100%;
    cursor:pointer;
}
.slider-1 > .side-btns > div:last-child {
    left:auto;
    right:0;
}
.slider-1 >.side-btns > div > span {
    position:absolute;
    top:50%;
    left:20px;
    transform:translatey(-50%);
    background-color:white;
    opacity:0.5;
    padding:1px 13px;
    border-radius:50px;
    font-size:25px;
}
.slider-1 >.side-btns > div:last-child > span {
    left:auto;
    right:20px;
}

/* 슬라이더 1 끝 */
</style>
<body>
<!-- Header -->
	   <%@ include file="../../header.jsp"%>
	   

	

	<!-- Main -->
	<section id="three" class="wrapper style1">
		<header class="major">
			<h2>학원 시설</h2>
		</header>
		<div id="main" class="container">
									<div class="row">
										<!-- Post -->

										<div style="width: 70%;">
<div class="container">

				<div class="col-4 col-6-medium col-12-small">
					<article class="box post" style="width : 80%;">
					


	<div class="slider-1">
    <div class="slides">
    <c:forEach var="board" items="${board}">
    <c:choose>
    <c:when test="${board.photo ne 'noPhoto.jpg'}">
        <div class="active" style="background-image:url(/resources/FileImage/${board.photo});"></div>
        </c:when>
        <c:otherwise>
        	등록된 시설 사진이 없습니다.
        </c:otherwise>
        </c:choose>
       </c:forEach>
        </div>
    <div class="page-btns">
    <c:forEach var="board" items="${board}">
        <div></div>        
	</c:forEach>

    </div>
    <div class="side-btns">
        <div>
            <span><i class="fas fa-angle-left"></i></span>
        </div>
        <div>
            <span><i class="fas fa-angle-right"></i></span>
        </div>
    </div>
</div>


				
				</article>
				</div>
				</div>
				</div>
				</div>
				</div>
				</section>
					
</body>
			
	<!-- Scripts -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
console.clear();

//기존 버튼형 슬라이더
$('.slider-1 > .page-btns > div').click(function(){
 var $this = $(this);
 var index = $this.index();
 
 $this.addClass('active');
 $this.siblings('.active').removeClass('active');
 
 var $slider = $this.parent().parent();
 
 var $current = $slider.find(' > .slides > div.active');
 
 var $post = $slider.find(' > .slides > div').eq(index);
 
 $current.removeClass('active');
 $post.addClass('active');
});

//좌/우 버튼 추가 슬라이더
$('.slider-1 > .side-btns > div').click(function(){
 var $this = $(this);
 var $slider = $this.closest('.slider-1');
 
 var index = $this.index();
 var isLeft = index == 0;
 
 var $current = $slider.find(' > .page-btns > div.active');
 var $post;
 
 if ( isLeft ){
     $post = $current.prev();
 }
 else {
     $post = $current.next();
 };
 
 if ( $post.length == 0 ){
     if ( isLeft ){
         $post = $slider.find(' > .page-btns > div:last-child');
     }
     else {
         $post = $slider.find(' > .page-btns > div:first-child');
     }
 };
 
 $post.click();
});

setInterval(function(){
 $('.slider-1 > .side-btns > div').eq(1).click();
}, 3000);
</script>


</html>