<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
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
#teacher1 , #teacher2,  #teacher3 , #teacher4, #teacher5{position:relative; left:0; top:0; z-index:3; visibility:hidden;}

/* 시설 사진 추가 태그 숨기기 , 보이기 */
#facility1 , #facility2,  #facility3 , #facility4, #facility5{position:relative; left:0; top:0; z-index:3; visibility:hidden;}  
    
    
    
</style>
	<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>

		<!-- Header -->
		<body class="is-preload">
   <%@ include file="/header.jsp"%>
   


		<!-- Main -->


    <ul class="tab">
        <li class="current" data-tab="tab1"><a href="#">학원소개등록</a></li>
        <li data-tab="tab2"><a href="#">메인강사등록</a></li>
        <li data-tab="tab3"><a href="#">교육 시설 안내</a></li>
        <li data-tab="tab4"><a href="#">Travel</a></li>
    </ul>
    	<form action="${pageContext.request.contextPath}/board/BoardWrite.bo" method="post" enctype="multipart/form-data" name="boardform">
    <div id="tab1" class="tabcontent current">
    <h3>학원 소개</h3>
    
                  <span>
                   <select name="region"  style="font-size:15px; color:black; margin-left:480px; width: 200px; height:50px; float: left;">
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
													<select name="kind" id="kind" style="margin-left: 480px; color:black;font-size:15px;width: 200px; height:50px;">
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
                  
                  
                  </span>
                  <br>
        												
					<div class="row gtr-uniform" style="width:100%">
						<div class="col-6 col-12-xsmall" style="margin:0 auto;color:black; float: left;">
							<li>게시글 목록 사진<br><input type='file' name='main_photo_name'></br></li>
							<li>게시글 제목<br>
							<textarea name="board_title" rows="1" style="resize:none;" placeholder="학원 제목"></textarea>
							<br>
							<li>학원 상세 설명<br>
							<textarea name="board_content"  rows="6" style="resize:none;" placeholder="학원 상세 설명"></textarea>
							<br>
							<li>학원 태그<br>
							<input type="hidden" name="board_id" value="${session_id}" />
							<input type="text" name="board_tag" />
							<br>
							<li>학원 소개 영상 유튜브 링크<br>
							<input type="text" name="board_video" />
							<br>
						</div>
					</div>
				    <input type="submit" value="등록하기" />
