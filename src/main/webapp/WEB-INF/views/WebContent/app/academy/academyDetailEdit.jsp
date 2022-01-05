<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<style>
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
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
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	background-color: #f7f7f7;
	padding: 6px 12px;
	color: #fff;
}
ul.tab li.current {
	background-color: rgb(0, 154, 200);
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
#facility1, #facility2, #facility3, #facility4, #facility5 {
	position: relative;
	left: 0;
	top: 0;
	z-index: 3;
	visibility: hidden;
}
</style>
<head>
<title>Academy Board</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="../../../../../resources/assets/css/main.css" />
</head>

<!-- Header -->
<body class="is-preload">
<!-- Header -->
	   <%@ include file="../../header.jsp"%>



	<!-- Main -->


	<ul class="tab">
		<li class="current" data-tab="tab1"><a href="#">학원소개등록</a></li>
		<li data-tab="tab2"><a href="#">메인강사등록</a></li>
		<li data-tab="tab3"><a href="#">교육 시설 안내</a></li>
	</ul>
	<form name="joinForm" action="/board/register" method="post" 
		enctype="multipart/form-data">
		<div id="tab1" class="tabcontent current">
			<div class="row gtr-uniform" style="color: black;">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<br> <br>
					<header class="major">
						<h2>학원 등록</h2>
					</header>
					<div id="wrapper style1">
						<!-- Main -->
						<div id="main" class="container">
							<div class="row">
								<!-- Post -->

								<div style="width: 70%;">
									<article class="post" style="margin-left: -30%;">
										<div style="width: 30%; height: 5%; float: left;">
											<label for="hint">지역</label> <select name="academyArea"
												id="academyArea" required>
												<option value="전국" style="color: black">전국</option>
												<option value='서울특별시' style="color: black">서울특별시</option>
												<option value='광주광역시' style="color: black">광주광역시</option>
												<option value='대구광역시' style="color: black">대구광역시</option>
												<option value='대전광역시' style="color: black">대전광역시</option>
												<option value='부산광역시' style="color: black">부산광역시</option>
												<option value='울산광역시' style="color: black">울산광역시</option>
												<option value='인천광역시' style="color: black">인천광역시</option>
												<option value='세종특별자치시' style="color: black">세종특별자치시</option>
												<option value='강원도' style="color: black">강원도</option>
												<option value='경기도' style="color: black">경기도</option>
												<option value='경상남도' style="color: black">경상남도</option>
												<option value='경상북도' style="color: black">경상북도</option>
												<option value='전라남도' style="color: black">전라남도</option>
												<option value='전라북도' style="color: black">전라북도</option>
												<option value='제주특별자치도' style="color: black">제주특별자치도</option>
												<option value='충청남도' style="color: black">충청남도</option>
												<option value='충청북도' style="color: black">충청북도</option>
											</select>
										</div>
										<div
											style="width: 30%; height: 5%; float: left; margin-left: 2%;">
											<label for="hint">학원 카테고리</label> <select name="academyKind"
												id="academyKind" required>
												<option value="no">학원 카테고리</option>
												<option value="IT자격증">IT자격증</option>
												<option value='실무'>실무실행</option>
												<option value='어학원'>어학원</option>
												<option value='등등1'>등등1</option>
												<option value='등등2'>등등2</option>
												<option value='등등3'>등등3</option>
												<option value='등등4'>등등4</option>
											</select>
										</div>
										<br>
										<header>
											<div class="title">
												<label>게시글 제목</label> <input type="text" maxlength="20"
													name="academyTitle" id="academyTitle" value="" required>
												<br> <label>게시글 목록 사진(썸네일)</label> <input type='file'
													name="file" id="file"><br>
												<br>
												<div class="select_img">
													<img src="" />
												</div>
											</div>
											<div class="meta">
												<time class="published">
													<%-- ${board.regDate} --%>
												</time>
												<label style="float: left;">학원 이름</label> <span class="name">
													<input type="text" maxlength="12" name="academyName"
													id="academyName" value="" required>
												</span>
											</div>
										</header>
										<div style="width: 750px; word-break: break-all;">
											<label for="pw2">학원 소개 영상 유튜브 링크</label> <input type="text"
												name="academyYoutube" id="academyYoutube" value="">
											<br> <label>학원 상세 설명</label>
											<textarea name="academyContent" id="academyContent" rows="6"
												style="resize: none;" placeholder="학원 상세 설명"></textarea>
											<br> <label>학원 태그(검색어로 사용됩니다.)</label> <input
												type="text" maxlength="12" name="academyTag" id="academyTag"
												value="" >
										</div>
										<br>
										<hr>
										<h4>지점 상세 위치</h4><br>
												
											<label for ="postal_code">우편번호</label>
														<div class="row gtr-uniform">
															<div class="col-6 col-12-small">
																<input type="text" name="acaZipcode" id="acaZipcode" value="" readonly="readonly" required>
															</div>	
					 										 <div class="col-6 col-12-small">	
																<input type="button" name="findZipcode" id="findZipcode" value="우편번호 찾기" readonly="readonly" style="display: inline;">
														</div>
													</div>		
											<br>		
												<label for ="address">주소</label>
													<input type="text" name="acaAddress" id="acaAddress" value="" readonly="readonly" required>
											<br>
												<label for ="detail_address">상세주소</label>
													<input type="text" name="acaAddressDetail" id="acaAddressDetail" value=""required placeholder="자세하게 작성해주세요.">
													<br>
											
											</article>

								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div id="tab3" class="tabcontent">

			<div class="row gtr-uniform">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<br> <br>
					<header class="major">
						<h2>교육 시설 안내</h2>
					</header>
					<br>
					<h3>학원 시설 사진 (추가 할 사진을 한번에 넣어주세요)</h3>
					<br> <input multiple="multiple" type="file" name="acaPhoto" />&nbsp;
					<br> <br> <br>
					<ul class="actions">
						<li style="margin: 0 auto;"><button id="formSubmit" 
							class="button primary" style="background:#62BD83; color: white;">게시글 등록</button><br></li>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 강사등록   -->
	<div id="tab2" class="tabcontent">
			<div class="row gtr-uniform" style="color: black;">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<br> <br>
					<header class="major">
						<h2>강사 등록</h2>
					</header>
					<div id="wrapper style1">
						<div id="main" class="container">
							<div class="row">
								<div style="width: 70%;">
									<article class="post" style="margin-left: -30%;">
										<label>강사 이름</label> <input type="text" maxlength="12"	name="name1">
										 <br>
										 <label for="hint">성별</label> <select name="gender1">
											<option value="성별" style="color: black">성별</option>
											<option value="남성" style="color: black">남성</option>
											<option value="여성" style="color: black">여성</option>
										</select> <br> 
										<label>강사 사진</label>
										 <input type="file" name="teacherPhoto1">
										<br> <br>
										<div class="select_img2">
											<img src="" />
										</div>
										<br>
										 <label>강사 소개</label>
										<textarea name='intro1' rows='5' style='resize: none;'placeholder='선생님 소개 입력'></textarea>
										<hr>
										<p>
											✔ 강사는 최대 8명까지 등록 가능합니다.<br>
										<ul class="actions">
											<li style="margin: 0 auto;"><input type="button" value="강사 추가" class="primary" onClick="t_block1()" />&nbsp;&nbsp;</li>
										</ul>
									</article>
							<!-- 2번 강사 -->

							<div ID='teacher1' style="display: none;">

							<article class="post" style="margin-left: -30%;">
																					<h3>2번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="name2">
							 <br> 
							<label for="hint">성별</label> 
							 <select name="gender2">
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'name="teacherPhoto2"> <br>
							<br><div class="select_img3"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="intro2" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="button" value="강사 추가" class="primary" onClick="t_block2()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" class="button" onclick="t_none1()"/> 
								</li>
							</ul>
							</article>
							</div>
							<!-- 3번 강사 -->
							<div ID='teacher2' style="display: none;">
							<article class="post" style="margin-left: -30%;">
							<h3>3번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="name3" id="name3" value="">
							 <br> 
							<label for="hint">성별</label> 
							 <select name="gender3" id="gender3">
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file' name="teacherPhoto3"> <br>
								<br><div class="select_img4"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="intro3" id="intro3" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																																			
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="button" value="강사 추가" class="primary" onClick="t_block3()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" class="button" onclick="t_none2()"/> 
								</li>
							</ul>
							</article>
							</div>
							<!-- 4번 강사 -->
							<div ID='teacher3' style="display: none;">
							<article class="post" style="margin-left: -30%;">
							<h3>4번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" name="name4" >
							 <br> 
							<label for="hint">성별</label> 
							 <select name="gender4">
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file' name="teacherPhoto4"> <br>
								<br><div class="select_img5"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="intro4" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.</p><br>
																																			
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="button" class="primary" value="강사 추가" onClick="t_block4()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" class="button" onclick="t_none3()"/> 
								</li>
							</ul>
							</article>
							</div>		
							<!-- 5번 강사 -->
							<div ID='teacher4' style="display: none;">
							<article class="post" style="margin-left: -30%;">
							<h3>5번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" name="name5" >
							 <br> 
							<label for="hint">성별</label> 
							 <select name="gender5">
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file' name="teacherPhoto5"> <br>
								<br><div class="select_img6"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="intro5" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																																			
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="button" class="primary"  value="강사 추가" onClick="t_block5()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" class="button" onclick="t_none4()"/> 
								</li>
							</ul>
							</article>
							</div>	
							
							<!-- 6번 강사 -->
							<div ID='teacher5' style="display: none;">
							<article class="post" style="margin-left: -30%;">
							<h3>6번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"name="name6" >
						 <br> 
							<label for="hint">성별</label> 
							 <select name="gender6">
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file' name="teacherPhoto6"> <br>
								<br><div class="select_img7"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="intro6" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																																			
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="button" class="primary" value="강사 추가" onClick="t_block6()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" class="button" onclick="t_none5()"/> 
								</li>
							</ul>
							</article>
							</div>																
							<!-- 7번 강사 -->
							<div ID='teacher6' style="display: none;">
							<article class="post" style="margin-left: -30%;">
							<h3>7번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" name="name7" >
