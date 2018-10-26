<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>charityDetail.jsp</title>
</head>
<body>
	<h2>상세글 보기</h2>
	<table border="1" width="500">
		<tr><td>글번호</td><td>${vo.cnum }</td><tr>
		<tr><td>제목</td><td>${vo.title }</td></tr>
		<tr><td>내용</td><td>${vo.content }</td></tr>
		<tr><td>목표금액</td><td>${vo.amount }</td></tr>
		<tr><td>현재금액</td><td>${vo.cAmount }</td></tr>
		<tr><td>시작일</td><td>${vo.sdate }</td></tr>
		<tr><td>종료일</td><td>${vo.edate }</td></tr>
		<tr><td>카테고리</td><td>${vo.category }</td></tr>
		<tr><td>승인구분</td><td>${vo.confirm }</td></tr>
		<tr><td>승인자</td><td>${vo.aid }</td></tr>
		<tr><td>주소</td><td>${vo.addr }</td></tr>
		<tr><td>등록일</td><td>${vo.regdate }</td></tr>
		<tr><td>아이디</td><td>${vo.id }</td></tr>
		<tr><td>조회수</td><td>${vo.hit }</td></tr>
		<tr>
		  <td>
		  <a href="<c:url value='/fundingList/update?num=${vo.cnum }'/>">수정</a>
		  <a href="<c:url value='/fundingList/delete?num=${vo.cnum }'/>">삭제</a>
		  </td>
		</tr>
	</table>
	<h2>첨부 이미지</h2>
	<table border="1">
	<tr>
	<c:forEach var="vo" items="${list }">
	<td>${vo.cpNum}</td>
	<td>${vo.orgname}</td>
	<td>${vo.cpinfo}</td>
	</c:forEach>
	</tr>
	</table>
	<h2>에디터</h2>
</body>

</html>