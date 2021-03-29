<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>




<!-- Header -->
<%@ include file = "/header.jsp" %>



	<!-- Main -->
		<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		</head>
			<c:if test="${session_id eq null}">
			<script>
				alert("로그인 후 이용해주세요");
				location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
			</script>
			</c:if>
		<body>
			<c:set var="applyBean" value="${requestScope.applyBean}"/>
			<section id="main" class="wrapper style1">
				<header class="major">
					<h2>나의 수거 신청</h2>
					<p>정확한 재활용이 되지 않았을 경우, 포인트가 적립되지 않습니다.</p>
					
				</header>
				
				<div class="container">
				<form id="applyForm" name="applyForm" action="${pageContext.request.contextPath}/member/myApplyUpdateOk.me" method="post">
					<!-- Content -->
						<section id="u_info1">
						<h3>신청자 정보</h3>
						<hr>
						<div class="row gtr-uniform">
						<div class="col-6 col-12-small">
								<h4>이름</h4>
								<input type="hidden" id="a_uid" name="a_uid" value="${applyBean.getA_uid()}">
								<input type="hidden" id="a_id" name="a_id" value="${applyBean.getA_id()}">
								<input type="text" name="a_name" id="a_name" placeholder="이름" value="${applyBean.getA_name()}"/>
								<br>								
								<h4>이메일</h4>
								<div class="row gtr-uniform">
								<div class="col-6 col-12-small">
								<input type="text" name="a_email" id="a_email" placeholder="이메일"/>
								</div>
								<div class="col-6 col-12-small">
								<select name="select_email" id="select_email">
									<option value="">- 이메일 -</option>
									<option value="@naver.com">네이버</option>
									<option value="@hanmail.net">다음</option>
									<option value="@gmail.com">구글</option>
									<option value="@nate.com">네이트</option>
									<option value="0">직접입력</option>
								</select>
								</div>
								</div>
								
								<div style="margin-top:0.5rem;">
								<input type="text" name="selected_email" id="selected_email" placeholder="이메일" value="${applyBean.getA_email()}"/>
								</div>
							<br>
								<h4>휴대전화</h4>
								<input type="text" name="a_phone" id="a_phone" placeholder="핸드폰번호" value="${applyBean.getA_phone()}"/>
								<span style="vertical-align:middle;">
								<input type="checkbox" id="safety_number" name="safety_number" checked>
								<label for="safety_number" style="padding-left:1.5em;margin-top:0.5rem; float:right;">안심번호 사용</label>
								</span>
						</div>
						
						<div class="col-6 col-12-small">
							<h4>우편번호</h4>
							<div style="display:inline">
							<input type="text" name="a_zipcode" id="a_zipcode" value="${applyBean.getA_zipcode()}" style="display:inline; width:13.5rem;" required>
							<input type="button" name="find_zipcode" id="find_zipcode" value="우편번호 찾기" style="display: inline;">
							</div>
							
							<div>	
							<br>
							<h4>주소</h4>
							<input type="text" name="a_address" id="a_address" value="${applyBean.getA_address()}"  required>
							<br>
							</div>
							
							<div>
							<h4>상세주소</h4>
							<textarea name="a_address_detail" id="a_address_detail" placeholder="상세 주소를 입력해 주세요" rows="3" style="resize: none; height:auto;">${applyBean.getA_address_detail()}</textarea>
							<br>
							</div>
							
						<br>
						</div>
						</div>
					
					<h3>요청사항</h3>
						<div class="col-12">
							<select id="a_request" name="a_request">
								<!-- <option value="1">- 수거 요청사항 -</option> -->
								<option value="조심히 안전하게 와주세요 :)">조심히 안전하게 와주세요 :)</option>
								<option value="벨 누르지 말고 노크해주세요">벨 누르지 말고 노크해주세요</option>
								<option value="도착하기 전에 전화해주세요">도착하기 전에 전화해주세요</option>
								<option value="요청사항 없음">요청사항 없음</option>
								<option value="">직접입력</option>
							</select>
							<br>
								<div class="col-12">
								<textarea name="Requests_m" id="Requests_m" placeholder="요청사항을 입력해 주세요" rows="6" style="resize: none;"></textarea>
								</div>
						</div>
						<br>
						<br>
						<br>
						<hr>
				</section>
						
				<section id="u_info2">
					<input type="button" id="reset_recycle" name="reset_recycle" value="수량 초기화" style="font-size:110%; float:right">
					<br>
					<br>
					<h3>수거할 재활용품</h3>
					<strong style="font-size:120%">수거가 필요한 수 만큼 아이콘을 클릭, 희망 방문 날짜를 선택해 주세요!</strong>
					<!-- <input type="reset" value="수량 초기화" style="font-size:110%; margin-left:1rem; float:right;"> -->
					<input type="date" pattern="yyyy-MM-dd HH" name="a_wdate" id="a_wdate" style="font-size: 110%;border: 0px;padding-top: 0.3rem;font-family: 'Noto Sans KR', sans-serif;text-align: end;outline-color: #62BD83;">
					<select name="a_wtime" id="a_wtime" style="width: auto;display: inline;border: 0px;background-color: #fff;">
							<option value="시간 선택 안함">시간 선택 안함</option>
							<option value="09:00~12:00">아침(09:00~12:00)</option>
							<option value="12:00~18:00">오후(12:00~18:00)</option>
							<option value="18:00~21:00">저녁(18:00~21:00)</option>
					</select>
					<br>
					<br>
					<br>
					<div class="row gtr-uniform" style="margin-top:auto;">
						<div style="margin:0 auto">
							<img src="${pageContext.request.contextPath}/images/icon_plasitc.png" id="plastic" class="icon">
	 						<h3 style="display:inline;">플라스틱</h3>
							<input type="text" name="a_plastic" id="a_plastic" value="${applyBean.getA_plastic()}" readonly="readonly" style="text-align:right;" class="count"/>
						</div>
						<div style="margin:0 auto">
							<img alt="" src="${pageContext.request.contextPath}/images/icon_vinyl.png" id="vinyl" class="icon">
							<h3 style="display:inline;">비닐</h3>
							<input type="text" name="a_vinyl" id="a_vinyl" value="${applyBean.getA_vinyl()}"  readonly="readonly" style="text-align:right;" class="count"/>
						</div>
						<div style="margin:0 auto">
							<img alt="" src="${pageContext.request.contextPath}/images/icon_metal.png" id="can" class="icon">
							<h3 style="display:inline;">캔</h3>
							<input type="text" name="a_can" id="a_can" value="${applyBean.getA_can()}" readonly="readonly" style="text-align:right;" class="count"/>
						</div>
						</div>
						<div class="row gtr-uniform" style="margin-top:auto;">
						<div style="margin:0 auto; display:inline;">
							<img src="${pageContext.request.contextPath}/images/icon_glass.png" id="glass" class="icon">
	 						<h3 style="display:inline;">유리</h3>
	 						<input type="text" name="a_glass" id="a_glass" value="${applyBean.getA_glass()}" readonly="readonly" style="text-align:right;"/>
						</div>
						<div style="margin:0 auto">
							<img src="${pageContext.request.contextPath}/images/icon_paper.png" id="paper" class="icon">
	 						<h3 style="display:inline;">종이</h3>
	 						<input type="text" name="a_paper" id="a_paper" value="${applyBean.getA_paper()}" readonly="readonly" style="text-align:right;"/>
						</div>
						<div style="margin:0 auto; margin-top:auto;">
	 						<h3 style="display:inline;">예상 포인트</h3>
	 						<input type="text" name="a_point" id="a_point" value="${applyBean.getA_point()}" readonly="readonly" style="text-align:right;"/>
						</div>
					</div>
				</section>
				
				
					<div class="col-12">
						<ul class="actions">
							<li style="margin:0 auto; padding-top:3rem;">
							<input type="submit" id="submit" name="submit" value="저장하기" class="alt" onClick="location.href='javascript:formSubmit()'" style="font-size:120%; background-color:#62BD83; color:white!important;">
							</li>
						</ul>					
					</div>
				
				</form>
				</div>
				</section>
				
				<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
				<script>var contextPath = "${pageContext.request.contextPath}";</script>
				<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
				<script src="${pageContext.request.contextPath}/app/member/myApplyCheck.js"></script>
				<!-- Footer -->
				</body>
				<%@ include file = "/app/member/myApplyJS.jsp"%>
				<%@ include file = "/footer.jsp" %>
				

