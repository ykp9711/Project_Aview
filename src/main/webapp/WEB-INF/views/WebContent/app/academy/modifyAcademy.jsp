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


	<ul class="tab" style=" position: fixed; z-index: 1; top: 7%; background: #F2F2F2; " >
		<li class="current" data-tab="tab1"><a href="#">학원소개등록</a></li>
		<li data-tab="tab2"><a href="#">메인강사등록</a></li>
		<li data-tab="tab3"><a href="#">교육 시설 안내</a></li>
	</ul>
	<form name="joinForm" action="/board/modifyIntro" method="post" enctype="multipart/form-data">
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
										<input type="hidden" name="ano" value="${board.ano}"/>
										<input type="hidden" name="academyId" value="${board.academyId}"/>
										<input type="hidden" name="academyIntro" value="${board.academyIntro}"/>
										<input type="hidden" name="academyMapPhoto" value="${board.academyMapPhoto}"/>
											<label for="hint">지역</label> <select name="academyArea"
												id="academyArea" required>
												<option value="전국" style="color: black">전국</option>
												<option value='서울특별시' ${board.academyArea == '서울특별시' ? 'selected' : ''}  style="color: black">서울특별시</option>
												<option value='광주광역시' ${board.academyArea == '광주광역시' ? 'selected' : ''} style="color: black">광주광역시</option>
												<option value='대구광역시' ${board.academyArea == '대구광역시' ? 'selected' : ''} style="color: black">대구광역시</option>
												<option value='대전광역시' ${board.academyArea == '대전광역시' ? 'selected' : ''} style="color: black">대전광역시</option>
												<option value='부산광역시' ${board.academyArea == '부산광역시' ? 'selected' : ''} style="color: black">부산광역시</option>
												<option value='울산광역시' ${board.academyArea == '울산광역시' ? 'selected' : ''} style="color: black">울산광역시</option>
												<option value='인천광역시' ${board.academyArea == '인천광역시' ? 'selected' : ''} style="color: black">인천광역시</option>
												<option value='세종특별자치시' ${board.academyArea == '세종특별자치시' ? 'selected' : ''} style="color: black">세종특별자치시</option>
												<option value='강원도' ${board.academyArea == '강원도' ? 'selected' : ''} style="color: black">강원도</option>
												<option value='경기도' ${board.academyArea == '경기도' ? 'selected' : ''} style="color: black">경기도</option>
												<option value='경상남도'${board.academyArea == '경상남도' ? 'selected' : ''} style="color: black">경상남도</option>
												<option value='경상북도' ${board.academyArea == '경상북도' ? 'selected' : ''} style="color: black">경상북도</option>
												<option value='전라남도' ${board.academyArea == '전라남도' ? 'selected' : ''} style="color: black">전라남도</option>
												<option value='전라북도' ${board.academyArea == '전라북도' ? 'selected' : ''} style="color: black">전라북도</option>
												<option value='제주특별자치도' ${board.academyArea == '제주특별자치도' ? 'selected' : ''} style="color: black">제주특별자치도</option>
												<option value='충청남도' ${board.academyArea == '충청남도' ? 'selected' : ''}  style="color: black">충청남도</option>
												<option value='충청북도' ${board.academyArea == '충청북도' ? 'selected' : ''} style="color: black">충청북도</option>
											</select>
										</div>
										<div
											style="width: 30%; height: 5%; float: left; margin-left: 2%;">
											<label for="hint">학원 카테고리</label> <select name="academyKind"
												id="academyKind" required>
												<option value="no">학원 카테고리</option>
												<option value="IT자격증" ${board.academyKind == 'IT자격증' ? 'selected' : ''}>IT자격증</option>
												<option value='실무' ${board.academyKind == '실무' ? 'selected' : ''}>실무실행</option>
												<option value='어학원' ${board.academyKind == '어학원' ? 'selected' : ''}>어학원</option>
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
													name="academyTitle" id="academyTitle" value="${board.academyTitle}" required>
												<br> <label>게시글 목록 사진(썸네일)</label> <input type='file'
													name="file" id="file" value="${board.academyPhoto}"><br>
													<c:if test="${board.academyPhoto ne 'noThumbnail.jpg'}">
													<img id ="photo" style ="width: 500px;"src="/resources/FileImage/${board.academyPhoto}"/>
													</c:if>
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
													id="academyName" value="${board.academyName}" required>
												</span>
											</div>
										</header>
										<div style="width: 750px; word-break: break-all;">
											<label for="pw2">학원 소개 영상 유튜브 링크</label> <input type="text"
												name="academyYoutube" id="academyYoutube" value="${board.academyYoutube}">
											<br> <label>학원 상세 설명</label>
											<textarea name="academyContent" id="academyContent" rows="6"
												style="resize: none;" placeholder="학원 상세 설명">${board.academyContent}</textarea>
											<br> <label>학원 태그(검색어로 사용됩니다.)</label> <input
												type="text" maxlength="12" name="academyTag" id="academyTag"
												value="${board.academyTag}" required>
										</div>
										<br>
										<hr>
										<h4>지점 상세 위치</h4><br>
												
											<label for ="postal_code">우편번호</label>
														<div class="row gtr-uniform">
															<div class="col-6 col-12-small">
																<input type="text" name="acaZipcode" id="acaZipcode" readonly="readonly" value="${board.acaZipcode}" required>
															</div>	
					 										 <div class="col-6 col-12-small">	
																<input type="button" name="findZipcode" id="findZipcode" value="우편번호 찾기" style="display: inline;">
														</div>
													</div>		
											<br>		
												<label for ="address">주소</label>
													<input type="text" name="acaAddress" id="acaAddress" value="${board.acaAddress}"  required>
											<br>
												<label for ="detail_address">상세주소</label>
													<input type="text" name="acaAddressDetail" id="acaAddressDetail" value="${board.acaAddressDetail}" required placeholder="자세하게 작성해주세요.">
													<br>
											
											</article>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
