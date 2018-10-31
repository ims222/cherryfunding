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
	<h1>회원가입</h1>
	
	<form method="post" action="${pageContext.request.contextPath}/users/insert">
		<input type="text" name="id"><br>
		<input type="password" name="pwd"><br>
		<input type="text" name="nick"><br>
		<input type="text" name="email">
		<input type="text" name="addr"><br>
		<select name="gender">
			<option value="m">남</option>
			<option value="w">여</option>
		</select><br>
		<input type="text" name="phone"><br>
		<input type="date" name="birth"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>

