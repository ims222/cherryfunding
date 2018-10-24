<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	
	<form method="post" action="<c:url value='adlogin'/>">
	
		아이디<input type="text" name="aid"><br>
		패스워드<input type="password" name="pwd">
		<div style="color:red; font-size=12px">${errMsg}</div>
		<input type="submit" value="로그인">
	
	</form>
</body>
</html>