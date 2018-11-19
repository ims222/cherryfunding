<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="bg-img">
	<form action="${pageContext.request.contextPath}/adlogin" method="post" class="container">
	<!-- <h1>로그인</h1> -->
		<c:choose>
			<c:when test="${not empty sessionScope.adid}">
				${sessionScope.adid} 님 <a href="${pageContext.request.contextPath}/admypage">마이페이지</a>
				<input type="button" class="btn" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/adlogout'">
			</c:when>
			<c:otherwise>
				<label for="id"><b>아이디</b></label>
				<input type="text" placeholder="아이디" name="aid" required>
				<span style="color:red; font-size:12px">${msg }</span><br><br>
					<label for="pwd"><b>패스워드</b></label>
				<input type="password" placeholder="패스워드" name="pwd" required>
					<button type="submit" class="btn">로그인</button>
				<button type="button" name="회원가입" class="btn" onclick="location.href='${pageContext.request.contextPath}/adjoinagree'">회원가입</button>
			</c:otherwise>
		</c:choose>
	</form>
</div>