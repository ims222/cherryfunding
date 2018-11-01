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
  		
  	 /* 	$(document).ready(function(){
  			
  			$("#id1").click(function(){
  				
  				$('#myModal').modal('show');
  				
  			});
  			
  	
  			
  			

  			
  		}); */
  	 	function abc(cc){
 
  			$('#myModal').modal('show');
  			
  			$('#btn1').click(function(){
  				var value = cc;
  				var url = "<c:url value='/admypage/confirm?num="+value+"'/>";
  				location.href=url;  				
  			});
  			
  	 	};
  	
  
  </script>
  
  
</head>
<body>
	<h2>승인 목록</h2>
	
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
	
		<c:forEach var="vo" items="${vo }">
		<c:set var="name" value="${vo.fNum }"/>
			<tr>
				<td>${vo.fNum }</td>
				<td>${vo.aid }</td>
				<td>${vo.title }</td>
				<td>${vo.category }</td>
				<td>${vo.regdate }</td>
				<td><a href="<c:url value='/fundingList/detail?num=${vo.fNum }'/>">상세보기</a></td>
				<td id="mm"><a data-toggle="modal" href="javascript:abc('${vo.fNum}');">${vo.confirm }</a></td>
			
			</tr>
		</c:forEach>
		
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


<select>

	 <input type="text" class="form-control" id="search" aria-describedby="emailHelp" placeholder="search">

</select>













</body>
</html>