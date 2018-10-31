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
	
	<form method="post" action="<c:url value='/'/>/insert">
		아이디 <input type="text" name="id" required="required"><br>
	비번 <input type="password" name="pwd" required="required"><br>
	닉네임 <input type="text" name="nick"><br>
	이메일 <input type="email" name="email" required="required" placeholder="test@domain.com"><br>
	주소 <input type="text" name="addr" required="required"><br>
	성별 <input type="radio" checked="checked" name="gender" value="m"> 남자 <input type="radio" name="gender" value="w"> 여자<br>
	전번 <input type="text" name="phone" placeholder="'-'를 넣어주세요">
	생년월일 <input type="date" name="birth" required="required">
	<input type="submit" value="가입">
	</form>
	
	<!-- 회원가입 -->
</body>
</html>