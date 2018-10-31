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
<h3>탈퇴하기</h3>

<form action="<c:url value='/'/>/withdrawal" method="post">
	아이디 <input type="text" name="id" required="required"><br>
	비밀번호 <input type="password" name="pwd" required="required"><br>
	<input type="submit" value="탈퇴하기">

</form>
<div>${requestScope.msg}</div>
	
</body>
</html>