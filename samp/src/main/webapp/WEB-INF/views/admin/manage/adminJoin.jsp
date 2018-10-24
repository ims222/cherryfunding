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

<h1>관리자 회원가입</h1>

<form method="post" action="<c:url value='admin/manage/adjoin'/>">
	아이디<input type="text" name="aid"><br>
	비밀번호<input type="password" name="pwd"><br>
	닉네임<input type="text" name="nick"><br>
	
	<input type="submit" value="가입">	
</form>


</body>
</html>