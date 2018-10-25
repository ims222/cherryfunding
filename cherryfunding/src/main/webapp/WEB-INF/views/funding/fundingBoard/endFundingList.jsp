<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>
	<h1>종료</h1>

	<table border="1" width="1000">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>시작날짜</th>
			<th>종료날짜</th>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.fnum}</td>
				<td><a href="${pageContext.request.contextPath}/fundingList/detail?num=${vo.fnum}">${vo.title}</a></td>
				<td>${vo.id}</td>
				<td>${vo.sdate}</td>
				<td>${vo.edate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>