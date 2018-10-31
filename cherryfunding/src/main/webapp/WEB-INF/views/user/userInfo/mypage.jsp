<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>
	<h3>나의 정보</h3>
	아이디 ${vo.id }<br>
	이메일 ${vo.email }<br>
	닉네임 ${vo.nick }<br>
	주소 ${vo.addr }<br>
	성별  
		<c:if test="${vo.gender eq 'm' }">
			남자<br>
		</c:if>
		<c:if test="${vo.gender eq 'w' }">
			여자<br>
		</c:if>
		
	전화번호 ${vo.phone }<br>
	생년월일 ${vo.birth }<br>
	가입일 ${vo.regdate }<br>
	보유금액 ${vo.balance }<br>
	
	
<a href="<c:url value='/update'/>">수정하기</a>	
<a href="<c:url value='/withdrawal'/>">탈퇴하기</a>	
</body>
</html>