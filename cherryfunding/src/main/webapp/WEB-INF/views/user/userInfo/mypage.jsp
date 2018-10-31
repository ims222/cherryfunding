<%@page import="com.cherryfunding.spring.util.S3Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div id="profile">
		  	<img src="<%=humanPicture%>" width="111px">
			<p>${sessionScope.id}님</p>
		</div>
		<div id="total">
			<p>나의 총 후원금액 : ${charitySum }</p>
			<p>나의 총 펀딩금액 : ${fundingSum }</p>
		</div>
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
					<td>${vo.amount}</td>
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
					<td>${vo.price}</td>
					<td>${vo.regdate}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
</body>
</html>

