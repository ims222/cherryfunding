<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fundingUpdate.jsp</title>
</head>
<body>
	<h2>글 수정하기</h2>
	<form method="post" action="update">
		글번호<input type="text" name="fnum" value="${vo.fnum }" readonly="readonly"><br>
		제목 <input type="text" name="title" value="${vo.title }"><br>
		내용 <input type="text" name="content" value="${vo.content }"><br>
		목표금액 <input type="text" name="amount" value="${vo.amount }"><br>
		현재금액 <input type="text" name="camout" value="${vo.camout }"><br>
		시작일 <input type="date" name="sdate" value="${vo.sdate }"><br>
		종료일 <input type="date" name="edate" value="${vo.edate }"><br>
		카테고리 <input type="text" name="category" value="${vo.category }"><br>
		승인구분 <input type="text" name="confirm" value="${vo.confirm }"><br>
		승인자 <input type="text" name="aid" value="${vo.aid }"><br>
		주소 <input type="text" name="addr" value="${vo.addr }"><br>
		등록일 <input type="text" name="regdate" value="${vo.regdate }" readonly="readonly"><br>
		아이디 <input type="text" name="id" value="${vo.id }" readonly="readonly"><br>
		조회수 <input type="text" name="hit" value="${vo.hit }" readonly="readonly"><br>
		<input type="submit" value="저장">
	</form>
</body>
</html>