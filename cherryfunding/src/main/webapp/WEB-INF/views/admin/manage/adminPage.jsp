<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	<h1>������ ������</h1>
	
	<a href="<c:url value='/admypagea'/>">���ΰ���</a>
	<a href="<c:url value='/confirmList'/>">����Ȯ��</a>
	<a href="<c:url value='/usermanage'/>">ȸ������</a>
	<a href="#">���</a>
	
	<div class="jumbotron" id="confrim">
		ȸ������
	</div>
</body>
</html>