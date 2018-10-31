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
	
<<<<<<< HEAD
	
=======
	<form method="post" action="${pageContext.request.contextPath}/users/insert">
		아이디<input type="text" name="id"><br>
		비밀번호<input type="password" name="pwd"><br>
		닉네임<input type="text" name="nick"><br>
		이메일<input type="text" name="email"><br>
		주소<input type="text" name="addr"><br>
		성별<br>
		<label for="m">남</label><input type="radio" name="gender" value="m" id="m">
		<label for="w">여</label><input type="radio" name="gender" value="w" id="w"><br>
		전화번호<input type="text" name="phone"><br>
		생일<input type="date" name="birth"><br>
		<input type="submit" value="회원가입">
>>>>>>> branch 'master' of https://github.com/ims222/cherryfunding.git
	</form>
</body>
</html>

