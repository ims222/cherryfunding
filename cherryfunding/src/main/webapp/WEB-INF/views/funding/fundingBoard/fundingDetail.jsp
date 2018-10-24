<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fundingDetail.jsp</title>
</head>
<body>
	<h2>상세글 보기</h2>
	<table border="1" width="500">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>목표금액</th>
			<th>현재금액</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>카테고리</th>
			<th>승인구분</th>
			<th>승인자</th>
			<th>주소</th>
			<th>등록일</th>
			<th>아이디</th>
			<th>조회수</th>
		</tr>
			<tr>
				<td>${vo.fnum }</td>
				<td>${vo.title }</td>
				<td>${vo.content }</td>
				<td>${vo.amount }</td>
				<td>${vo.camout }</td>
				<td>${vo.sdate }</td>
				<td>${vo.edate }</td>
				<td>${vo.category }</td>
				<td>${vo.confirm }</td>
				<td>${vo.aid }</td>
				<td>${vo.addr }</td>
				<td>${vo.regdate }</td>
				<td>${vo.id }</td>
				<td>${vo.hit }</td>
				<td><a href="<c:url value='/fundingList/update?num=${vo.fnum }'/>">수정</a></td>
				<td><a href="<c:url value='/fundingList/delete?num=${vo.fnum }'/>">삭제</a></td>
			</tr>
	</table>
</body>

</html>