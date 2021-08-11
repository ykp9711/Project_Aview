<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
   Drift by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<!-- Header -->
<%@ include file="../../header.jsp"%>
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
<!-- Main -->

<section class="wrapper style1">
	<div class="container">
		<!-- Join -->
		<article id="AcademyUpload">
			<div id="tab1">
				<ul class="tab">
					<li class="current" data-tab="tab1"><a href="#">학원소개등록</a></li>
					<li data-tab="tab2"><a href="#tab2">메인강사등록</a></li>
					<li data-tab="tab3"><a href="#tab3">교육 시설 안내</a></li>
					<li data-tab="tab4"><a href="#tab4">Travel</a></li>
				</ul>
				<form name="joinForm" action="/board/register" method="post" enctype="multipart/form-data">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-small" style="margin: 0 auto;">
							<br>
							<br>
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
											<div style="width: 30%; height: 5%; float:left;">
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
							<div style="width: 30%; height: 5%; float:left; margin-left:2%;">
							  <label for="hint">학원 카테고리</label> 
							  <select name="academyKind" id="academyKind" st required>
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
														<label>게시글 제목</label> <input type="text" maxlength="12"
															name="academyTitle" id="academyTitle" value="" required>
														<br> <label>게시글 목록 사진(썸네일)</label> <input type='file'
															name="file" id="file"><br><br>
															 <div class="select_img"><img src="" />
													</div></div>
													<div class="meta">
														<time class="published">
															<%-- ${board.regDate} --%>
														</time>
														<label style="float: left;">학원 이름</label> <span
															class="name"> <input type="text" maxlength="12"
															name="academyName" id="academyName" value="" required>
														</span>
													</div>
												</header>
												<div style="width: 750px; word-break: break-all;">
													<label for="pw2">학원 소개 영상 유튜브 링크</label> <input type="text"
														 name="academyYoutube" id="academyYoutube"
														value=""> <br> <label>학원 상세 설명</label>
													<textarea name="academyContent" id="academyContent"
														rows="6" style="resize: none;" placeholder="학원 상세 설명"></textarea>
													<br> <label>학원 태그(검색어로 사용됩니다.)</label> <input type="text"
														maxlength="12" name="academyTag" id="academyTag" value=""
														required>
												</div>
												<br>
												<hr>
																							<h4>지점 상세 지도</h4>
											
											<figure>
												<img src="images/역삼역.JPG" alt="" />
											</figure>
											<label>위치 상세설명</label>
												<input type="text" name="mapDetail" id="mapDetail" width="50%">
											</article>

										</div>
									</div>
								</div>
							</div>
							<ul class="actions">
								<li style="margin: 0 auto;"><input type="submit"
									value="등록하기" class="primary" /> <!-- <a href="javascript:formSubmit()" id="joinSubmit">회원가입</a>&nbsp;&nbsp; -->
									<input type="reset" value="다시작성" id="joinReset"
									onClick="location.href='javascript:joinForm.reset()'" /> <!-- <a href="javascript:joinForm.reset()">다시작성</a>&nbsp;&nbsp; -->
									<%-- <a href="${pageContext.request.contextPath}/member/MemberLogin.me">로그인</a> --%>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</article>
	</div>
</section>