<br> 
							<label for="hint">성별</label> 
							 <select name="gender7">
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file' name="teacherPhoto7"> <br>
								<br><div class="select_img8"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="intro7" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																																			
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="button" class="primary" value="강사 추가" onClick="t_block7()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" class="button" onclick="t_none6()"/> 
								</li>
							</ul>
							</article>
							</div>												

							<!-- 8번 강사 -->
							<div ID='teacher7' style="display: none;">
							<article class="post" style="margin-left: -30%;">
							<h3>8번 강사</h3><hr>
									<label>강사 이름</label> <input type="text" name="name8" >
									
									<label for="hint">성별</label> 
							 <select name="gender8">
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file' name="teacherPhoto8"> <br>
								<br><div class="select_img9"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="intro8" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																																			
														<ul class="actions">
								<li style="margin: 0 auto;">
								
								<input type="button" value="삭제하기" class="button" onclick="t_none7()"/> 
								</li>
							</ul>
							</article>
							</div>													
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>

	</div>
	</form>



	<!-- Footer  -->
	<footer id="footer"> </footer>

	<!-- Scripts -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>


	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<script>
		function check_number_write() {
			console.log(document.getElementById("check_number").readonly);
			document.getElementById("check_number").readOnly = false;
		}
		function checkInput(sel, item) {
			if ($(sel).val().trim().length == 0) {
				alert(item + ' 입력하세요');
				$(sel).focus();
				return false;
			}
			return true;
		}
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
		function t_block1() {
			teacher1.style.display = "block";
			$("input[name=name2]").focus();
		}
		function t_none1() {
			teacher1.style.display = "none";
		}
		function t_block2() {
			teacher2.style.display = "block";
			$("input[name=name3]").focus();
		}
		function t_none2() {
			teacher2.style.display = "none";
		}
		function t_block3() {
			teacher3.style.display = "block";
			$("input[name=name4]").focus();
		}
		function t_none3() {
			teacher3.style.display = "none";
		}
		function t_block4() {
			teacher4.style.display = "block";
			$("input[name=name5]").focus();
		}
		function t_none4() {
			teacher4.style.display = "none";
		}
		function t_block5() {
			teacher5.style.display = "block";
			$("input[name=name6]").focus();
		}
		function t_none5() {
			teacher5.style.display = "none";
		}
		function t_block6() {
			teacher6.style.display = "block";
			$("input[name=name7]").focus();
		}
		function t_none6() {
			teacher6.style.display = "none";
		}
		function t_block7() {
			teacher7.style.display = "block";
			$("input[name=name8]").focus();
		}
		function t_none7() {
			teacher7.style.display = "none";
		}
		function t_block8() {
			teacher8.style.display = "block";
			$("#name9").focus()
		}
		function t_none8() {
			teacher8.style.display = "none";
		}
		function t_block9() {
			teacher9.style.display = "block";
			$("#teacher_name10").focus()
		}
		function t_none9() {
			teacher9.style.display = "none";
		}
	</script>
	<script>
		//썸네일 스크립트 학원 사진
		$("#file")
				.change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
		//썸네일 스크립트 강사 사진 1~8
		$("#teacherPhoto1").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img2 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		$("#teacherPhoto2").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img3 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		$("#teacherPhoto3").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img4 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		$("#teacherPhoto4").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img5 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		$("#teacherPhoto5").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img6 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		$("#teacherPhoto6").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img7 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		$("#teacherPhoto7").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img8 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		$("#teacherPhoto8").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img9 img").attr("src",
									data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
	</script>

	<script>
		$("#formSubmit").on("click", function(e) {
			e.preventDefault();
			var youtube = $("#academyYoutube").val();
				if(youtube =="" || youtube==null){
					$("#academyYoutube").val("null");
				}
			

			joinForm.submit();
			
		})
	</script>
	
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
			 $("#findZipcode").click(function(){
		         new daum.Postcode({
		            oncomplete:function(data) {
		               jQuery("#acaZipcode").val(data.zonecode);
		               jQuery("#acaAddress").val(data.address);
		               jQuery("#acaAddressDetail").focus();
		            }
		         }).open();
		      });
		      </script>
</body>
</html>