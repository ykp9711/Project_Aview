<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html>
<html>
<!--
   Drift by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->


<head>
<title>Aview Board</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
select {
	width: 15%;
	display: inline;
}

#keyword {
	display: inline;
	width: 60%;
}

.search {
	width: 20%;
}

.big-width {
	display: block;
}

.small-width {
	display: none;
	text-align: center;
}

@media ( max-width : 900px) {
	.writer {
		display: none;
	}
	.regDate {
		display: none;
	}
	.updateDate {
		display: none;
	}
	.big-width {
		display: none;
	}
	.small-width {
		display: block;
	}
	select {
		width: 100%;
	}
	#keyword {
		width: 100%;
	}
	.search {
		width: 100%;
	}
}
</style>
</head>

<body>
<!-- 공지사항 -->
<section id="main" class="wrapper style1">
	<header class="major">
		<h2>학원 목록</h2>
	</header>
</section>
<!-- Table -->
<div class="container">
	<section id="content">
		<br> <br>
		<h3>
		<c:if test="${acaid eq 'acaOk'}">
			<a href="/board/academyDetailEdit" class="button small">학원 등록 하기</a>
			</c:if>
		</h3>
		      <div class="table-wrapper">
         등록된 학원 : ${total}<br><br>
         <table style="border: 1px; solid;">
            	<tr class="tHead">
            	<th class="photo">글번호</th>
               <th class="photo">사진</th>
               <th class="title">제목 / 태그</th>
               <th class="kind">학원 종류</th>
               <th class="area">학원 장소</th>

            </tr>
            <c:forEach var="list" items="${list}">
               <tr>
               	  <td class="photo" >${list.rn}</td>
                  <td class="photo" >${list.academyPhoto}</td>
                  <td class="title"><a href="/board/getBoard?ano=${list.ano}">${list.academyTitle}</a></td>
                  <td class="kind">${list.academyKind}</td>
                  <td class="area">${list.academyArea}</td>
               </tr>

            </c:forEach>

            </tbody>
         </table>
      </div>
		<div class="big-width" style="text-align: center">
			<%-- 이전버튼 --%>
			<c:if test="${pageMaker.prev}">
				<a class="changePage" href="${pageMaker.startPage-1}">&lt</a>
			</c:if>
			
			<%-- 페이지 구현 --%>
			<c:forEach var= "num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<c:choose>
					<c:when test="${pageMaker.cri.pageNum eq num}">${num}</c:when>
					<c:otherwise>
						<a class="changePage" href="${num}">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%-- 다음버튼 --%>

			<c:if test="${pageMaker.next}">
				<a class="changePage" href="${pageMaker.endPage + 1}">&gt;</a>
			</c:if>

		</div>
		<form id="pageForm">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>



		<form id="searchForm">
			<div style="width: 100%; float: left;">

				<select name="type" style="width: 15%; float: left;">
					<option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>검색기준</option>
					<option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목/태그</option>
					<option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>학원종류</option>
					<option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : ''}>학원장소 </option>
					<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ''}>제목/태그 또는 학원종류</option>
					<option value="TW" ${pageMaker.cri.type == 'TW' ? 'selected' : ''}>제목/태그 또는 학원장소</option>
					<option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected' : ''}>제목/태그 또는 학원종류 또는 학원장소</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" style="width: 65%; float: center;" />
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<a href="javascript:void(0)"
				   class="search button primary icon solid fa-search"
				   style="width: 15%; float: right;">검색
				</a>
			</div>
		</form>
		<br>
	</section>
</div>
</body>


<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	var pageForm = $("#pageForm");

	$(".changePage").on("click", function(e) {
		e.preventDefault();
		pageForm.find("input[name='pageNum']").val($(this).attr("href"));
		pageForm.submit();
	})
</script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script>
				var pageForm = $("#pageForm");
				
				$(".changePage").on("click", function(e){
					e.preventDefault();
					//form태그(pageForm)에서 name이 pageNum인 input 태그를 찾는다.
					//해당 input 태그에 value값을 사용자가 클릭한 a태그의 href값으로 변경한다.
					//즉, 사용자가 클릭 a태그의 href값은 이동해야 할 pageNum이기 때문에 input태그에 담아서 컨트롤러로 전송해야 한다.
					pageForm.find("input[name='pageNum']").val($(this).attr("href"));
					pageForm.submit();
				})
				
				$(".goGet").on("click", function(e){
					e.preventDefault();
					pageForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>")
					pageForm.attr("action", "/serviceList/get");
					pageForm.submit();
				})
				
				/* alert("${result}"); */
				result = "${result}"
				$(document).ready(function(){
					if(result == '' || history.state){
						return;
					}
					
					if(parseInt(result) > 0){
						alert("게시글 " + parseInt(result) + "번이 등록되었습니다.");
					}
					
					history.replaceState({}, null, null);
				})
</script>
<script>
			var searchForm = $("#searchForm");
			
			$("#searchForm a").on("click", function(e){
				e.preventDefault();
				
				//val()은 해당 값이 있으면 true, 없으면 false
				if(!searchForm.find("option:selected").val()){
					alert("검색 종류를 선택하세요");
					return false;
				}
				
				if(!searchForm.find("input[name='keyword']").val()){
					alert("키워드를 입력하세요")
					return false;
				}
				
				searchForm.find("input[name='pageNum']").val("1");
				searchForm.submit();
			})

</script>

<!-- Footer -->
<%@ include file="../../footer.jsp"%>
</html>