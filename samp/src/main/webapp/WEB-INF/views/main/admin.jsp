<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>

<button class="h_button">회원가입</button>
<button class="h_button">로그인</button>
	<ul>
		<li><a href="<c:url value='/adjoin'/>">관리자 회원가입</a></li>
		<li><a href="<c:url value='/adlogin'/>">로그인</a></li>
		<li><a href="<c:url value='/admypage'/>">마이페이지</a></li>
		<li><a href="<c:url value='/adlogout'/>"></a>로그아웃</li>
	</ul>
</header>
