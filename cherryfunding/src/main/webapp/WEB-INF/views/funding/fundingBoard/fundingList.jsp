<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fundingList.jsp</title>
</head>
<body>
	<h2>펀딩글 전체목록</h2>
	<table border="1" width="500">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>승인구분</th>
			<th>승인자</th>
			<th>등록일</th>
			<th>아이디</th>
			<th>조회수</th>
			<th>상세글</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.fnum }</td>
				<td>${vo.title }</td>
				<td>${vo.confirm }</td>
				<td>${vo.aid }</td>
				<td>${vo.regdate }</td>
				<td>${vo.id }</td>
				<td>${vo.hit }</td>
				<td><a href="<c:url value='/fundingList/detail?num=${vo.fnum }'/>">보기</a></td>
			</tr>
		</c:forEach>
	</table>
<br>
	<a href="<c:url value='/'/>">홈으로</a>
</body>

</html>