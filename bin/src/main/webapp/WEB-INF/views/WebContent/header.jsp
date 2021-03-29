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
            <a href="${pageContext.request.contextPath}/index.jsp" style="border-bottom: 0px">
            <img  src="/resources/images/logo_w.png" id="logo" alt=""  
    style="width: 200px;
    height: 100px;
    margin-left: -31px;
    margin-top: -30px;" />
            </a>
            <nav id="nav">
               <ul>
               <% if(session.getAttribute("admin") == "admin"){%>
               	<li><a href="${pageContext.request.contextPath}/member/MemberLogOut.me">로그아웃</a></li>
	            <%-- <li><a href="${pageContext.request.contextPath}/mypage.html">마이페이지</a></li> --%>
				<%}else if(session.getAttribute("session_id")!= null){ %>
	             <li><p><%=session.getAttribute("session_id") %>님 </p></li>    
	             <li><a href="${pageContext.request.contextPath}/member/MemberLogOut.me">로그아웃</a></li>
	             <li><a href="${pageContext.request.contextPath}/member/MemberView.me?u_id=<%=session.getAttribute("session_id")%>">마이페이지</a></li>
	             <li><a href="${pageContext.request.contextPath}/review/ReviewList.rv">리뷰</a></li>
                  <li><a href="${pageContext.request.contextPath}/member/MemberPoint.me?id=<%=session.getAttribute("session_id")%>">고객센터</a></li>

	             <%}else{%>
	             <li><a href="${pageContext.request.contextPath}/member/MemberLogin.me">로그인</a></li>
                 <li><a href="${pageContext.request.contextPath}/review/ReviewList.rv">리뷰</a></li>
                 <li><a href="${pageContext.request.contextPath}/member/MemberPoint.me?id=<%=session.getAttribute("session_id")%>">고객센터</a></li>
	         	<%}%>
               </ul>
            </nav>
         </header>
         