<input type="submit" value="전송">
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
				</div>
				
			</div>
								<ul class="actions">
						<li style="margin: 0 auto;"><input type="submit" value="게시글 수정"
							class="primary" /><br></li>
					</ul>
		</div>
		
		
		<!-- 강사등록   -->
		
	<div id="tab2" class="tabcontent">
						<h2>강사 수정</h2>
	<c:forEach items="${teacher}" var="teacher" varStatus="status">
	<div id='teacher${status.index}'>
			<div class="row gtr-uniform" style="color: black;">
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<br> <br>
					<header class="major">
					</header>
					<div id="wrapper style1">
						<div id="main" class="container">
							<div class="row">
								<div style="width: 70%;">
									<article class="post" style="margin-left: -30%;">
								 ${status.count} 번 강사
										<label>강사 이름</label> <input type="text" maxlength="12"	name="name${status.count}" value="${teacher.name}">
										 <br>
										 <label for="hint">성별</label> <select name="gender${status.count}">
											<option value="성별" style="color: black">성별</option>
											<option value="남성" style="color: black">남성</option>
											<option value="여성" style="color: black">여성</option>
										</select> <br> 
										<label>강사 사진</label>
										 <input type="file" name="teacherPhoto${status.count}">
										 <img src="/resources/FileImage/${teacher.photo}"/>
										<br> <br>
										<div class="select_img2">
											<img src="" />
										</div>
										<br>
										 <label>강사 소개</label>
										<textarea name='intro${status.count}' rows='5' style='resize: none;'placeholder='선생님 소개 입력'>${teacher.intro}</textarea>
										<hr>
										<p>
											✔ 강사는 최대 8명까지 등록 가능합니다.<br>
											<c:if test="${not status.first}">
											<ul class="actions">
												<li style="margin: 0 auto;">
											<input type="button" value="삭제하기" class="button" onclick="t_none${status.index}()"/> 
										</li>
										</ul>
											</c:if>		
											<c:if test="${status.last}">
												<ul class="actions">
											<li style="margin: 0 auto;"><input type="button" value="강사 추가" class="primary" onClick="t_block${status.count+1}()" />&nbsp;&nbsp;</li>
										</ul>
											</c:if>
									</article>
				</div>
			</div>
