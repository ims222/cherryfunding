<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	
  function userout(id){
	  
	  $('#myModal').modal('show');
	  $('#btn1').click(function(){
		  
		 var value=id;
		 var url="<c:url value='/userdelete?id="+value+"'/>";
		 location.href=url;
	  });
	  
  };
  </script>
</head>
<body>
	<div class="container2">
	<h2>회원목록</h2><br>
	
	<form method="POST" action="${pageContext.request.contextPath }/admin/idsearch">
		<input type="text"  class="form-control" placeholder="search" id="idsearch" name="idsearch"style="width:1080px;float:left;">
		 &nbsp<input type="submit" value="찾기" class="btn btn-info">
	</form>
	<br>
	<table class="table table-striped" width="500">
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>성별</th>
			<th>생일</th>
			<th>주소</th>
			<th>가입일</th>
			<th>탈퇴</th>
		</tr>
		
		<c:forEach var="vo" items="${vo }">
		
			<tr>
				<td>${vo.id }</td>
				<td>${vo.nick }</td>
				<td>${vo.gender }</td>
				<td>${vo.birth }</td>
				<td>${vo.addr }</td>
				<td>${vo.regdate }</td>
				<td><a data-toggle="myModal" href="javascript:userout('${vo.id }');">탈퇴</td>
			</tr>
		</c:forEach>
		
				 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">탈퇴 여부</h4>
        </div>
        <div class="modal-body">
          <p>탈퇴 시키시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btn1">확인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
		
	</table>
	
</div>
	
</body>
</html>