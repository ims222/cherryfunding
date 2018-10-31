<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${code=='success' }">
		<h3>가입해주셔서 감사합니다</h3>
	</c:when>
	<c:otherwise>
		<h3>작성란에 오류가 있습니다.</h3>
		<a href="<c:url value='/insert'/>">다시 가입하기</a>
	</c:otherwise>
	
</c:choose>


<a href="<c:url value='/'/>">메인으로</a>
</body>
</html>