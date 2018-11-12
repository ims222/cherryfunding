<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  
<title>Insert title here</title>

<style type="text/css">
  	.jumbotron{
  	
  	height:600px;
    width:500px;
  	background-color:white;
  	border:1px solid black;
  	}
  </style>
  
 
  


</head>


<body>
	
	<jsp:useBean id="toDay" class="java.util.Date"/>
	<fmt:formatDate value="${toDay }" pattern="yymmdd" var="toDay"/>
	<h1>관리자 페이지</h1>
	
	<a href="<c:url value='/admypagea'/>">승인관리</a>
	<a href="<c:url value='/confirmList'/>">승인확인</a>
	<a href="<c:url value='/usermanage'/>">회원관리</a>
	<a href="<c:url value='/visitorstatistics?today=${toDay }'/>">통계</a>
	
	<div class="jumbotron" id="confrim">
		회원관리
	</div>
</body>
</html>