</div>
</div>
</div>
</div>
</div>
</c:forEach>

 
	<c:forEach var="i" begin="${teacherCount+1}" end="8" varStatus="status">
	<div id='teacher${status.current}' style="display: none;">
			<div class="row gtr-uniform" style="color: black; display: no" >
				<div class="col-6 col-12-small" style="margin: 0 auto;">
					<br> <br>
					<header class="major">
					</header>
					<div id="wrapper style1">
						<div id="main" class="container">
							<div class="row">
								<div style="width: 70%;">
									<article class="post" style="margin-left: -30%;">
								 <hr3> ${status.current}번 강사 </hr3>
										<label>강사 이름</label> <input type="text" maxlength="12"	name="name${status.current}" >
										 <br>
										 <label for="hint">성별</label> <select name="gender">
											<option value="성별" style="color: black">성별</option>
											<option value="남성" style="color: black">남성</option>
											<option value="여성" style="color: black">여성</option>
										</select> <br> 
										<label>강사 사진</label>
										 <input type="file" name="teacherPhoto${status.current}">
										<br> <br>
										<div class="select_img2">
											<img src="" />
										</div>
										<br>
										 <label>강사 소개</label>
										<textarea name='intro${status.current}' rows='5' style='resize: none;'placeholder='선생님 소개 입력'></textarea>
										<hr>
										<p>
											✔ 강사는 최대 8명까지 등록 가능합니다.<br>				

										<c:if test="${not status.last}">
														<ul class="actions">
														<li style="margin: 0 auto;">
											<input type="button" value="강사 추가" class="primary" onClick="t_block${status.current+1}()" />&nbsp;&nbsp;
											<input type="button" value="삭제하기" class="button" onclick="t_none${status.current}()"/> 
										</li>
										</ul>
											</c:if>
											
											<c:if test="${status.last}">
											<ul class="actions">
												<li style="margin: 0 auto;">
											<input type="reset" value="삭제하기" class="button" onclick="t_none${status.current}()"/> 
										</li>
										</ul>
											</c:if>
									</article>
				</div>
			</div>
</div>
</div>
</div>
</div> 
</div>
</c:forEach> 
									<input type="submit" value="등록">
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
			$("#teacher1").css("display","none");
			$("#teacher1").find('input:text').val('');
			$("#teacher1").find('input:file').val('');
			$("#teacher1").find('textarea').val('');
		}
		function t_block2() {
			teacher2.style.display = "block";
			$("input[name=name3]").focus();
		}
		function t_none2() {
			$("#teacher2").css("display","none");
			$("#teacher2").find('input:text').val('');
			$("#teacher2").find('input:file').val('');
			$("#teacher2").find('textarea').val('');
		}
		function t_block3() {
			teacher3.style.display = "block";
			$("input[name=name4]").focus();
		}
		function t_none3() {
			$("#teacher3").css("display","none");
			$("#teacher3").find('input:text').val('');
			$("#teacher3").find('input:file').val('');
			$("#teacher3").find('textarea').val('');
		}
		function t_block4() {
			teacher4.style.display = "block";
			$("input[name=name5]").focus();
		}
		function t_none4() {
			$("#teacher4").css("display","none");
			$("#teacher4").find('input:text').val('');
			$("#teacher4").find('input:file').val('');
			$("#teacher4").find('textarea').val('');
		}
		function t_block5() {
			teacher5.style.display = "block";
			$("input[name=name6]").focus();
		}
		function t_none5() {
			$("#teacher5").css("display","none");
			$("#teacher5").find('input:text').val('');
			$("#teacher5").find('input:file').val('');
			$("#teacher5").find('textarea').val('');
			teacher5.style.display = "none";
		}
		function t_block6() {
			teacher6.style.display = "block";
			$("input[name=name7]").focus();
		}
		function t_none6() {
			$("#teacher6").css("display","none");
			$("#teacher6").find('input:text').val('');
			$("#teacher6").find('input:file').val('');
			$("#teacher6").find('textarea').val('');
		}
		function t_block7() {
			teacher7.style.display = "block";
			$("input[name=name8]").focus();
		}
		function t_none7() {
			$("#teacher7").css("display","none");
			$("#teacher7").find('input:text').val('');
			$("#teacher7").find('input:file').val('');
			$("#teacher7").find('textarea').val('');
		}
		function t_block8() {
			teacher8.style.display = "block";
			$("#name9").focus()
		}
		function t_none8() {
			$("#teacher8").css("display","none");
			$("#teacher8").find('input:text').val('');
			$("#teacher8").find('input:file').val('');
			$("#teacher8").find('textarea').val('');
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
								$("#photo").css("display","none");
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
		$(".test").on("click", function(e) {
			e.preventDefault();
			var name = $("#name2");
			var age = $("#age2");
			var file = $("#file2");
			var gender = $("#gender2");
			var intro = $("#intro2");
			var form = $("#teacherForm");
			var ano = $("#ano");
			

			form.submit();
			
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