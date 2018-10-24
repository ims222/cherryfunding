<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>
	<h1>funding application</h1>
	
	<form method="post" action="${pageContext.request.contextPath}/funding/fundingApplication" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<label for="title">제목</label>
		<input type="text" name="title" id="title"><br>
		
		<label for="content">제목</label><br>
		<textarea rows="5" cols="50" name="content" id="content"></textarea><br>
		
		<label for="amount">목표금액</label>
		<input type="number" name="amount" id="amount"><br>
		
		<label for="sDate">시작날짜</label>
		<input type="date" name="sDate" id="sDate"><br>
		<label for="eDate">종료날짜</label>
		<input type="date" name="eDate" id="eDate"><br>
		
		<label for="category">카테고리</label>
		<select name="category">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		<br>
		해시태그 <input type="text" name="hashtag">
		<label for="hashtag">#1</label><input type="checkbox" name="hashtag" value="n1">
		<label for="hashtag">#2</label><input type="checkbox" name="hashtag" value="n2">
		<label for="hashtag">#3</label><input type="checkbox" name="hashtag" value="n3">
		<br>
		
		리워드 등록<br>
		물품명1<input type="text" name="reward">
		가격1<input type="text" name="price"><br>
		물품명2<input type="text" name="reward">
		가격2<input type="text" name="price"><br>
		물품명3<input type="text" name="reward">
		가격3<input type="text" name="price"><br>
		
		사진업로드<br>
		<input type="file" name="fPicture"><input type="text" name="fPinfo"><br>
		<input type="file" name="fPicture"><input type="text" name="fPinfo"><br>
		<input type="file" name="fPicture"><input type="text" name="fPinfo"><br>
		
		<input type="submit" value="submit">
	</form>
</body>
</html>