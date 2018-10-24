<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>회원가입</h1>

<form method="post" action="<c:url value='adjoin'/>">
	아디디<input type="text" name="aid"><br>
	패스워드<input type="password" name="pwd"><br>
	닉네임<input type="text" name="nick"><br>
	
	<input type="submit" value="회원가입">	
</form>


</body>
</html>