</form>
    </div>
	<!-- 강사등록   -->
    <div id="tab2" class="tabcontent">
        <h3>메인강사등록</h3>
       
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall" style="margin:0 auto;color:black;">
							<li>대표 강사님 이름<br>
							<textarea name="teacher_text" id="teacher_text" rows="1" style="resize:none;" placeholder="선생님 이름 입력"  maxlength="5"></textarea>
							<li>대표 강사님 사진<br><input type='file' id='teacher_Photo' name='teacher_Photo'></br></li>
							<li>경력사항<br><textarea name='teacher_Career' id='teacher_Career' rows='6' style='resize:none;' placeholder='경력사항 입력'></textarea></li>
							<li>대표 강사님 소개<br><textarea name='teacher_intro' id='teacher_intro' rows='5' style='resize:none;' placeholder='선생님 소개 입력'></textarea></li>
							<li>영상 업로드<br><input type='file' id='teacher_Video' name='teacher_Video'><br></li>
							<div id="teacher" name="teacher" style="list-style-type: none;"></div>

							<!-- 추가하기 , 삭제하기 -->
							<INPUT TYPE="button" VALUE="강사 추가하기" OnClick="teacher1.style.visibility='visible'"/>
							<INPUT TYPE="button" VALUE="삭제하기" OnClick="teacher1.style.visibility='hidden'"/>
							
							
							<!-- 강사 추가 1번째  input 자리 -->
							<div ID='teacher1'>

							<div class="col-6 col-12-xsmall"
							style="margin: 0 auto; color: black;">
							<hr><br> <!-- 줄 생성 -->
							<li>서브 강사님 이름<br>
							<textarea name="teacher_text1" id="teacher_text1" rows="1" 
							style="resize: none;"placeholder="선생님 이름 입력" maxlength="5"></textarea>
							<li>서브 강사님 사진<br>
							<input type='file' id='teacher_Photo1' name='teacher_Photo1'></br></li>
							<li>경력사항<br>
							<textarea name='teacher_Career1' id='teacher_Career1' rows='6'
									style='resize: none;' placeholder='경력사항 입력'></textarea></li>
							<li>서브 강사님 소개<br>
							<textarea name='teacher_intro1' id='teacher_intro1' rows='5'
									style='resize: none;' placeholder='선생님 소개 입력'></textarea></li>
							<li>영상 업로드<br>
							<input type='file' id='teacher_Video1' name='teacher_Video1'><br></li>
							<div id="teacher" name="teacher" style="list-style-type: none;"></div>
							<INPUT TYPE="button" VALUE="강사 추가하기" OnClick="teacher2.style.visibility='visible'"/>
							<INPUT TYPE="button" VALUE="삭제하기" OnClick="teacher2.style.visibility='hidden'"/>
							</div>
							
							
						 		
							<!-- 강사 추가 2번째  input 자리 -->
							<div ID='teacher2'>
							
							<div class="col-6 col-12-xsmall"
							style="margin: 0 auto; color: black;">
							<hr><br> <!-- 줄 생성 -->
							<li>서브 강사님 이름<br><textarea name="teacher_text2" id="teacher_text2" rows="1" 
							style="resize: none;" placeholder="선생님 이름 입력" maxlength="5"></textarea>
							<li>서브 강사님 사진<br>
							<input type='file' id='teacher_Photo2' name='teacher_Photo2'></br></li>
							<li>경력사항<br>
							<textarea name='teacher_Career2' id='teacher_Career2' rows='6'
									style='resize: none;' placeholder='경력사항 입력'></textarea></li>
							<li>서브 강사님 소개<br>
							<textarea name='teacher_intro2' id='teacher_intro2' rows='5'
									style='resize: none;' placeholder='선생님 소개 입력'></textarea></li>
							<li>영상 업로드<br>
							<input type='file' id='teacher_Video2' name='teacher_Video2'><br></li>
							<div id="teacher" name="teacher" style="list-style-type: none;"></div>
							
							<input TYPE="button" VALUE="강사 추가하기"  OnClick="teacher3.style.visibility='visible'">
							<input TYPE="button" VALUE="삭제하기"  OnClick="teacher3.style.visibility='hidden'">
							</div>
							</div>
							
									<!-- 강사 추가 3번째  input 자리 -->
							<div ID='teacher3'>
							
							<div class="col-6 col-12-xsmall"
							style="margin: 0 auto; color: black;">
							<hr><br> <!-- 줄 생성 -->
							<li>서브 강사님 이름<br><textarea name="teacher_text3" id="teacher_text3" rows="1" 
							style="resize: none;" placeholder="선생님 이름 입력" maxlength="5"></textarea>
							<li>서브 강사님 사진<br>
							<input type='file' id='teacher_Photo3' name='teacher_Photo3'></br></li>
							<li>경력사항<br>
							<textarea name='teacher_Career3' id='teacher_Career3' rows='6'
									style='resize: none;' placeholder='경력사항 입력'></textarea></li>
							<li>서브 강사님 소개<br>
							<textarea name='teacher_intro3' id='teacher_intro3' rows='5'
									style='resize: none;' placeholder='선생님 소개 입력'></textarea></li>
							<li>영상 업로드<br>
							<input type='file' id='teacher_Video3' name='teacher_Video3'><br></li>
							<div id="teacher" name="teacher" style="list-style-type: none;"></div>
							

							</div>
							</div>
							
										<!-- 강사 추가 4번째  input 자리 -->

							
						</div>
					</div>
				</div>
				
				
    </div>
    <div id="tab3" class="tabcontent">
        <h3>교육 시설 안내</h3>
        
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall" style="margin:0 auto;color:black;">
							학원이름 : <strong>코리아 it 아카데미 학원</strong>
							<!-- <br>
							학원 시설 설명
							<textarea name="facility_intro" id="facility_intro" rows="3" style="resize:none;" placeholder="학원 시설 사진"></textarea> -->
							<br>
							학원 시설 사진 <br>
							<input type="file" name="aca_facility" id="aca_facility"/>
							<br>
							<div id="facility" name="facility" style="list-style-type: none;"></div>
							<input TYPE="button" VALUE="사진 추가"  OnClick="teacher4.style.visibility='visible'">
							<input TYPE="button" VALUE="삭제하기"  OnClick="teacher4.style.visibility='hidden'">
						</div>
					</div>
				
    </div>

    <div id="tab4" class="tabcontent">
        <h3>Travel</h3>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
    </div>
    



	   <!-- Footer  -->
    <footer id="footer">
      <%@ include file = "/footer.jsp" %>
   </footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
	function check_number_write(){
		console.log(document.getElementById("check_number").readonly);
		document.getElementById("check_number").readOnly = false;
	}
/* 	function addTeacher(){
		var list = document.getElementById("teacher")
		list.innerHTML = list.innerHTML + "<hr><li>선생님 이름<br><input type='text'/></li><br>선생님 사진<br><input type='file' id='teacherPhoto2' name='teacherPhoto2'></br><br>경력사항<br><textarea name='facility_intro2' id='facility_intro2' rows='6' style='resize:none;' placeholder='경력사항 입력'></textarea><br><br>선생님 소개<br><textarea name='facility_intro3' id='facility_intro3' rows='6' style='resize:none;' placeholder='선생님 소개'></textarea><br><br>영상 업로드<br><input type='file' id='teacherVideo' name='teacherVideo'><br>"
	} */
	
function addfacility(){
		var list = document.getElementById("facility")
		list.innerHTML = list.innerHTML + "<hr><br>학원 시설 사진<br><input type='file' id='aca_facility2' name='aca_facility2'></br><br>학원 시설 사진<br><input type='file' id='aca_facility3' name='aca_facility3'></br><br>학원 시설 사진<br><input type='file' id='aca_facility4' name='aca_facility4'></br>"
	}
	
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
</html>