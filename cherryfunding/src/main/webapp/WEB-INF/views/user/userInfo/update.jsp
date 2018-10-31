<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>
		<h3>정보 수정</h3>
<form action="<c:url value='/'/>/update" method="post">
	아이디 <input type="text" name="id" value="${vo.id }" readonly="readonly"><br>
	비밀번호 <input type="password" name="pwd" value="${vo.pwd }" required="required"><br>
	이메일 <input type="email" name="email" value="${vo.email }" required="required"><br>
	닉네임 <input type="text" name="nick" value="${vo.nick }" required="required"><br>
	주소 <input type="text" name="addr" value="${vo.addr }" required="required"><br>
	전화번호 <input type="text" name="phone" value="${vo.phone }" required="required"><br>
	<input type="submit" value="변경">
	

</form>
</body>
</html>