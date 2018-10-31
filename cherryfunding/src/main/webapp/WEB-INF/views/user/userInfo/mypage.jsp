<%@page import="com.cherryfunding.spring.util.S3Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage.jsp</title>
</head>
<% 
	S3Util s3=new S3Util();
	String humanPicture=s3.getFileURL("images/1457899384.png");
%>
<style>
#corner {
    padding: 20px;
    margin: 120px;
    margin-left : 450px; 
    width: 1000px;
    height: 1000px; 
}
#profile {
	border: 1px solid gray;
	padding: 20px;
	width: 200px;
	height: 200px;
	display: inline-block;
}
#profile > img {
	display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 25px;
}

#profile > p {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}
#total {
	position: relative;
	border: 1px solid gray;
	padding: 20px;
	margin-left: 245px;
	width: 800px;
	height: 200px;
	display: inline;
}
</style>
<body>
<div id="corner">
	<div id="profile">
	  	<img src="<%=humanPicture%>" width="111px">
		<p>${sessionScope.id}님</p>
	</div>
	<div id="total" style="display: in;">
		<p>나의 총 후원금액 : ${charitySum }</p>
		<p>나의 총 펀딩금액 : ${fundingSum }</p>
	</div>
</div>
</body>
</html>

