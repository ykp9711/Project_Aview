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
		<h2>리뷰게시판</h2>
	</header>
</section>
<!-- Table -->
<div class="container">
	<section id="content">
		<br> <br>
		<h3>
			<a href="/list/registerGo" class="button small">글 등록</a>
		</h3>
		<div class="table-wrapper">
			게시글 개수 : ${total}
			<table>
				<tr class="tHead">
					<th class="bno">번호</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="regDate">작성일</th>

				</tr>
				<c:forEach var="list" items="${list}">
					<tr class="tBody">
						<td class="bno">${list.rn}</td>
						<td class="title"><a href="/list/getReview?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">${list.title}</a></td>
						<td class="writer">${list.writer}</td>
						<td class="regDate">${list.regDate}</td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
		</div>

		<div class="big-width" style="text-align: center">
			<%-- 이전버튼 --%>
			<c:if test="${pageMaker.prev}">
				<a class="changePage" href="${pageMaker.startPage - 1}">&lt;</a>
			</c:if>


			<%-- 페이지 구현 --%>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
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
					<option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목</option>
					<option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>내용</option>
					<option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : ''}>작성자</option>
					<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ''}>제목 또는 내용</option>
					<option value="TW" ${pageMaker.cri.type == 'TW' ? 'selected' : ''}>제목 또는 작성자</option>
					<option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected' : ''}>제목 또는 내용 또는 작성자</option>
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
<!-- Footer -->
<%@ include file="../../footer.jsp"%>
</html>