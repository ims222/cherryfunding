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
	<a href="${pageContext.request.contextPath}/">메인으로</a>
	<h2>펀딩 승인 대기 목록</h2>
	<table>
		<tr>
			<th>펀딩번호</th>
			<th>제목</th>
			<th>목표금액</th>
			<th>시작일자</th>
			<th>종료일자</th>
			<th>카테고리</th>
			<th>승인구분</th>
			<th>승인자</th>
			<th>주소</th>
			<th>신청일</th>
			<th>신청자</th>
			<th>조회수</th>
			<th>승인</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="vo" items="${waitListFunding}">
		<tr>
			<td>${vo.fNum}</td>	
			<td><a href="${pageContext.request.contextPath}/funding/detail?fNum=${vo.fNum}">${vo.title}</a></td>
			<td>${vo.amount}</td>
			<td>${vo.sdate}</td>
			<td>${vo.edate}</td>
			<td>${vo.category}</td>
			<td>${vo.confirm}</td>
			<td>${vo.aid}</td>
			<td>${vo.addr}</td>
			<td>${vo.regdate}</td>
			<td>${vo.id}</td>
			<td>${vo.hit}</td>
			<td><a href="${pageContext.request.contextPath}/funding/confirm?fNum=${vo.fNum}">승인</a></td>
			<td><a href="${pageContext.request.contextPath}/fundingList/delete?fNum=${vo.fNum}">삭제</a></td>
		</tr>
	</c:forEach>
	</table>
	<h2>펀딩 승인목록</h2>
	<table>
		<tr>
			<th>펀딩번호</th>
			<th>제목</th>
			<th>목표금액</th>
			<th>시작일자</th>
			<th>종료일자</th>
			<th>카테고리</th>
			<th>승인구분</th>
			<th>승인자</th>
			<th>주소</th>
			<th>신청일</th>
			<th>신청자</th>
			<th>조회수</th>
			<th>승인취소</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="vo" items="${fundingList}">
		<tr>
			<td>${vo.fNum}</td>	
			<td><a href="${pageContext.request.contextPath}/funding/detail?fNum=${vo.fNum}">${vo.title}</a></td>
			<td>${vo.amount}</td>
			<td>${vo.sdate}</td>
			<td>${vo.edate}</td>
			<td>${vo.category}</td>
			<td>${vo.confirm}</td>
			<td>${vo.aid}</td>
			<td>${vo.addr}</td>
			<td>${vo.regdate}</td>
			<td>${vo.id}</td>
			<td>${vo.hit}</td>
			<td><a href="${pageContext.request.contextPath}/funding/confirmCancel?fNum=${vo.fNum}">승인취소</a></td>
			<td><a href="${pageContext.request.contextPath}/fundingList/delete?fNum=${vo.fNum}">삭제</a></td>
		</tr>
	</c:forEach>
	</table>
	
	
	
	
	<h2>후원 승인 대기 목록</h2>
	<table>
		<tr>
			<th>후원번호</th>
			<th>제목</th>
			<th>목표금액</th>
			<th>시작일자</th>
			<th>종료일자</th>
			<th>카테고리</th>
			<th>승인구분</th>
			<th>승인자</th>
			<th>주소</th>
			<th>신청일</th>
			<th>신청자</th>
			<th>조회수</th>
			<th>단위금액</th>
			<th>승인</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="vo" items="${waitListCharity}">
		<tr>
			<td>${vo.cNum}</td>	
			<td>${vo.title}</td>
			<td>${vo.amount}</td>
			<td>${vo.sDate}</td>
			<td>${vo.eDate}</td>
			<td>${vo.category}</td>
			<td>${vo.confirm}</td>
			<td>${vo.aId}</td>
			<td>${vo.addr}</td>
			<td>${vo.regdate}</td>
			<td>${vo.id}</td>
			<td>${vo.hit}</td>
			<td>${vo.cPrice}</td>
			<td><a href="${pageContext.request.contextPath}/charity/confirm?cNum=${vo.cNum}">승인</a></td>
			<td><a href="${pageContext.request.contextPath}/charity/delete?cNum=${vo.cNum}">삭제</a></td>
		</tr>
	</c:forEach>
	</table>
	<h2>후원 승인목록</h2>
	<table>
		<tr>
			<th>후원번호</th>
			<th>제목</th>
			<th>목표금액</th>
			<th>시작일자</th>
			<th>종료일자</th>
			<th>카테고리</th>
			<th>승인구분</th>
			<th>승인자</th>
			<th>주소</th>
			<th>신청일</th>
			<th>신청자</th>
			<th>조회수</th>
			<th>단위금액</th>
			<th>승인취소</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="vo" items="${charityList}">
		<tr>
			<td>${vo.cNum}</td>	
			<td><a href="${pageContext.request.contextPath}/charity/detail?cNum=${vo.cNum}">${vo.title}</a></td>
			<td>${vo.amount}</td>
			<td>${vo.sDate}</td>
			<td>${vo.eDate}</td>
			<td>${vo.category}</td>
			<td>${vo.confirm}</td>
			<td>${vo.aId}</td>
			<td>${vo.addr}</td>
			<td>${vo.regdate}</td>
			<td>${vo.id}</td>
			<td>${vo.hit}</td>
			<td>${vo.cPrice}</td>
			<td><a href="${pageContext.request.contextPath}/charity/confirmCancel?cNum=${vo.cNum}">승인취소</a></td>
			<td><a href="${pageContext.request.contextPath}/charity/delete?cNum=${vo.cNum}">삭제</a></td>
		</tr>
	</c:forEach>
	</table>
	
</body>
</html>