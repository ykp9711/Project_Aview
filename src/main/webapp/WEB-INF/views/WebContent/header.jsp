<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<!-- Header -->
			<header id="header" class="reveal">
            <a href="/main/index" style="border-bottom: 0px">
            <img  src="/resources/images/logo_w.png" id="logo" alt=""  
    style="width: 170px;
    height: 40px;
    margin-left: 0px;
    margin-top: 3px;"/>
            </a>
            <nav id="nav">
               <ul>
              
              
	            <%-- <li><a href="${pageContext.request.contextPath}/mypage.html">마이페이지</a></li> --%>
				<c:if test="${not empty session_id}">
	             <li><p>${session_id}님 </p></li>    
	             <li><a href="/member/logout">로그아웃</a></li>
	             <li><a href="/member/userinfo">마이페이지</a></li>
	             <li><a href="/list/review">리뷰</a></li>
                  <li><a href="/list/service">고객센터</a></li>
				</c:if>
	             <c:if test="${empty session_id}">
	             <li><a href="/main/loginForm">로그인</a></li>
                 <li><a href="/list/review">리뷰</a></li>
	      		</c:if>
               </ul>
            </nav>
         </header>
         


