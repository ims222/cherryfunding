<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>

<div>
	${sessionScope.aid}
</div>

<button class="h_button">회원가입</button>
<button class="h_button">로그인</button>
	<ul>
		<c:choose>
			<c:when test="${empty sessionScope.aid}">
				<li><a href="<c:url value='/adjoin'/>">회원가입</a></li>
				<li><a href="<c:url value='/adlogin'/>">로그인</a></li>
			</c:when>
			
			<c:otherwise>
				<li><a href="<c:url value='/admypage'/>">관리자 마이페이지</a></li>
				<li><a href="<c:url value='/adlogout'/>">로그아웃</a></li>
			</c:otherwise>
		
		</c:choose>
	</ul>
</header>
