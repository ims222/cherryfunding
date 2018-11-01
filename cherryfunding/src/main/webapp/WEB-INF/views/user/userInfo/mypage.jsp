<%@page import="com.cherryfunding.spring.util.S3Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>mypage.jsp</title>
</head>
<% 
	S3Util s3=new S3Util();
	String humanPicture=s3.getFileURL("images/1457899384.png");
%>
<style>
table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<body>
<div class="wrap">
	<table class="type04">
		<tr>
		  <td>	
		  	<img src="<%=humanPicture%>" width="111px">
			<p style="font-size: 20px;font-weight: bold">&nbsp;&nbsp;${sessionScope.id}님</p>
		  </td>
		  <td>	
			<p>내 잔고 : <fmt:formatNumber value="${balance }" pattern="#,###.##"/> 원</p>
			<p>총 후원금액 : <fmt:formatNumber value="${charitySum }" pattern="#,###.##"/> 원</p>
			<p>총 펀딩금액 : <fmt:formatNumber value="${fundingSum }" pattern="#,###.##"/> 원</p>
		  </td>
		  <td>
		     <a href="${pageContext.request.contextPath}/users/getInfo">회원정보수정</a>
		  </td>
		 </tr>
		</table>
		<p> 후원 목록 </p>
		<table class="type04">
			<tr>
				<td>제목</td>
				<td>카테고리</td>
				<td>금액</td>
				<td>후원날짜</td>
			</tr>
			<c:forEach var="vo" items="${charityList}">
				<tr>
					<td>${vo.title}</td>
					<td>${vo.category}</td>	
					<td><fmt:formatNumber value="${vo.amount }" pattern="#,###.##"/> 원</td>
					<td>${vo.regdate}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<div>
		<p> 펀딩 목록 </p>
		<table class="type04">
			<tr>
				<td>제목</td>
				<td>카테고리</td>
				<td>금액</td>
				<td>펀딩날짜</td>
			</tr>
			<c:forEach var="vo" items="${fundingList}">
				<tr>
					<td>${vo.title}</td>
					<td>${vo.category}</td>	
					<td><fmt:formatNumber value="${vo.price }" pattern="#,###.##"/> 원</td>
					<td>${vo.regdate}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
</body>
</html>

