<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cicadas</h1>
	
	${sessionScope.id} <br>
	
	<a href="">후원등록</a>
	<a href="">후원목록</a>
	<a href="${pageContext.request.contextPath}/funding/fundingApplication">펀드등록</a>
	<a href="${pageContext.request.contextPath}/funding/prepareFundingList">준비중펀드목록</a>
	<a href="${pageContext.request.contextPath}/funding/endFundingList">종료펀드목록</a>
</body>
</html>