<section class="wrapper style1">
	<div class="container">
		<!-- Join -->
		<article id="AcademyUpload">
			<div id="tab2">
				<ul class="tab">
					<li class="current" data-tab="tab1"><a href="#">학원소개등록</a></li>
					<li data-tab="tab2"><a href="#tab2">메인강사등록</a></li>
					<li data-tab="tab3"><a href="#tab3">교육 시설 안내</a></li>
					<li data-tab="tab4"><a href="#tab4">Travel</a></li>
				</ul>
				<form name="joinForm" action="/board/registerTeacher" method="post" enctype="multipart/form-data">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-small" style="margin: 0 auto;">
							<br>
							<br>
							<header class="major">
								<h2>강사 등록</h2>
							</header>
							<div id="wrapper style1">
								<!-- Main -->
								<div id="main" class="container">
									<div class="row">
										<!-- Post -->

										<div style="width: 70%;">
											<article class="post" style="margin-left: -30%;">
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="tname1" id="tname1" value="" required>
							<p id="Academy_text"></p>
							<label>나이</label> <input type="text" maxlength="12" name="tage1" id="tage1"
								value="" required> <br> 
							<label for="hint">성별</label> 
							 <select name="tsex1" id="tsex1" required>
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'
								id='teacherPhoto1' name='teacherPhoto1'> <br>
							<br><div class="select_img2"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name='teacherIntro1' id='teacherIntro1' rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="reset" value="강사 추가" onClick="t_block1()" />&nbsp;&nbsp;

								</li>
							</ul>
																		</article>
																		
							<!-- 2번 강사 -->

							<div ID='teacher1' style="display: none;">

							<article class="post" style="margin-left: -30%;">
																					<h3>2번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="tname2" id="tname2" value="" required>
							<p id="Academy_text"></p>
							<label>나이</label> <input type="text" maxlength="12" name="tage2" id="tage2"
								value="" required> <br> 
							<label for="hint">성별</label> 
							 <select name="tsex2" id="tsex2" required>
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'
								id="teacherPhoto2" name="teacherPhoto2"> <br>
							<br><div class="select_img3"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="teacherIntro2" id="teacherIntro2" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="reset" value="강사 추가" onClick="t_block2()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" onclick="t_none1()"/> 
								</li>
							</ul>
																		</article>
																		</div>
							<!-- 3번 강사 -->
							<div ID='teacher2' style="display: none;">
							<article class="post" style="margin-left: -30%;">
							<h3>3번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="tname3" id="tname3" value="" required>
							<p id="Academy_text"></p>
							<label>나이</label> <input type="text" maxlength="12" name="tage3" id="tage3"
								value="" required> <br> 
							<label for="hint">성별</label> 
							 <select name="tsex3" id="tsex3" required>
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'
								id="teacherPhoto3" name="teacherPhoto3"> <br>
								<br><div class="select_img4"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="teacherIntro3" id="teacherIntro3" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																																			
														<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="reset" value="강사 추가" onClick="t_block3()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" onclick="t_none2()"/> 
								</li>
							</ul>
																		</article>
																		</div>
																		
							<!-- 4번 강사 -->
							<div ID='teacher3' style="display: none;">
							<article class="post" style="margin-left: -30%;">
							<h3>4번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="tname4" id="tname4" value="" required>
							<p id="Academy_text"></p>
							<label>나이</label> <input type="text" maxlength="12" name="tage4" id="tage4"
								value="" required> <br> 
							<label for="hint">성별</label> 
							 <select name="tsex4" id="tsex4" required>
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'
								id="teacherPhoto4" name="teacherPhoto4"> <br>
								<br><div class="select_img5"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="teacherIntro4" id="teacherIntro4" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																					<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="reset" value="강사 추가" onClick="t_block4()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" onclick="t_none3()"/> 
								</li>
							</ul>
																		</article>
																		</div>
							<!-- 5번 강사 -->
							<div ID='teacher4' style="display: none;">
							<article class="post" style="margin-left: -30%;">
														<h3>5번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="tname5" id="tname5" value="" required>
							<p id="Academy_text"></p>
							<label>나이</label> <input type="text" maxlength="12" name="tage5" id="tage5"
								value="" required> <br> 
							<label for="hint">성별</label> 
							 <select name="tsex5" id="tsex5" required>
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'
								id="teacherPhoto5" name="teacherPhoto5"> <br>
								<br><div class="select_img6"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="teacherIntro5" id="teacherIntro5" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																												<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="reset" value="강사 추가" onClick="t_block5()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" onclick="t_none4()"/> 
								</li>
							</ul>
																		</article>
																		</div>
							<!-- 6번 강사 -->
							<div ID='teacher5' style="display: none;">
							<article class="post" style="margin-left: -30%;">
																					<h3>6번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="tname6" id="tname6" value="" required>
							<p id="Academy_text"></p>
							<label>나이</label> <input type="text" maxlength="12" name="tage6" id="tage6"
								value="" required> <br> 
							<label for="hint">성별</label> 
							 <select name="tsex6" id="tsex6" required>
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'
								id="teacherPhoto6" name="teacherPhoto6"> <br>
								<br><div class="select_img7"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="teacherIntro6" id="teacherIntro6" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																												<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="reset" value="강사 추가" onClick="t_block6()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" onclick="t_none5()"/> 
								</li>
							</ul>
																		</article>
																		</div>
							<!-- 7번 강사 -->
							<div ID='teacher6' style="display: none;">
							<article class="post" style="margin-left: -30%;">
																					<h3>7번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="tname7" id="tname7" value="" required>
							<p id="Academy_text"></p>
							<label>나이</label> <input type="text" maxlength="12" name="tage7" id="tage7"
								value="" required> <br> 
							<label for="hint">성별</label> 
							 <select name="tsex7" id="tsex7" required>
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'
								id="teacherPhoto7" name="teacherPhoto7"> <br>
								<br><div class="select_img8"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="teacherIntro7" id="teacherIntro7" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																																			<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="reset" value="강사 추가" onClick="t_block7()" />&nbsp;&nbsp;
								<input type="button" value="삭제하기" onclick="t_none6()"/> 
								</li>
							</ul>
																		</article>
																		</div>
																		
							<!-- 8번 강사 -->
							<div ID='teacher7' style="display: none;">
							<article class="post" style="margin-left: -30%;">
																												<h3>8번 강사</h3><hr>
											<label>강사 이름</label> <input type="text" maxlength="12"
								name="tname8" id="tname8" value="" required>
							<p id="Academy_text"></p>
							<label>나이</label> <input type="text" maxlength="12" name="tage8" id="tage8"
								value="" required> <br> 
							<label for="hint">성별</label> 
							 <select name="tsex8" id="tsex8" required>
							 	<option value="성별" style="color: black">성별</option>
							 	<option value="남성" style="color: black">남성</option>
							 	<option value="여성" style="color: black">여성</option>
							 </select>
							<br> <label>강사 사진</label> <input type='file'
								id="teacherPhoto8" name="teacherPhoto8"> <br>
								<br><div class="select_img9"><img src="" /></div>
							<br> <label>강사 소개</label>
							<textarea name="teacherIntro8" id="teacherIntro8" rows='5'
								style='resize: none;' placeholder='선생님 소개 입력'></textarea>
							<hr>
							<p>✔ 강사는 최대 8명까지 등록 가능합니다.<br>
																																										<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="button" value="삭제하기" onclick="t_none7()"/> 
								</li>
							</ul>
																		</article>
																		</div>
							
										</div>
									</div>
								</div>
							</div>
							<ul class="actions">
								<li style="margin: 0 auto;">
								<input type="submit" value="등록하기" class="primary" />&nbsp;&nbsp;
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
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!-- Footer -->
<%@ include file="../../footer.jsp"%>


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
		$("#teacher_name2").focus()
	}
	function t_none1() {
		teacher1.style.display = "none";
	}

	function t_block2() {
		teacher2.style.display = "block";
		$("#teacher_name3").focus()
	}
	function t_none2() {
		teacher2.style.display = "none";
	}

	function t_block3() {
		teacher3.style.display = "block";
		$("#teacher_name4").focus()
	}
	function t_none3() {
		teacher3.style.display = "none";
	}

	function t_block4() {
		teacher4.style.display = "block";
		$("#teacher_name5").focus()
	}
	function t_none4() {
		teacher4.style.display = "none";
	}

	function t_block5() {
		teacher5.style.display = "block";
		$("#teacher_name6").focus()
	}
	function t_none5() {
		teacher5.style.display = "none";
	}

	function t_block6() {
		teacher6.style.display = "block";
		$("#teacher_name7").focus()
	}
	function t_none6() {
		teacher6.style.display = "none";
	}

	function t_block7() {
		teacher7.style.display = "block";
		$("#teacher_name8").focus()
	}
	function t_none7() {
		teacher7.style.display = "none";
	}

	function t_block8() {
		teacher8.style.display = "block";
		$("#teacher_name9").focus()
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
  $("#file").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
//썸네일 스크립트 강사 사진 1~8
  $("#teacherPhoto1").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img2 img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
  $("#teacherPhoto2").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img3 img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  $("#teacherPhoto3").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img4 img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  $("#teacherPhoto4").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img5 img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  $("#teacherPhoto5").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img6 img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  $("#teacherPhoto6").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img7 img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  $("#teacherPhoto7").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img8 img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  $("#teacherPhoto8").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img9 img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
 </script>