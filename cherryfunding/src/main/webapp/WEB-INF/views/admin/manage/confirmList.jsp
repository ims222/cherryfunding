<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <script type="text/javascript">

  	 	function modalshow(num){
 
  			$('#myModal').modal('show');
  			
  			$('#btn1').click(function(){
  				var value = num;
  				var url = "<c:url value='/admypage/wait?num="+value+"'/>";
  				location.href=url;  				
  			});
  			
  	 	};
  	 	
  	 	function modalshow2(num){
  	 	 
  			$('#myModal').modal('show');
  			
  			$('#btn1').click(function(){
  				var value = num;
  				var url = "<c:url value='/admypage/cwait?num="+value+"'/>";
  				location.href=url;  				
  			});
  			
  	 	};
  	
  
  </script>
  
  
</head>
<body>
	<div class="container2">
	<h2>승인 확인</h2>
	<table class="table table-condensed" border="1" width="500">
		<tr>
			<th>글번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>등록일</th>
			<th>상세보기</th>
			<th>승인여부</th>
			
		</tr>
		<c:if test="${vo ne 'null'}">
		<c:forEach var="vo" items="${vo }">
			<tr>
				<td>${vo.fNum }</td>
				<td>${vo.aid }</td>
				<td>${vo.title }</td>
				<td>${vo.category }</td>
				<td>${vo.regdate }</td>
				<td><a href="<c:url value='/fundingList/detail?num=${vo.fNum }'/>">보기</a></td>
				<td id="mm"><a data-toggle="modal" href="javascript:modalshow('${vo.fNum}');">${vo.confirm }</a></td>
			
			</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${co ne 'null'}">
	 	<c:forEach var="co" items="${co }">
			<tr>
				<td>${co.cNum }</td>
				<td>${co.id }</td>
				<td>${co.title }</td>
				<td>${co.category }</td>
				<td>${co.regdate }</td>
				<td><a href="<c:url value='/charityList/detail?num=${co.cNum }'/>">보기</a></td>
				<td id="mm"><a data-toggle="modal" href="javascript:modalshow2('${co.cNum}');">${co.confirm }</a></td>
			
			</tr>
		</c:forEach>
		</c:if>
		
		
			 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">승인 여부</h4>
        </div>
        <div class="modal-body">
          <p>승인 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btn1">확인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
		

</table>

<form action="${pageContext.request.contextPath }/admin/csearch" method="post">
<select name="kinds">
	<option value='chirty' <c:if test="${kinds eq 'chirty' }">selected="selected"</c:if>>기부</option>
	<option value='funding'<c:if test="${kinds eq 'funding' }">selected="selected"</c:if>>펀딩</option>

</select>

<select name="field">
	<option value='id' <c:if test="${field eq 'id' }">selected="selected"</c:if>>아이디</option>
	<option value='title' <c:if test="${field eq 'title' }">selected="selected"</c:if>>글제목</option>
</select>

<input type="text" class="form-control" name="keyword" placeholder="search">
<input type="submit" value="찾기">

</form>
</div>

</body>
</html>