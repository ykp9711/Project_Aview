<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Drift by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>Academy reView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" type="text/css" href="/resources/assets/css/YouTubePopUp.css">
	</head>
	<body class="landing is-preload">

		<!-- Header -->
			<%@ include file="header.jsp" %>

		<!-- Banner -->
		
			<section id="banner">
						 <div class="fo" style="">
			<p style="margin:0 auto">다니고싶은 학원이있으신가요?</p>
					<h2>Aview에서 카테고리별 검색기능을 활용해보세요!</h2>
					<p style="font-size:100%;">학원소개페이지에서 학원을 체험해보세요.</p>
					<br>
					<br>
					<br>
					<br>
					
										
				</div>
 				<div class="inner" style="margin-top:100px;"> 
					<ul class="actions special">
						<li><a href="" class="button primary">학원 알아보기</a></li>
					</ul>
					<br>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style1">
 				<div class="container">
					<header class="major">				
						<h2>한국은 재활용 강국일까요?</h2>
						<p style="font-size:90%">
						실제로 재활용되는 분리수거 쓰레기 비율이 <strong>30%</strong>라고 합니다.
						<br>
						경제협력개발기구(OECD)의 2013년 조사에 따르면,
						<br>
						한국의 전체 쓰레기 대비 재활용되거나 수거된 비율은 59%로 독일(65%)에 이어 세계 2위였습니다.
						<br> 
						그럼에도 불구하고 애초에 재활용이 어렵게 만들어진 제품이 많은 탓에
						<br>
						분리수거 등을 통해 수거된 쓰레기가 재활용되지 못하고 소각·매립되고 있습니다.
						<br>
						</p>
						<p>
						<strong>ReturnCycle과 함께 새로운 재활용 트렌드를 만들어 주세요.</strong>
						<br>
						</p>
						</header>
						</div>
						
					<div class="slider" style = "padding-bottom:5%;">
						<span class="nav-previous"></span>
						<div class="viewer" style="margin:0 auto;">
							<div class="reel">
								<div class = "slide">
								<iframe width="100%" height="100%" src="https://www.youtube.com/embed/_B_iUs_3x28" style="margin:0 auto;"></iframe>
								</div>
								<div class = "slide">
								<iframe width="100%" height="100%" src="https://www.youtube.com/embed/8_43WaXan1s" style="margin:0 auto;"></iframe>
								</div>
							</div>
						</div>
						<span class="nav-next"></span>
					</div>
			</section>
		
			

		<!-- Footer -->
			<%@ include file = "footer.jsp" %>
			
	
	<script type="text/javascript" src="/resources/assets/js/YouTubePopUp.jquery.js"></script>
	<script type="text/javascript">
	
		//유투브 팝업 스크립트
		jQuery(function(){
			jQuery("a.bla-1").YouTubePopUp();
			jQuery("a.bla-2").YouTubePopUp( { autoplay: 0 } ); // Disable autoplay
		});
	
	</script>
	</body>
</html>